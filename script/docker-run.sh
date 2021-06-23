#!/bin/bash
IMAGE_LIST=`docker images | grep -e yocto -e android | awk '{print ""$1 ":" $2}'`

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

HOSTNAME=$(echo $DOCKER_IMAGE_NAME | sed -e 's/:/_/')
WORK_DIR=`pwd`
cd ~
docker run -it --rm\
    -u $(id -u):$(id -g) \
    -v $(pwd):$(pwd) \
    -w ${WORK_DIR} \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /etc/sudoers.d:/etc/sudoers.d:ro \
    --hostname="$HOSTNAME" \
    ${DOCKER_OPTION} \
    ${DOCKER_IMAGE_NAME} \
    $CMD

