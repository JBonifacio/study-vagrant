#!/usr/bin/env bash

echo "Update package lists..."
sudo apt-get -y update

# Install NGINX
echo "Install NGINX..."
sudo apt-get -y install nginx

# Install node.js
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

##
#  Configure Webserver
##

# Link synced folder with code to NGINX default.
ln -sfn /home/vagrant/code /usr/share/nginx/html

# Delete default file
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/nginx.conf

# Copy template
cp -a /home/vagrant/templates/nginx/default /etc/nginx/sites-available/default
cp -a /home/vagrant/templates/nginx/nginx.conf /etc/nginx/nginx.conf
