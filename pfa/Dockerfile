##### Download base image #####
FROM gianpy15/ubuntu18
MAINTAINER Gianpaolo Di Pietro

##### Environment Variables #####
ENV PATH "/root/Libraries/conda/bin:$PATH"
ENV PATH "/root/Libraries/conda/envs:$PATH"
ENV PATH "/root/Libraries/conda/envs/py36/bin:$PATH"
ENV GRASPIT "/root/Libraries/graspit"
ENV PFA_DATA_DIR "/root/workspace/pfa/data"
ENV PSB_DIR "/root/workspace/psb"
ENV GRASPIT_PLUGIN_DIR "/root/workspace/PhysicsForAffordances/build"
ENV DISPLAY :19

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

# GraspIt! dependencies
RUN apt install -y libqt4-dev libqt4-opengl-dev libqt4-sql-psql libcoin80-dev libsoqt4-dev libblas-dev liblapack-dev libqhull-dev libeigen3-dev

# Utilities.
RUN apt install -y bc wget curl libfreetype6-dev libzmq3-dev pkg-config software-properties-common unzip zip libsm6 libxext6 libfontconfig1 libxrender1

# PFA Dependencies
RUN apt install -y libcgal-dev

# Display
RUN apt install -y x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps xvfb

RUN apt clean
RUN apt autoremove -y

WORKDIR /root/Libraries

##### CMake installation #####
RUN apt purge --auto-remove -y cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.3/cmake-3.14.3.tar.gz
RUN tar -xzvf cmake-3.14.3.tar.gz
WORKDIR /root/Libraries/cmake-3.14.3
RUN ./bootstrap
RUN make -j4
RUN make install

##### GraspIt! installation #####

WORKDIR /root/Libraries
RUN git clone https://github.com/gianpy15/graspit
WORKDIR /root/Libraries/graspit
RUN mkdir build
WORKDIR /root/Libraries/graspit/build
RUN cmake ..
RUN make -j4

##### Miniconda installation #####
WORKDIR /root/Libraries
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN chmod +x miniconda.sh
RUN ./miniconda.sh -b -p /root/Libraries/conda
RUN rm miniconda.sh
RUN /root/Libraries/conda/bin/conda clean -tipsy
RUN ln -s /root/Libraries/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
RUN echo ". /root/Libraries/conda/etc/profile.d/conda.sh" >> ~/.bashrc
RUN echo ". /root/Libraries/conda/etc/profile.d/conda.sh" >> ~/.zshrc

##### Create env for tasker #####
RUN conda create -y -n pfa python=3.7 pip
RUN echo ". activate pfa" >> ~/.zshrc

# Install requirements and update conda packages
COPY requirements.yml /root/requirements.yml
RUN /bin/bash -c ". activate pfa && conda env update -f=/root/requirements.yml"
RUN /bin/bash -c ". activate pfa && conda list"
RUN conda update -n base -c defaults conda

COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

WORKDIR /root
ENTRYPOINT ["zsh", "/root/run.sh"]
