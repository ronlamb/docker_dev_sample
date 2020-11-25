# Development Docker build

Create a container to develop code in. 

For years I have maintained several different Virtual Machines to practice
development in.  However this was wasteful on both disk space, and time 
consuming to reset the VM's.  

I have been learning Docker for the last year or two and figured I could
now use docker to eliminate the need for four different VM's.

Right now I am basically using it to learn Python.

This also allows me to practice tuning a docker container.

# Contents
This container contains the following
* Visual Studio Code - for developments
* python

It will also allow the addition of the following if needed.
* java jdk 1.11
* Gnu C Compiler
* vim and gvim

# Scripts

The following scripts are used.
## build.sh
Builds the container.

## run.sh
Runs the container.

# Notes:
This currently is built under ubuntu, to allow easy install of Visual Studio Code.

Problem is the size of the container is fairly large.  

Future enhancements is to attemp build it under alpine for a smaller size
