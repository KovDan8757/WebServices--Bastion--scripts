#!/bin/bash

# Use : give me 1 Bastion-server Ip-address as Positional Parameters

sudo apt-get update
sudo apt-get install nfs-common -y 

sudo mkdir -p /mnt/backup

sudo mount $1:/mnt/shared/web2 /mnt/backup

sudo cat << EOF > /etc/fstab 
$1:/mnt/shared/web2          /mnt/backup             nfs     defaults        0 0
EOF