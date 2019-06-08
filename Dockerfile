##
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

##
RUN apt-get update \
    && apt-get -y install software-properties-common apt-utils \
    && add-apt-repository ppa:gophers/archive

RUN apt-get update \
    && apt-get -y install \
        curl \
        git \
        cython \
        python-numpy \
        python-dev \
        make clang-6.0 golang-1.11-go libz-dev libbz2-dev liblzma-dev

# Add golang to path
ENV PATH /usr/lib/go-1.11/bin:$PATH

# Install rustup from https://www.rustup.rs/ . Then:
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s - -y

ENV PATH $HOME/.cargo/bin:$PATH

RUN rustup install 1.28.0
RUN rustup default 1.28.0

# Node 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get update \
    && apt-get -y install nodejs

##