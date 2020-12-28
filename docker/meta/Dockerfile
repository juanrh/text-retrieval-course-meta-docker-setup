FROM ubuntu:14.04

# https://meta-toolkit.org/setup-guide.html#ubuntu-1404-lts-build-guide

ARG UID
ARG GID

RUN apt-get update
RUN apt-get install -y sudo

# this might take a while
RUN sudo apt-get install -y software-properties-common

# add the ppa for cmake
RUN sudo add-apt-repository ppa:george-edison55/cmake-3.x
RUN sudo apt-get update

# install dependencies
RUN sudo apt-get -y install g++ cmake libicu-dev git libjemalloc-dev zlib1g-dev

# Run as my user instead of as root
RUN export uid=$UID gid=$GID && \
    mkdir -p /home/dev && \
    echo "dev:x:${uid}:${gid}:dev,,,:/home/dev:/bin/bash" >> /etc/passwd && \
    echo "dev:x:${uid}:" >> /etc/group && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev && \
    chown ${uid}:${gid} -R /home/dev
USER dev
ENV HOME /home/dev

# For meta
RUN sudo apt-get -y install git
 
## For building MeTA
COPY find_icu.patch $HOME/find_icu.patch
COPY build_meta.sh $HOME/build_meta.sh

WORKDIR /opt/course/
