#!/bin/bash

# Use : give me 1 Bastion-server Ip-address as Positional Parameter

sudo yum install iptables

sudo iptables -A INPUT -s $1 -j ACCEPT
sudo iptables -A INPUT -j DROP

sudo /sbin/iptables -save