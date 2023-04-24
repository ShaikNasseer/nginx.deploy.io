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

# stop http and https firewall in CentOS
sudo systemctl enable ufw
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo systemctl disable ufw

# remove index.html file remote host 

# ssh $user@r$emote_ip "sudo rm -rf /var/www/html/index.nginx-debain.html"

#copy the config file in remote host
	
sudo scp -R nginx.conf $user@$remote_ip:/etc/nginx/sites-available/

#copy the index in remote host

sudo scp -R index.html $user@$remote_ip:/var/www/html/

# creating styles directory

ssh $user@$remote_ip << EOF

cd /var/www/html/
sudo mkdir styles

EOF

# copy the style.css file

sudo scp -R styles.css $user@$remote_ip:/var/www/html/styles/

# Restart Nginx
sudo systemctl restart nginx

