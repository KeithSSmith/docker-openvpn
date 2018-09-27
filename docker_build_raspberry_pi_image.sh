#!/bin/bash

DOCKER_NAME=openvpn
DOCKER_PATH=$(pwd)

docker stop ${DOCKER_NAME}
docker rm ${DOCKER_NAME}
docker rmi ${DOCKER_NAME}

docker build \
  -t ${DOCKER_NAME} \
  -f ${DOCKER_PATH}/Dockerfile.armv7 \
  ${DOCKER_PATH}
