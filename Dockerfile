FROM node:boron
MAINTAINER Hugo Dias <mail@hugodias.me>

ENV RUNTIME_PACKAGES yarn=0.20.3-1 \
    rsync

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y && apt-get install --fix-missing && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends ${RUNTIME_PACKAGES} && \
    apt-get clean && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/*
