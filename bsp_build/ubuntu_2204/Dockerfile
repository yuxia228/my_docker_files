FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
    && apt-get install -y \
       gawk wget git-core diffstat unzip texinfo gcc-multilib \
       build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
       xterm locales curl vim sudo rsync bc \
       \
       openjdk-8-jdk git-core gnupg flex bison \
       gperf build-essential zip curl zlib1g-dev gcc-multilib ccache \
       g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
       libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils liblz4-tool \
       xsltproc unzip python3-networkx python3-wand liblz4-tool bc \
       apt-transport-https ca-certificates ninja-build \
       ninja-build dosfstools libncurses-dev flex bison \
       screen libncurses-dev ninja-build dosfstools \
       python3-pygit2 python3-venv python3-pyelftools protobuf-compiler gperf pigz \
       zstd simg2img libncurses5 python3-pycryptodome libssl-dev lzop \
       lld libelf-dev dwarves openjdk-11-jdk pigz cmake file device-tree-compiler fdisk \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 777 -R /home

RUN pip3 install pygit2
RUN pip3 install git+https://github.com/xen-troops/moulin
RUN pip3 install meson mako west
RUN pip3 install -U pip setuptools wheel

# Locales
RUN dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
RUN update-ca-certificates

