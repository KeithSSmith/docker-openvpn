#!/bin/bash

OVPN_DATA=$(pwd)

docker stop openvpn
docker rm openvpn

docker run -d \
  --name openvpn \
  -p 36036:1194/udp \
  -v ${OVPN_DATA}/openvpn_data/:/etc/openvpn \
  --restart=unless-stopped \
  --cap-add=NET_ADMIN \
  openvpn
