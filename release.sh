#!/usr/bin/env bash
# Copyright 2020 José Manuel Barroso Galindo <theypsilon@gmail.com>

set -euo pipefail


# slim versions

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=82 \
    -t theypsilon/quartus-lite-c5:17.0.docker0 .
docker push theypsilon/quartus-lite-c5:17.0.docker0

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=82 \
    --build-arg QUARTUS_UPDATE="Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602" \
    -t theypsilon/quartus-lite-c5:17.0.2.docker0 .
docker push theypsilon/quartus-lite-c5:17.0.2.docker0

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=88 \
    -t theypsilon/quartus-lite-c5:17.1.docker0 .
docker push theypsilon/quartus-lite-c5:17.1.docker0

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=45 \
    -t theypsilon/quartus-lite-c5:18.0.docker0 .
docker push theypsilon/quartus-lite-c5:18.0.docker0

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=45 \
    -t theypsilon/quartus-lite-c5:18.1.docker0 .
docker push theypsilon/quartus-lite-c5:18.1.docker0

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=48 \
    -t theypsilon/quartus-lite-c5:19.1.docker0 .
docker push theypsilon/quartus-lite-c5:19.1.docker0


# heavy versions

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=82 \
    -t theypsilon/quartus-lite-c5:17.0.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:17.0.dockerheavy0

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=82 \
    --build-arg QUARTUS_UPDATE="Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602" \
    -t theypsilon/quartus-lite-c5:17.0.2.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:17.0.2.dockerheavy0

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=88 \
    -t theypsilon/quartus-lite-c5:17.1.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:17.1.dockerheavy0

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=45 \
    -t theypsilon/quartus-lite-c5:18.0.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:18.0.dockerheavy0

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=45 \
    -t theypsilon/quartus-lite-c5:18.1.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:18.1.dockerheavy0

docker build \
    -f Dockerfile-heavy \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=48 \
    -t theypsilon/quartus-lite-c5:19.1.dockerheavy0 .
docker push theypsilon/quartus-lite-c5:19.1.dockerheavy0

# @TODO
# Quartus 13.1: http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_tar/Quartus-web-13.1.0.162-linux.tar
# Quartus 13.0sp1: http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_tar/Quartus-web-13.0.1.232-linux.tar
