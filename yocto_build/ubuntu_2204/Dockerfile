FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
    && apt-get install -y \
       gawk wget git-core diffstat unzip texinfo gcc-multilib \
       build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
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
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 -R /home 

RUN pip3 install importlib_metadata pyyaml packaging

# Locales
RUN dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN update-ca-certificates

