# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: '192.168.50.51'
  
  # enable nfs and siable smb if not Windows
  # config.vm.synced_folder "./code", "/home/vagrant/code", create:true, nfs:true
  # config.vm.synced_folder "./scripts", "/home/vagrant/scripts", created:true, nfs:true
  # config.vm.synced_folder "./templates", "/home/vagrant/templates", created:true, nfs:true

  # enable smb and disable nfs if host is Windows
  config.vm.synced_folder "./code", "/home/vagrant/code", create:true, type:"smb"
  config.vm.synced_folder "./scripts", "/home/vagrant/scripts", created:true, type:"smb"
  config.vm.synced_folder "./templates", "/home/vagrant/templates", created:true, type:"smb"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.provision :shell, path: "scripts/defaultProvision.sh"
  end
