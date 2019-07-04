# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=phimal/basis:v1.0
FROM $BASE_CONTAINER

LABEL maintainer="Gert-Jan Both"

USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes -c pytorch pytorch-cpu=1.1.* &&\
    conda clean --all -f -y && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER root
