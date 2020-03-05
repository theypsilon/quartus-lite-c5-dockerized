FROM debian:jessie-backports

WORKDIR /quartus
ADD files/ /files/

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    wget http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar && \
    tar xvf Quartus-lite-17.0.0.595-linux.tar && \
    /files/quartus-setup && \
    rm -rf /quartus/* && \
    apt-get remove -y --auto-remove wget expect && \
    rm -rf /var/lib/apt/lists/*

ENV LD_PRELOAD /usr/lib/libtcmalloc_minimal.so.4