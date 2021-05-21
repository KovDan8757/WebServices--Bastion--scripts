#!/bin/bash

date >> /var/log/system_metrics.log
top | head -n 1 | cut -d "," -f 3,4,5 >> /var/log/system_metrics.log
echo "Free Memory: $(free | grep 'Mem' | cut -d " " -f 20)" >> /var/log/system_metrics.log
echo "Free Swap: $(free | grep 'Swap' | cut -d " " -f 36)" >> /var/log/system_metrics.log
echo "Disk used: $(df -h | grep '/dev/nvme0n1p2' | grep -o '[0-9][0-9]%')" >> /var/log/system_metrics.log
