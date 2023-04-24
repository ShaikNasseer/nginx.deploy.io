#!/bin/bash

# connetcton between client and remote sever
read -p "enter the usrname :" user
read -p "enter the ip: " remote_ip
#ssh $username@$remote_ip

# copy public key to target machine
ssh-copy-id "$user@$remote_ip" 

# update, upgrade and install nginx SSH into the remote host and install Nginx
ssh $user@$remote_ip << EOF
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF

# allow http and https firewall in Ubuntu

sudo systemctl enable ufw
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo systemctl disable ufw

#copy the index in remote host
	
sudo scp -R index.html $user@$remote_ip:/var/www/html/

# making directory

ssh $user@$remote_ip << EOF

cd /var/www/html/
sudo mkdir styles

EOF

# copy the css file

sudo scp -R styles.css $user@$remote_ip:/var/www/html/styles/

# Restart Nginx
sudo systemctl restart nginx

