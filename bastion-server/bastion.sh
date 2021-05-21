#!/bin/bash
# Use Give me a PASSWORD as Positional Parameter

sudo apt-get update

sudo apt-get install zsh -y
chsh -s /usr/bin/zsh
sudo useradd -m -s "/bin/zsh" -G sudo devops

sudo passwd devops << EOF
$1
EOF

sudo visudo << EOF 
devops     ALL=(ALL:ALL) ALL
EOF  # <-- ROOT JOGOK

sudo useradd -m -s "/bin/bash" -G sudo linux
#sudo passwd linux

ssh-keygen -t rsa -b 4096 -C devops
cd ~/.ssh
ssh-copy-id -i id_rsa.pub devops@<web1ip>
ssh-copy-id -i id_rsa.pub devops@<web2ip>

# sudo nano /etc/ssh/sshd_config << PermitRootLogin yes     // kötelező ssh-key haszmnálat
# sudo nano /etc/ssh/sshd_config << PasswordAuthentication no       // jelszó elhagyása ssh-nál



