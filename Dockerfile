FROM ubuntu:16.04

MAINTAINER robbie.petit@gmail.com

# Bioconda
RUN cd /tmp/ \
    && apt-get -qq update 
    && apt-get -qq -y --no-install-recommends install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /opt/conda \
    && conda install -y python=3.5.4 \
    && conda update conda \
    && conda config --add channels r \
    && conda config --add channels defaults \
    && conda config --add channels conda-forge \
    && conda config --add channels bioconda \
    && conda install -y java-jdk
    && curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin \
    && chmod 755 /usr/local/bin/nextflow \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && conda clean --all --yes \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log /tmp/* /var/tmp/*
    
ENV PATH /opt/conda/bin:$PATH

CMD ["nextflow"]
