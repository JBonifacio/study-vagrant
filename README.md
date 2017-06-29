# study-vagrant
## Introduction
The "study-vagrant" is my amateur coding solution.  It works with NGINX, Ubuntu, PHP and Postgres.  It is intended to simplify setting up a coding environment so I can jump right into the action in the future.

Just a small warning, but this is coming from an up-and-coming developer who has a
lot to learn.  I appreciate any constructive feedback that may come my way!  Thanks!

This Vagrant uses "vagrant" as the name, including the username, where ever possible.
I might create a blank config file at some point which might be referenced by some of
the scripts to help clean this process up and protect your credentials at the same
time.

## Scripts
`/scripts` should include "defaultProvision.sh" which installs some of the
conveniences needed to get the vagrant up and running.  The bottom of the script
allows you to source other bash scripts for setting up the environment.  Right
now, there is a node.js environment and a php environment.

You might notice a provision line, which by default says this:

`config.vm.provision :shell, path: "scripts/defaultProvision.sh"`

This provision line runs one of the environment files also located in `/scripts`.  I have set up a few basic environments to get people up and running.

## Templates
`/templates` has the very vanilla templates for NGINX, Ubuntu, PHP and Postgres.  You
can make the modifications you need here to get what you want out of the project.

## Features

* VIM (my terminal text editor of choice)
* Git
* zsh and oh-my-zsh
* Optional Features
  * NGINX-PHP7-Postgres environment
  * node.js environment (currently in the workds)


## Install

Before following the install installations below, verify you have the correct provision script in the script `defaultProvision.sh`.

### MacOS
1. You need to install Vagrant to use my solution.  You can read more
[here](https://www.vagrantup.com/docs/installation/).  You will also need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).  Note there are a few different ways to do this but those two links will allow you to manage it manually.  You are welcome to use a package manager like `brew` but those steps are not provided here.
2. From there, download, clone or fork this repository into a new directory, `git clone git@github.com:JBonifacio/vagrant-jmb.git`
3. `cd ./student-vagrant`, or where you placed the `Vagrantfile`.
4. `vagrant up`
5. Watch for errors.
6. Upon completion of `vagrant up`, use `vagrant ssh` to access your shiny new toy.

### Windows
1. You need to install Vagrant to use my solution.  You can read more
[here](https://www.vagrantup.com/docs/installation/).  You will also need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Clone or download the repository.  When I work on a Windows host, I use Github's tool instead of command line.
3. Open a console/PowerShell in the directory you cloned the repo.
4. `vagrant up`

## Guides
### Server
You can use `localhost:8080` to access your app from your host computer.  Without making any changes, if you enter `localhost:8080` to your browser, you should be greated by the vanilla NGINX welcome page.  Currently, it looks like rerouting is not working as intended.

### Code
You can place your code in `/study-vagrant/Code`.  When you provision, a folder called /study-vagrant/code should be created. This folder is shared with your virtual machine in `/home/vagrant/code`.
```
# from host system
cd /study-vagrant/code
vim hello-world.php
```
```
<?php
echo hello world!;
```
Write and quit.  If NGINX is not running:
```
sudo service nginx start
```
On your host system, enter `localhost:8080/hello-world.php` into your browser to view your page.

## Troubleshooting
### Running `vagrant up` on Windows results in an error.  It reports the state is "powered off".
If you are running into this error, you may need to look into virtualization for your hardware.  My PC uses an AMD processor.  This means I needed to disable Microsoft's Hyper-V and enable virtualization on my system's bios.

### NFS is reporting that your exports file is invalid. Vagrant does this check before making any changes to the file. Please correct the issues below and execute "vagrant reload": exports:2: path contains non-directory or non-existent components
If you receive this error when running `vagrant up`, it is the result of some issues with the exports folder saved by virtualbox.  You can solve it by running the following

```
sudo rm /etc/exports && sudo touch /etc/exports
```
