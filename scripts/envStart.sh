#!/bin/bash

# Start nginx web server
echo "Starting nginx."
sudo service nginx start

# Start php service
echo "Starting php5-fpm."
sudo service php5-fpm start

# Change permissions.
echo "Giving www-data permissions to php5.fpm.sock."
sudo chown www-data:www-data /var/run/php5-fpm.sock
