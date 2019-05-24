FROM jupyter/datascience-notebook
MAINTAINER Gianpaolo Di Pietro

USER root

RUN apt-get update
RUN apt-get install -y htop vim

USER jovyan

RUN pip install npm
RUN pip install jupyterlab
RUN pip install tqdm
RUN jupyter serverextension enable --py jupyterlab

WORKDIR /exp
CMD ["/opt/conda/bin/jupyter", "lab", "--notebook-dir='/exp'"]
