FROM ubuntu:latest as SML-base

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y smlnj

COPY ./start /start
RUN sed -i 's/\r//' /start
RUN chmod +x /start
