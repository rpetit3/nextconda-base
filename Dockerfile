FROM conda/miniconda3:latest

MAINTAINER robbie.petit@gmail.com

# Bioconda
RUN conda update conda \
    && conda config --add channels r \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda \
    && conda install -y nextflow==0.30.2 \
    && conda clean --all --yes

CMD ["nextflow"]
