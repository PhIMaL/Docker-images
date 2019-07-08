FROM nvcr.io/nvidia/pytorch:19.06-py3

RUN conda install --quiet --yes -c conda-forge nodejs &&\
    conda clean --all -f -y &&\
    jupyter labextension install @jupyterlab/toc &&\
    npm cache clean --force
