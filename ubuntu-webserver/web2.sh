#!/bin/bash
# Use Give me a PASSWORD as Positional Parameter

sudo apt-get update

sudo apt-get install zsh -y
chsh -s /usr/bin/zsh
sudo useradd -m -s "/bin/zsh" -G sudo devops

sudo passwd << EOF
$1
EOF

sudo visudo << EOF 
devops     ALL=(ALL:ALL) ALL
EOF  # <-- ROOT JOGOK

sudo sed -i '/PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config
sudo sed -i '/ChallengeResponseAuthentication yes/c\ChallengeResponseAuthentication no' /etc/ssh/sshd_config
sudo sed -i '/UsePAM yes/c\UsePAM no' /etc/ssh/sshd_config
sudo sed -i '/PermitRootLogin without-password/c\PermitRootLogin no' /etc/ssh/sshd_config
sudo systemctl restart ssh.service



