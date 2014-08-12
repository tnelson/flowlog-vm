#!/bin/bash

# Flowlog VM installation script
# Inspired by Andrew Ferguson's Pane/Flowlog demo VM script
# Run after installing Ubuntu Server (64) in Virtualbox
################################################

sudo usermod -a -G nopasswdlogin `whoami`

echo -e "\nulimit -c unlimited\n" >> ~/.bashrc
echo -e "\nulimit -n 2048\n" >> ~/.bashrc


set -e

# removed for debugging --- only run once
#echo `whoami` ALL=NOPASSWD: ALL | sudo tee -a /etc/sudoers
#sudo sed -i -e 's/Default/#Default/' /etc/sudoers

sudo apt-get update
sudo apt-get -y install xubuntu-desktop

sudo apt-get -y install virtualbox-guest-dkms

##
# Needed for development, etc.
##

sudo apt-get -y install openssh-server
sudo apt-get -y install git
sudo apt-get -y install vim-gtk
sudo apt-get -y install emacs
sudo apt-get -y install linux-crashdump
sudo apt-get -y install screen

# Flowlog 
sudo apt-get -y install ocaml
sudo apt-get -y install opam
opam init -y || true
eval `opam config env`
opam update


sudo apt-get -y install camlp4-extra
sudo apt-get -y install default-jdk
sudo apt-get -y install wireshark

sudo apt-get -y install expect

./wireshark-reconfigure.sh
sudo usermod -a -G wireshark flowlog

###########################################
# Sublime Text
# (Most will use one of: Vim, Emacs, Sublime Text)
# taken from http://www.sublimetext.com/2 
sudo apt-get -y install bzip2
cd
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
sudo dpkg -i sublime-text_build-3059_amd64.deb
rm sublime*.deb



# need to relog in here


