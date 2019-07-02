# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=phimal/minimal
FROM $BASE_CONTAINER

LABEL maintainer="Gert-Jan Both"

USER $NB_UID

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes \
    'tensorflow=1.13.*' &&\
    conda install --quiet --yes -c pytorch pytorch-cpu=1.1.* &&\
    conda clean --all -f -y && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER root
