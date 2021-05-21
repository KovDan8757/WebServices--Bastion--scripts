#!/bin/bash
# # Use : give me the Index.html absolute path as Positional Parameters

sudo apt-get update
sudo apt-get install nginx

cp $1 /var/www/html/index.html

sudo systemctl restart nginx

# /etc/nginx/sites-enable/default  # port option