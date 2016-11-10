# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "./code", "/home/vagrant/code", create:true, nfs:true
  config.vm.synced_folder "./scripts", "/home/vagrant/scripts", created:true, nfs:true
  config.vm.synced_folder "./templates", "/home/vagrant/templates", created:true, nfs:true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.provision :shell,
    path: "scripts/batchInstall.sh"
  end
