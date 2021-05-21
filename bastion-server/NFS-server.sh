#!/bin/bash

# Use : give me 2 client Ip-address as Positional Parameters

sudo apt-get install -y nfs-kernel-server

sudo mkdir -p /mnt/shared/web1
sudo mkdir -p /mnt/shared/web2

sudo cat << EOF > /etc/exports
/mnt/shared/web1 $1(rw,sync)
/mnt/shared/web2 $2(rw,sync)
EOF

sudo chmod 777 /mnt/shared/web1
sudo chmod 777 /mnt/shared/web2

sudo exportfs -a 
sudo systemctl restart nfs-kernel-server

# Firewall permision
sudo ufw allow from $1 to any port nfs
sudo ufw allow from $2 to any port nfs

# sudo ufw enable  # firewall check
# sudo ufw status  # firewall check

