#!/bin/bash

# Use : give me 2 webserver Ip-address as Positional Parameters


sudo apt-get update
sudo apt-get install

sudo cat << EOF > /etc/nginx/sites-enabled/default.conf
upstream backup {
    server $1;
    server $2; 
}
server {
        listen 80;
        location / {
            proxy_pass http://backup;
        }
}
EOF

sudo systemctl restart nginx
