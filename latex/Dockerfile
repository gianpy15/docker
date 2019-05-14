##### Download base image #####
FROM ubuntu:18.04
MAINTAINER Gianpaolo Di Pietro

##### Update ubuntu #####
RUN apt update
RUN apt -y upgrade
RUN apt install -y --no-install-recommends apt-utils

##### Latex Utilities #####
RUN apt install -y texlive-latex-extra texlive-science texlive-publishers
RUN apt clean
RUN apt autoremove -y

WORKDIR /source
CMD ["/bin/bash"]
