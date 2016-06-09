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
