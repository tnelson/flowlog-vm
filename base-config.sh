#!/bin/bash

# Flowlog VM installation script
# Inspired by Andrew Ferguson's Pane/Flowlog demo VM script
# Run after installing Ubuntu Server (64) in Virtualbox
################################################

# Don't require a password on login
sudo usermod -a -G nopasswdlogin `whoami`
sudo usermod -a -G vboxsf `whoami`

# Automatically login user flowlog (via config file being copied)
sudo cp 50-flowlog.conf /etc/lightdm/lightdm.conf.d

echo -e "\nulimit -c unlimited\n" >> ~/.bashrc
echo -e "\nulimit -n 2048\n" >> ~/.bashrc

set -e

echo `whoami` ALL=NOPASSWD: ALL | sudo tee -a /etc/sudoers
sudo sed -i -e 's/Default/#Default/' /etc/sudoers

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

# Turn off screensaver and locking
echo -e "xset -dpms; xset s off" >> ~/.profile

sudo apt-get -y install wireshark
sudo apt-get -y install expect
./wireshark-reconfigure.sh
sudo usermod -a -G wireshark flowlog

# need to reboot here
sudo reboot

