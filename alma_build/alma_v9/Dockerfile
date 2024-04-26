FROM almalinux:9

RUN dnf -y install epel-release

RUN dnf -y install openssh-server bash sudo
RUN dnf -y install git make gcc flex bison bzip2 rpm-build rpmdevtools
RUN dnf -y install python3 python3-devel
# RUN dnf -y install centos-packager centos-review mock
RUN pip install pathfix.py mock
RUN dnf -y install mock
# utils
RUN dnf -y install wget which zsh

