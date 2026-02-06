#!/bin/bash
if [[ "$(docker images | grep TAG)" == "" ]]; then
    IMAGE_LIST=`docker images \
        | grep -e yocto -e android -e wine -e fedora -e cent -e alma -e bsp \
        | awk '{print $1}' \
    `
else
    IMAGE_LIST=`docker images \
        | grep -e yocto -e android -e wine -e fedora -e cent -e alma -e bsp \
        | awk '{print ""$1 ":" $2}' \
    `
fi

Usage ()
{
    echo "Usage:"
    echo "    $0 {yocto_image_name}"
    echo "LIST:"
    echo "$IMAGE_LIST"
    exit
}

if [ $# -lt 1 ]; then
    Usage
fi

DOCKER_IMAGE_NAME=$1
if ! `IFS=$'\n'; echo "${IMAGE_LIST[*]}" | grep -qx "${DOCKER_IMAGE_NAME}"`; then
    Usage
fi
shift

CMD="/bin/bash"
if [ $# -gt 0 ]; then
   CMD="$*"
fi

DL_DIR_OPT=""
if [ -n $DL_DIR ]; then
    DL_DIR_OPT="-e DL_DIR -v ${DL_DIR}:${DL_DIR}"
fi

HOSTNAME=$(echo $DOCKER_IMAGE_NAME | sed -e 's/:/_/')
WORK_DIR=`pwd`
cd ~
sudogroup=sudo
ADDITIONAL_OPT=""
if [[ "$(echo ${DOCKER_IMAGE_NAME} | grep -v fedora | grep -v cent | grep -v alma)" != "" ]]; then
    echo Hello Ubuntu container
else ## fedora/cent
    echo Hello fedora container
    sudogroup=wheel
    # ADDITIONAL_OPT="--group-add=mock"
fi
docker run -it --rm\
    -u $(id -u):$(id -g) \
    --group-add="$sudogroup" \
    ${ADDITIONAL_OPT} \
    -v $(pwd):$(pwd) \
    -v ${WORK_DIR}:${WORK_DIR} \
    -w ${WORK_DIR} \
    ${DL_DIR_OPT} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    --hostname="$HOSTNAME" \
    --security-opt seccomp=unconfined \
    ${DOCKER_OPTION} \
    ${DOCKER_IMAGE_NAME} \
    $CMD
