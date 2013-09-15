#!/bin/bash
DIR=$(cd "$(dirname "$0")"; pwd)
cd ${DIR}/express-vpn
sudo openvpn2 --config 12-HongKong.ovpn &