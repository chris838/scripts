#!/bin/bash
disable_proxy()
{
    killall ssh
    networksetup -setsocksfirewallproxystate Wi-Fi off
    networksetup -setsocksfirewallproxystate Ethernet off
    echo "SOCKS proxy disabled."
}
trap disable_proxy INT
 
networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 8080
networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 8080
networksetup -setsocksfirewallproxystate Wi-Fi on
networksetup -setsocksfirewallproxystate Ethernet on
echo "SOCKS proxy enabled."
echo "Tunneling..."
ssh -D 8080 -Nf root@zvps.co