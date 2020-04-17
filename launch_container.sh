#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
CONTAINER_NAME=$1

if [ "x$CONTAINER_NAME" = "x" ]
then
    echo "Usage: ./launch_container.sh <docker name>"
    exit 1
fi

docker run --privileged --rm -it \
           --volume=$XSOCK:$XSOCK:rw \
           --volume=$XAUTH:$XAUTH:rw \
           --volume=/dev:/dev:rw \
	   --volume=/tmp:/tmp:rw \
	   --shm-size=1gb \
           --env="XAUTHORITY=${XAUTH}" \
           --env="DISPLAY=${DISPLAY}" \
           --env=TERM=xterm-256color \
           --env=QT_X11_NO_MITSHM=1 \
           --net=host \
           -u "nvidia"  \
	   --name $CONTAINER_NAME \
           jetson:latest \
           bash
