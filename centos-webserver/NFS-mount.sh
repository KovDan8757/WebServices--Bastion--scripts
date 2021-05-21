#!/bin/bash

# Use : give me 1 Bastion-server Ip-address as Positional Parameters

sudo yum install nfs-utils -y 

sudo mkdir -p /mnt/backup

sudo mount -t nfs $1:/mnt/shared/web1 /mnt/backup

sudo cat << EOF > /etc/fstab
$1:/mnt/shared/web1          /mnt/backup             nfs     defaults        0 0
EOF

