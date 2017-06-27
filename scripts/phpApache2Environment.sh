#!/usr/bin/env bash

echo "Update package lists..."
sudo apt-get -y update

# Install Apache2
echo "Install Apache2..."
sudo apt-get install apache2

# Install PHP7
echo "Install PHP and dependencies..."
sudo apt-get install python-software-properties
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get -y install php7.0 php7.0-fpm
sudo apt-get install php7.0 libapache2-mod-php7.0
a2enmod rewrite

# Install PostgreSQL
echo "Install Postgres and PHP-Postgres Support..."
sudo apt-get -y install postgresql postgresql-contrib

# Install PSQL Support for PHP
sudo apt-get -y install php7.0-pgsql

##
# Configure Postgres
##

# Create role
sudo su postgres -c "psql -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" "

# Create db
sudo su postgres -c "createdb -O vagrant vagrant"

##
#  Configure Webserver
##

# Link synced folder with code to NGINX default.
ln -sfn /home/vagrant/code /usr/share/nginx/html

# Delete default file
rm -rf /etc/apache2/sites-enabled/000-default.conf
rm -rf /etc/apache2/apache2.conf

# Copy template
cp -a /home/vagrant/templates/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf
cp -a /home/vagrant/templates/apache2/apache2.conf /etc/apache2/apache2.conf

##
# Configure PHP
##

# Delete default file
rm -rf /etc/php/7.0/fpm/php-fpm.conf
rm -rf /etc/php/7.0/fpm/php.ini
rm -rf /etc/php/7.0/fpm/pool.d/www.conf

# Copy template
cp -a /home/vagrant/templates/php-fpm/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
cp -a /home/vagrant/templates/php-fpm/php.ini /etc/php/7.0/fpm/php.ini
cp -a /home/vagrant/templates/php-fpm/poold_www.conf /etc/php/7.0/fpm/pool.d/www.conf

# Restart PHP server
sudo service php7.0-fpm restart
sudo service apache2 restart

# Give access to socket
sudo chown www-data:www-data /var/run/php/php7.0-fpm.sock
