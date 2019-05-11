##### Imge version #####
FROM ubuntu:18.04
MAINTAINER Gianpaolo Di Pietro

##### Update & install packages #####
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server

##### Cleanup Packages #####
RUN apt-get clean
RUN apt-get autoremove

##### Setup ssh #####
RUN echo 'root:pwd' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

CMD service ssh start && /bin/bash 
