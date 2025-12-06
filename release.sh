#!/usr/bin/env bash
# Copyright 2020 José Manuel Barroso Galindo <theypsilon@gmail.com>

set -euo pipefail

release() {
    local image_name="$1"
    local target_step="$2"
    local quartus_url="$3"
    local quartus_sha1="$4"
    local quartus_update="${5:-}"

    docker build \
        --target "${target_step}" \
        --build-arg QUARTUS_URL="${quartus_url}" \
        --build-arg QUARTUS_SHA1="${quartus_sha1}" \
        --build-arg QUARTUS_UPDATE="${quartus_update}" \
        -t "${image_name}" .
    docker images "${image_name}" --format '{{.Repository}}:{{.Tag}} {{.Size}}' >> sizes.txt
    docker push "${image_name}"
    docker image rm -f "${image_name}" || true
    docker builder prune -f --keep-storage=30G
}

VERSION=$(cat version.txt)
echo "# Image sizes for version ${VERSION}" > sizes.txt
echo "# Format: image_tag size" >> sizes.txt
echo "" >> sizes.txt


release "theypsilon/quartus-lite-c5:17.0.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar" \
    "e71eeca4c8e1efaca902a58a37544c0572c6f45e"

release "theypsilon/quartus-lite-c5:17.0.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_tar/Quartus-lite-17.0.0.595-linux.tar" \
    "e71eeca4c8e1efaca902a58a37544c0572c6f45e"


release "theypsilon/quartus-lite-c5:17.0.2.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar" \
    "02aebab728d54e3ca8660d2646fdf93bc669b0ac" \
    "Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602"

release "theypsilon/quartus-lite-c5:17.0.2.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar" \
    "02aebab728d54e3ca8660d2646fdf93bc669b0ac" \
    "Quartus Prime Lite Edition (Free)  - Quartus Prime Update 17.0.2.602"


release "theypsilon/quartus-lite-c5:17.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar" \
    "b5f40bdcb6846269bff2c8fea698f85125bd654c"

release "theypsilon/quartus-lite-c5:17.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_tar/Quartus-lite-17.1.0.590-linux.tar" \
    "b5f40bdcb6846269bff2c8fea698f85125bd654c"


release "theypsilon/quartus-lite-c5:18.0.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar" \
    "d8090b766e74f6194c7193b36f221547ba8ea594"

release "theypsilon/quartus-lite-c5:18.0.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/18.0std/614/ib_tar/Quartus-lite-18.0.0.614-linux.tar" \
    "d8090b766e74f6194c7193b36f221547ba8ea594"


release "theypsilon/quartus-lite-c5:18.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar" \
    "23ef7030b1153c3f4bd20b7b320847079e3235fa"

release "theypsilon/quartus-lite-c5:18.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar" \
    "23ef7030b1153c3f4bd20b7b320847079e3235fa"


release "theypsilon/quartus-lite-c5:19.1.docker${VERSION}" "quartus_slim" \
    "http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar" \
    "13240b6aa9a4643225fcac78ad491e703e7de070"

release "theypsilon/quartus-lite-c5:19.1.dockerheavy${VERSION}" "quartus_heavy" \
    "http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar" \
    "13240b6aa9a4643225fcac78ad491e703e7de070"

# @TODO
# Quartus 13.1: http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_tar/Quartus-web-13.1.0.162-linux.tar
# Quartus 13.0sp1: http://download.altera.com/akdlm/software/acdsinst/13.0sp1/232/ib_tar/Quartus-web-13.0.1.232-linux.tar
