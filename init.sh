#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)
cd ${SCRIPT_DIR}

if [ -e ${HOME}/bin ]; then 
    mkdir -p ${HOME}/bin
fi

for item in $(ls ./script/); do
    ln -sf ${SCRIPT_DIR}/script/$item ${HOME}/bin/$item
done

