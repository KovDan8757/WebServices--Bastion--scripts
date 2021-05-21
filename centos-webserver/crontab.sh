#!/bin/bash

sudo cat << EOF >> /etc/crontab 

@reboot root    apt-get update
* * * * * root      ./monitoring.sh
* * * * * root  ( sleep 30 ; ./monitoring.sh )
@daily  root /home/cloud_user/toexecute/backup.sh

EOF
