#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)

Usage () {
    echo "Usage:"
    echo "  $0 <build_dir or all>"
    echo "Example:"
    echo "  All build"
    echo "    $0 all"
    echo "  Specific container build"
    echo "    $0 ./yocto_build/ubuntu_2004/"
}

build_docker_image () {
    NAME=$1
    TAG=$2
    DOCKER_FILE_DIR=$3
    docker build -t $NAME:$TAG $DOCKER_FILE_DIR --no-cache
}

if [ $# -ne 1 ];then
    Usage; exit;
fi

cd $SCRIPT_DIR/../
# single build
if [ "$1" != "all" ]; then
    DOCKER_FILE_DIR=$1
    TARGET_OS=$(echo $DOCKER_FILE_DIR | cut -f1 -d'_' | sed 's|.*/||')
    UBUNTU_VER=$(echo `basename $DOCKER_FILE_DIR` | cut -f2 -d'_')
    build_docker_image $TARGET_OS $UBUNTU_VER $DOCKER_FILE_DIR
else
# all build
    TARGET_DIRS=$(ls | grep _build)
    for DIR in ${TARGET_DIRS}; do
        for item in $(ls ./$DIR/); do
            DOCKER_FILE_DIR=./$DIR/$item/
            TARGET_OS=$(echo $DIR | cut -f1 -d'_')
            UBUNTU_VER=$(echo $item | cut -f2 -d'_')
            echo $DOCKER_FILE_DIR $TARGET_OS $UBUNTU_VER
            build_docker_image $TARGET_OS $UBUNTU_VER $DOCKER_FILE_DIR
        done
    done
fi

