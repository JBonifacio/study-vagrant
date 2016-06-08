#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Restart nginx web server
echo "=> ${BLUE}Restarting nginx.${NC}"
sudo service nginx restart

# Start php service
echo "=> ${BLUE}Restarting php5-fpm.${NC}"
sudo service php5-fpm restart

# Change permissions.
echo "=> ${BLUE}Giving www-data permissions to php5.fpm.sock.${NC}"
sudo chown www-data:www-data /var/run/php5-fpm.sock
