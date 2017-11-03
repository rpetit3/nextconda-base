FROM ubuntu:16.04

MAINTAINER robbie.petit@gmail.com

# Bioconda
RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes \
    && conda config --add channels r \
    && conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda \
    && conda install -y java-jdk

ENV PATH /opt/conda/bin:$PATH

# Nextflow
RUN cd /tmp \
    && curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin \
    && chmod 755 /usr/local/bin/nextflow

CMD ["nextflow"]
