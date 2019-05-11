##### Download base image tensorflow gpu #####
FROM tensorflow/tensorflow:devel-gpu
MAINTAINER Gianpaolo Di Pietro

##### Environment variables #####
ENV PATH "/opt/conda/bin:$PATH"
ENV PATH "/opt/conda/envs:$PATH"
ENV PATH "/opt/conda/envs/py36/bin:$PATH"

##### Update ubuntu #####
RUN apt update
RUN apt -y upgrade
RUN apt install -y --no-install-recommends apt-utils

##### Install packages #####

# Conda supports delegating to pip to install dependencies
# that aren’t available in anaconda or need to be compiled
# for other reasons. In our case, we need psycopg compiled
# with SSL support. These commands install prereqs necessary
# to build psycopg.
RUN apt install -y libpq-dev

# Utilities.
RUN apt update 
RUN apt install -y bc wget curl libfreetype6-dev libpng12-dev libzmq3-dev pkg-config software-properties-common unzip zip libsm6 libxext6 libfontconfig1 libxrender1 libav-tools
RUN apt clean
RUN apt autoremove

##### Miniconda installation #####
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN /bin/bash ~/miniconda.sh -b -p /opt/conda
RUN rm ~/miniconda.sh
RUN /opt/conda/bin/conda clean -tipsy
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc

##### Create env for tensorflow #####
RUN conda create -y -n tf python=3.7 pip
# Use this environment as default one
RUN echo ". activate tf" >> ~/.bashrc

# Install requirements and update conda packages
COPY requirements.yml /requirements.yml
RUN /bin/bash -c ". activate tf && conda env update -f=/requirements.yml"
RUN /bin/bash -c ". activate tf && conda list"
RUN conda update -n base -c defaults conda

##### The command to run at the start of the container #####
CMD ["bash"]

##### Set the working directory #####
WORKDIR /root
