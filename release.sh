#!/usr/bin/env bash

set -euo pipefail


# slim versions

docker build \
    --build-arg QUARTUS_URL=http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar \
    --build-arg QUARTUS_SETUP_COUNT=82 \
    -t theypsilon/quartus-lite-c5:17.0.docker0 .
docker push theypsilon/quartus-lite-c5:17.0.docker0

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
