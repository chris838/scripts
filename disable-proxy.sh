#!/bin/bash

sudo killall ssh
sudo networksetup -setsocksfirewallproxystate Wi-Fi off
#sudo networksetup -setsocksfirewallproxystate Ethernet off
sudo networksetup -setsocksfirewallproxystate Thunderbolt\ Ethernet off
echo "SOCKS proxy disabled."