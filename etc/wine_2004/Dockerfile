#####################################################
# This file is created refering following page:     #
# https://qiita.com/syui/items/b43ba220d9cd1e2fb74f #
#####################################################
FROM ubuntu:20.04

RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install --no-install-recommends software-properties-common wget sudo -y
RUN mkdir -pm755 /etc/apt/keyrings
RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
RUN apt-get update -y
RUN apt install --install-recommends winehq-stable -y
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get install language-pack-ja -y && update-locale LANG=ja_JP.UTF-8
RUN apt-get install fonts-takao fonts-takao-gothic fonts-takao-pgothic fonts-takao-mincho
RUN apt-get install unzip make python3-pip -y
RUN apt-get install xvfb x11-utils -y
RUN apt-get purge software-properties-common -y
RUN apt-get autoclean -y
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/wineuser && \
    echo "wineuser:x:${uid}:${gid}:Developer,,,:/home/wineuser:/bin/bash" >> /etc/passwd && \
    echo "wineuser:x:${uid}:" >> /etc/group && \
    echo "wineuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wineuser && \
    chmod 0440 /etc/sudoers.d/wineuser && \
    chown ${uid}:${gid} -R /home/wineuser

USER wineuser
ENV HOME /home/wineuser
ENV LANG ja_JP.UTF-8
WORKDIR /home/wineuser
CMD /bin/bash
