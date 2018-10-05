FROM node:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && npm install jison -g

COPY ./Jison/start /start
RUN sed -i 's/\r//' /start
RUN chmod +x /start