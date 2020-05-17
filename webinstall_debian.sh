#!/bin/bash
# Debian Xfce4
#
##############################
# Command Line Variables     #
##############################
#
##############################
# Adding PPAs                #
##############################
add-apt-repository ppa:stebbins/handbrake-releases
add-apt-repository ppa:cteehayder/ffmulticonverter
add-apt-repository ppa:bashtop-monitor/bashtop
##############################
# Install line apt           #
##############################
apt update
apt upgrade
# Ersatz fuer 'ubuntu-restricted-extras'
apt install libavcodec-extra \
  ttf-mscorefonts-installer  \
  unrar                      \
  gstreamer1.0-libav         \
  gstreamer1.0-plugins-ugly  \
  gstreamer1.0-vaapi;
##############################
# Install line snap          #
##############################
#Installing snap on Debian
#
#On Debian 9 (Stretch) and Debian 10 (Buster), snap can be installed directly from the command line:
#
#$ sudo apt update
#$ sudo apt install snapd
#
#If the sudo command isn’t installed (usually because a root password was provided at install time), you can install snap by first switching to the root account:
#
#$ su root
#$ apt update
#$ apt install snapd
#
#Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.
#
#To test your system, install the hello-world snap and make sure it runs correctly:
#
#$ snap install hello-world
#hello-world 6.3 from Canonical✓ installed
#$ hello-world
#Hello World!
#
# https://snapcraft.io/store hier suchen, ob snap das gewuenschte Programm ueberhaupt hat.
exit 0