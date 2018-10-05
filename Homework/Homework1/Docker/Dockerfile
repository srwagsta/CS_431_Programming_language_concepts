FROM ubuntu:latest as pandoc

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y texlive-latex-base \
    && apt-get install -y texlive-fonts-recommended \
    && apt-get install -y texlive-fonts-extra \
    && apt-get install -y texlive-latex-extra \
    && apt-get install -y pandoc

COPY ./start /start
RUN sed -i 's/\r//' /start
RUN chmod +x /start
