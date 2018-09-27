#!/bin/bash

OVPN_DATA=$(pwd)
OVPN_PORT=1194
DOCKER_HOST_PORT=1194

docker stop openvpn
docker rm openvpn

docker run -d \
  --name openvpn \
  -p ${DOCKER_HOST_PORT}:${OVPN_PORT}/udp \
  -v ${OVPN_DATA}/openvpn_data/:/etc/openvpn \
  --restart=unless-stopped \
  --cap-add=NET_ADMIN \
  openvpn
