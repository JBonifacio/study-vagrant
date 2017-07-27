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

# Delete default file
sudo rm -rf /etc/apache2/sites-enabled/000-default.conf
sudo rm -rf /etc/apache2/apache2.conf

# Copy template
sudo cp -a /home/vagrant/templates/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo cp -a /home/vagrant/templates/apache2/apache2.conf /etc/apache2/apache2.conf

##
# Configure PHP
##

# Delete default file
sudo rm -rf /etc/php/7.0/fpm/php-fpm.conf
sudo rm -rf /etc/php/7.0/fpm/php.ini
sudo rm -rf /etc/php/7.0/fpm/pool.d/www.conf

# Copy template
sudo cp -a /home/vagrant/templates/php-fpm/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
sudo cp -a /home/vagrant/templates/php-fpm/php.ini /etc/php/7.0/fpm/php.ini
sudo cp -a /home/vagrant/templates/php-fpm/poold_www.conf /etc/php/7.0/fpm/pool.d/www.conf

# Install Composer Globally
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# Restart PHP server
sudo service php7.0-fpm restart
sudo service apache2 restart

# Give access to socket
sudo chown www-data:www-data /var/run/php/php7.0-fpm.sock
