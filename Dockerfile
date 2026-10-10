FROM docker.io/library/debian:testing-20260824-slim

# renovate: datasource=deb depName=xvfb registryUrl=https://deb.debian.org/debian?suite=testing&components=main&binaryArch=amd64
ENV XVFB_VERSION="2:21.1.24-1"

RUN \
    echo 'APT::Install-Recommends "false";' >>/etc/apt/apt.conf &&\
    echo 'APT::Install-Suggests "false";' >>/etc/apt/apt.conf &&\
    export DEBIAN_FRONTEND=noninteractive &&\
    apt-get -q -y update &&\
    apt-get -q -y dist-upgrade --auto-remove &&\
    apt-get -q -y install \
        ca-certificates \
        xvfb=${XVFB_VERSION} \
        dbus-x11 \
        xauth \ 
        x11vnc \
        novnc \
        websockify \
        xterm

ENV HOME=/xvfb
ENV NO_AT_BRIDGE=1
ENV SHELL=/bin/bash
ENV XDG_RUNTIME_DIR=xdg

ADD xvfb-cmd /usr/local/bin/
ADD xvfb-vnc /usr/local/bin/
