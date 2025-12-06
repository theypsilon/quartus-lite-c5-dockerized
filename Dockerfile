FROM ubuntu:14.04 AS quartus_builder
LABEL maintainer="theypsilon@gmail.com"

RUN apt-get update && \
    apt-get -y install --no-install-recommends curl expect && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /quartus
COPY files/ /files/
ARG QUARTUS_URL
ARG QUARTUS_SHA1
ARG QUARTUS_UPDATE

RUN curl --fail --silent --show-error --location --retry 5 --retry-delay 10 --continue-at - -o quartus.tar ${QUARTUS_URL} && \
    echo "${QUARTUS_SHA1}  quartus.tar" | sha1sum -c - && \
    tar xvf quartus.tar && rm quartus.tar && \
    /files/quartus-setup "/quartus/setup.sh" "${QUARTUS_UPDATE}" && \
    rm -rf /quartus/* && \
    rm -rf /files

FROM ubuntu:14.04 AS quartus_slim
LABEL maintainer="theypsilon@gmail.com"

COPY --from=quartus_builder /opt/intelFPGA_lite /opt/intelFPGA_lite

RUN apt-get update && \
    apt-get -y install --no-install-recommends locales libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /opt/intelFPGA_lite/nios2eds && \
    rm -rf /opt/intelFPGA_lite/ip && \
    rm -rf /opt/intelFPGA_lite/hls && \
    rm -rf /opt/intelFPGA_lite/quartus/linux64/helpdb

WORKDIR /project
ENV LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4 \
    PATH=/opt/intelFPGA_lite/quartus/bin:$PATH

FROM ubuntu:14.04 AS quartus_heavy
LABEL maintainer="theypsilon@gmail.com"

COPY --from=quartus_builder /opt/intelFPGA_lite /opt/intelFPGA_lite

RUN apt-get update && \
    apt-get -y install --no-install-recommends locales libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /project
ENV LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4 \
    PATH=/opt/intelFPGA_lite/quartus/bin:$PATH
