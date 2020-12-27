#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
image_name='meta:devel'
container_name='meta'

function meta_image_build {
  # pass user and group ids to run as my user instead of root
  docker image build \
    --build-arg UID=$(id -u) --build-arg GID=$(id -g) \
    -t "${image_name}" \
    "${SCRIPT_DIR}/meta"
}

function meta_container_run {
  META_HOME=${1:-${HOME}/git/meta}
  CMD=${2:-bash}
  meta_image_build

  docker container run --rm \
    -v "${META_HOME}":/opt/meta \
    --name "${container_name}" \
    -it "${image_name}" "${CMD}" 
}

function meta_container_shell {
  docker container exec -it "${container_name}" bash
}

function meta_container_shell_root {
  docker container exec -u root -it "${container_name}" bash
}

function meta_build {
  META_HOME=${1:-${HOME}/git/meta}
  
  meta_container_run "${META_HOME}" /home/dev/build_meta.sh
}


