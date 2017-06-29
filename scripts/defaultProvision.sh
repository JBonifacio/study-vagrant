#!/usr/bin/env bash

echo "Update package lists..."
sudo apt-get -y update

# Install vim
echo "Install vim..."
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

# Give vagrant user access to oh-my-zsh
sudo chown -R vagrant .oh-my-zsh .zsh*

# Run additional scripts
source /home/vagrant/scripts/phpApache2Environment.sh
