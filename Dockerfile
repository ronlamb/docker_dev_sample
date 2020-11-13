# Set user and other arguments
ARG USER=docker
ARG UID=1000
ARG GID=1000
ARG PW=docker
ARG DEBIAN_FRONTEND="noninteractive"

FROM ubuntu:20.04 as base-build-python

ARG DEBIAN_FRONTEND
ENV TZ="America/New_York"

# Initial setup of development environment
# Installs wget, gnupg and software-properties-common for add-apt-repository commands
# Initial environment allows development of python scripts

RUN apt-get -y update \
 && apt-get -y --no-install-recommends install wget gnupg git sudo \
    ca-certificates software-properties-common \
    python3.8 python3.8-distutils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Add minimal X packages and install Visual Studio Code
FROM base-build-python AS base-build-gui
ARG DEBIAN_FRONTEND

# Add Visual Studio Repository
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

RUN apt-get -y update \
 && apt-get -y --no-install-recommends install \
    libx11-xcb1 x11-apps libasound2 libxcb-dri3-0 \
    xterm \
 && apt-get -y install code \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Build the final version
FROM base-build-gui AS base-build-user
ARG USER
ARG UID
ARG GID
ARG PW

# Setup the user
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
 && usermod -aG sudo ${USER}

USER ${UID}:${GID}
WORKDIR /home/${USER}
