#!/usr/bin/env bash
# Copyright 2020 José Manuel Barroso Galindo <theypsilon@gmail.com>

set -euo pipefail

VERSION=$(cat version.txt)

echo "# Image sizes for version ${VERSION}" > sizes.txt
echo "# Format: image_tag size" >> sizes.txt
echo "" >> sizes.txt

# slim versions

release() {
    local image_name="$1"
    local target_step="$2"
    local quartus_url="$3"
    local quartus_setup_count="$4"
    local quartus_update="${5:-}"

    docker build \
        --target "${target_step}" \
        --build-arg QUARTUS_URL="${quartus_url}" \
        --build-arg QUARTUS_SETUP_COUNT="${quartus_setup_count}" \
        --build-arg QUARTUS_UPDATE="${quartus_update}" \
        -t "${image_name}" .
    docker images "${image_name}" --format '{{.Repository}}:{{.Tag}} {{.Size}}' >> sizes.txt
    docker push "${image_name}"
    docker image prune -f
    docker image rm -f "${image_name}" || true
}

release "theypsilon/quartus-lite-c5:17.0.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar" \
    "82"

release "theypsilon/quartus-lite-c5:17.0.2.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar" \
    "82" \
    "Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602"

release "theypsilon/quartus-lite-c5:17.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar" \
    "88"

release "theypsilon/quartus-lite-c5:18.0.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar" \
    "45"

release "theypsilon/quartus-lite-c5:18.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar" \
    "45"

release "theypsilon/quartus-lite-c5:19.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar" \
    "48"

# heavy versions

release "theypsilon/quartus-lite-c5:17.0.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar" \
    "82"

release "theypsilon/quartus-lite-c5:17.0.2.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar" \
    "82" \
    "Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602"

release "theypsilon/quartus-lite-c5:17.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar" \
    "88"

release "theypsilon/quartus-lite-c5:18.0.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar" \
    "45"

release "theypsilon/quartus-lite-c5:18.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar" \
    "45"

release "theypsilon/quartus-lite-c5:19.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar" \
    "48"

# @TODO
# Quartus 13.1: http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_tar/Quartus-web-13.1.0.162-linux.tar
# Quartus 13.0sp1: http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_tar/Quartus-web-13.0.1.232-linux.tar
