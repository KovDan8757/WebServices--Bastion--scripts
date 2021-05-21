#!/bin/bash
# # Use : give me the Imdex.html absolute path as Positional Parameters

sudo yum -y update
sudo yum lint nginx
sudo yum install -y nginx.x86_64

sudo systemctl enable nginx
sudo systemctl start nginx

cp $1 /usr/share/nginx/html/index.html

sudo firewall-cmd --permanent --zone-public --add-service=http --add-service=https 
sudo firewall-cmd --reload 
sudo firewall-cmd --list-services --zone=public 

sudo systemctl restart nginx

# /etc/nginx/nginx.conf  # port option
