FROM ubuntu:14.04
LABEL maintainer="theypsilon@gmail.com"
WORKDIR /quartus
ADD files/ /files/
ARG QUARTUS_URL
ARG QUARTUS_SETUP_COUNT
ARG QUARTUS_UPDATE
RUN apt-get update && apt-get -y install locales expect curl libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    curl -o quartus.tar ${QUARTUS_URL} && \
    tar xvf quartus.tar && \
    /files/quartus-setup "${QUARTUS_SETUP_COUNT}" "${QUARTUS_UPDATE}" && \
    rm -rf /quartus/* && \
    apt-get remove -y --auto-remove curl expect && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /opt/intelFPGA_lite/nios2eds && \
    rm -rf /opt/intelFPGA_lite/ip && \
    rm -rf /opt/intelFPGA_lite/hls
ENV LD_PRELOAD /usr/lib/libtcmalloc_minimal.so.4