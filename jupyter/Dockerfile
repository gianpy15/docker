FROM jupyter/datascience-notebook
MAINTAINER Gianpaolo Di Pietro

USER root

RUN apt-get update
RUN apt-get install -y htop vim

USER jovyan

RUN pip install npm
RUN pip install jupyterlab
RUN pip install tqdm
RUN pip install plotly
RUN pip install ipywidgets
RUN jupyter serverextension enable --py jupyterlab

WORKDIR /exp

ENTRYPOINT ["/opt/conda/bin/jupyter", "lab"]
CMD ["--notebook-dir='/exp'"]
