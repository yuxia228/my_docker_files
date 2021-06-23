FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
    && apt-get install -y \
       gawk wget git-core diffstat unzip texinfo gcc-multilib \
       build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
       xterm locales curl vim sudo rsync bc \
       \
       openjdk-8-jdk git-core gnupg flex bison \
       gperf build-essential zip curl zlib1g-dev gcc-multilib ccache \
       g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
       libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils liblz4-tool \
       xsltproc unzip python-networkx python-wand python-crypto liblz4-tool bc \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 -R /home

# Locales
RUN dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

