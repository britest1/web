#!/bin/bash

# Debug mod
set -x;

apt-get -yqq update
apt-get -yqq upgrade
apt-get -yqq install \
    apt-utils \
    build-essential \
    debconf-utils \
    debconf \
    git \
    unzip \
    wget \
    curl \
    openssh-client \
    nano \
    telnet \
    gzip \
    net-tools \
    lsof \
    sshpass \
    emacs
