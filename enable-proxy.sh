#!/bin/bash
disable_proxy()
{
    sudo killall ssh
    sudo networksetup -setsocksfirewallproxystate Wi-Fi off
    sudo networksetup -setsocksfirewallproxystate Ethernet off
    echo "SOCKS proxy disabled."
}
trap disable_proxy INT
 
sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 8080
sudo networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 8080
sudo networksetup -setsocksfirewallproxystate Wi-Fi on
sudo networksetup -setsocksfirewallproxystate Ethernet on
echo "SOCKS proxy enabled."
echo "Tunneling..."
ssh -C -D 8080 -Nf root@zvps.co