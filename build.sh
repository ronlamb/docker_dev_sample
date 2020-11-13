#!/bin/bash
# 
# Shell script to build the environment.

if [ ! -d logs ] ; then
   mkdir logs
fi

docker build . --tag devops | tee logs/build.log
