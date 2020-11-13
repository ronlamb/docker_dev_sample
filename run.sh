#!/bin/bash

#DISPLAY="$(ipconfig | grep IPv4 | head -1 | cut -b40- | tr -d '\r'):0"
#echo "DISPLAY: $DISPLAY"
#export DISPLAY

docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix devops bash
