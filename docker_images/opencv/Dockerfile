FROM nvcr.io/nvidia/pytorch:19.11-py3

#Installing jupyterhub
RUN conda install --quiet --yes -c conda-forge jupyterhub seaborn tensorboard &&\
    conda install --quiet --yes -c conda-forge opencv xlsxwriter &&\
    conda clean --all -f -y

CMD ["jupyterhub-singleuser"]






