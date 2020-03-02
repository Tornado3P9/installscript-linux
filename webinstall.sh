#!/bin/bash
# Xubuntu 18.04
#
##############################
# Command Line Variables     #
##############################
#
##############################
# Adding PPAs                #
##############################
sudo add-apt-repository ppa:stebbins/handbrake-releases
##############################
# Install line apt           #
##############################
sudo apt update
sudo apt upgrade
sudo apt install git snapd gparted synaptic xubuntu-restricted-extras vlc python3-pip mpv gimp xsane pdfshuffler pinta audacity bless htop mypaint sysinfo hardinfo acpi
sudo apt install sqlite3 nodejs npm gaupol mediainfo mediainfo-gui nethogs wireshark guvcview lxsplit libimage-exiftool-perl perl-doc steam kazam vpnc xsensors handbrake-gtk
##############################
# Install line snap          #
##############################
sudo snap install android-studio --classic
sudo snap install eclipse --classic
sudo snap install fast
sudo snap install heroku --classic
sudo snap install inkscape
sudo snap install meshlab
sudo snap install micro --classic
sudo snap install pycharm-community --classic
##############################
# Install line pip3          #
##############################
#python3 -m pip install --user --upgrade pip
pip3 install --user virtualenv selenium pytest requests flask youtube-dl
#Do you want to install Texlive and Texmaker?
read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
if [ "$yn" != "n" ]; then
  sudo apt install texlive-full texmaker
fi
exit 0