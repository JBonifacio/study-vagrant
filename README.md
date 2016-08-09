# study-vagrant
## Introduction
The "study-vagrant" is my amateur's coding solution.  It works with NGINX, Ubuntu, PHP 
and Postgres.  It is intended to simplify setting up a coding environment so I can 
jump right into the action in the future.

Just a small warning, but this is coming from an up-and-coming developer who has a 
lot to learn.  I appreciate any constructive feedback that may come my way!  Thanks!

This Vagrant uses "vagrant" as the name, including the username, where ever possible. 
I might create a blank config file at some point which might be referenced by some of
the scripts to help clean this process up and protect your credentials at the same 
time.

## Scripts
`/scripts` should include "batchInstall.sh" which should install the 
necessary packages. It will also include a full useful scripts that should automate
some of the busy work.  I haven't pushed out too many of them so far as some of them
are dependent on my project rather than the actual dev-environment.

## Templates
`/templates` has the very vanilla templates for NGINX, Ubuntu, PHP and Postgres.  You
can make the modifications you need here to get what you want out of the project.

## Features

* NGINX
* PHP7
* Postgres (also support for PHP7)
* VIM (my terminal text editor of choice)
* Git
* zsh and oh-my-zsh

## Install
1. You need to install Vagrant to use my solution.  You can read more 
[here](https://www.vagrantup.com/docs/installation/).
2. From there, download, clone or fork this repository into a new directory.
3. `cd ./student-vagrant`, or where you placed teh `Vagrantfile`.
4. `vagrant up`
5. Watch for errors.
6. Upon completion of `vagrant up`, use `vagrant ssh` to access your shiny new toy.

## Troubleshooting
_Coming soon..._