#!/usr/bin/env bash
sudo apt-get -y update

# Install NGINX
sudo apt-get -y install nginx

# Install PHP7
sudo apt-get install python-software-properties
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get -y install php7.0 php7.0-fpm

# Install PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib

# Install PSQL Support for PHP
sudo apt-get -y install php7.0-pgsql

# Install vim
sudo apt-get -y install vim

# Install Git
sudo apt-get -y install git

##
# ZSH
##

# Install zsh
sudo apt-get install -y -q zsh

# Clone oh-my-zsh
if [ ! -d ~vagrant/.oh-my-zsh ]; then
  sudo git clone https://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
fi

# Create a new zsh configuration from the provided template
sudo cp ~vagrant/.oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc

# Change ownership of .zshrc
sudo chown vagrant: ~vagrant/.zshrc

# Customize theme
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="pygmalion"/' ~vagrant/.zshrc

# add aliases
sed -i -e 's/# Example aliases/source ~\/.bash_aliases/gi' ~vagrant/.zshrc

# Set zsh as default shell
chsh -s /bin/zsh vagrant

##
#  Configure Webserver
##

# Link synced folder with code to NGINX default.
ln -sfn ~/www /usr/share/nginx/html

# Delete default file
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/nginx.conf

# Copy template
cp -a /home/vagrant/templates/nginx/default /etc/nginx/sites-available/default
cp -a /home/vagrant/templates/nginx/nginx.conf /etc/nginx/nginx.conf

##
# Configure PHP
##

# Delete default file
rm -rf /etc/php/7.0/fpm/php-fpm.conf
rm -rf /etc/php/7.0/fpm/php.ini

# Copy template
cp -a /home/vagrant/templates/php-fpm/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
cp -a /home/vagrant/templates/php-fpm/php.ini /etc/php/7.0/fpm/php.ini

# Give access to socket
sudo chown www-data:www-data /var/run/php/php7.0-fpm.sock

# Restart PHP server
sudo service php7.0-fpm restart