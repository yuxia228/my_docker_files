#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)
TARGET_DIRS=$(ls | grep _build)

cd $SCRIPT_DIR/../
for DIR in ${TARGET_DIRS}; do
    for item in $(ls ./$DIR/); do
        DOCKER_FILE_DIR=./$DIR/$item/
        TARGET_OS=$(echo $DIR | cut -f1 -d'_')
        UBUNTU_VER=$(echo $item | cut -f2 -d'_')
        echo $DOCKER_FILE_DIR $TARGET_OS $UBUNTU_VER
        docker build -t $TARGET_OS:$UBUNTU_VER $DOCKER_FILE_DIR
    done
done

