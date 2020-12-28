#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
image_name='meta:devel'
container_name='meta'
default_course_home="${HOME}/git/text-retrieval-course"

function meta_image_build {
  # pass user and group ids to run as my user instead of root
  docker image build \
    --build-arg UID=$(id -u) --build-arg GID=$(id -g) \
    -t "${image_name}" \
    "${SCRIPT_DIR}/meta"
}

function meta_container_run {
  COURSE_HOME=${1:-${default_course_home}}
  CMD=${2:-bash}

  meta_image_build
  docker container run --rm \
    -v "${COURSE_HOME}":/opt/course \
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
  COURSE_HOME=${1:-${default_course_home}}
  
  meta_container_run "${COURSE_HOME}" /home/dev/build_meta.sh
}


