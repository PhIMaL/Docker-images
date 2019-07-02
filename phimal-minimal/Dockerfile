# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/base-notebook:python-3.7.3
FROM $BASE_CONTAINER

LABEL maintainer="Gert-Jan Both"

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes \
    'pandas=0.24*' \
    'matplotlib=3.0*' \
    'seaborn=0.9*' \
    'numpy=1.16.*' \
    'setuptools=41.0.*' \
    'git=2.20.*' && \
    pip install jupyterlab-git &&\
    conda remove --quiet --yes --force qt pyqt && \
    conda clean --all -f -y && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^0.38.* && \
    jupyter labextension install jupyterlab_bokeh@0.6.* && \
    jupyter labextension install @jupyterlab/git@0.5.* && \
    jupyter labextension install @jupyterlab/hub-extension@0.12.* && \
    jupyter serverextension enable --py jupyterlab_git &&\
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
    
# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME /home/$NB_USER/.cache/
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions /home/$NB_USER

USER $NB_UID
