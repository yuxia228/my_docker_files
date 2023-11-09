FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
    && apt-get install -y \
       gawk wget git-core diffstat unzip texinfo gcc-multilib \
       build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
       xterm \ 
       locales \
       curl \
       vim \
       rsync \
       sudo \
       bc rsync\
       apt-transport-https ca-certificates zstd liblz4-tool \
       ninja-build dosfstools libncurses-dev flex bison \
       screen libncurses-dev ninja-build dosfstools \
       python3-pygit2 python3-venv python3-pyelftools protobuf-compiler gperf \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 -R /home

RUN wget https://apt.kitware.com/kitware-archive.sh \
    && bash kitware-archive.sh \
    && apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
    && apt-get install -y cmake \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pygit2
RUN pip3 install git+https://github.com/xen-troops/moulin


# Locales
RUN dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN update-ca-certificates

