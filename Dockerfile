FROM node:latest
MAINTAINER Hugo Dias <mail@hugodias.me>

ENV RUNTIME_PACKAGES rsync

RUN apt-get update -y && apt-get install --fix-missing && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends ${RUNTIME_PACKAGES} && \
    apt-get clean && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/*
