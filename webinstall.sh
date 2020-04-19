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
add-apt-repository ppa:stebbins/handbrake-releases
add-apt-repository ppa:cteehayder/ffmulticonverter
##############################
# Install line apt           #
##############################
apt update
apt upgrade
apt install git snapd gparted synaptic xubuntu-restricted-extras vlc python3-pip mpv jq gimp xsane pdfshuffler pinta audacity bless htop mypaint sysinfo hardinfo acpi libreoffice libreoffice-l10n-de libreoffice-help-de
apt install sqlite3 nodejs npm gaupol mediainfo mediainfo-gui nethogs wireshark guvcview lxsplit libimage-exiftool-perl perl-doc steam kazam vpnc xsensors handbrake-gtk hugin gifsicle wget tree ufw gufw ffmulticonverter
##############################
# Install line snap          #
##############################
# https://snapcraft.io/store hier suchen, ob snap das gewuenschte Programm ueberhaupt hat.
snap install android-studio --classic
snap install eclipse --classic
snap install fast inkscape krita meshlab discord zoom-client kdenlive pick-colour-picker
snap install heroku --classic
snap install micro --classic
snap install pycharm-community --classic
#pick-colour-picker https://kryogenix.org/code/pick/
#sudo snap install code --classic
#sudo snap install blender --classic
#sudo snap install skype --classic
##############################
# Install line pip3          #
##############################
#python3 -m pip install --user --upgrade pip
pip3 install --user virtualenv selenium pytest requests flask youtube-dl
##############################
# Install additional items   #
##############################
# Do you want to install Texlive and Texmaker?
read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
if [ "$yn" != "n" ]; then
  apt install texlive-full texmaker
fi
read -p "Do you want to copy old alias? [Y/n]: " yn2
if [ "$yn2" != "n" ]; then
  cat alias.txt >> ~/.bashrc
fi
### Check Firewall Status https://wiki.ubuntuusers.de/ufw/:
ufw status
read -p "Do you want to activate firewall? [Y/n]: " yn3
if [ "$yn3" != "n" ]; then
  ufw enable
# ufw disable
fi
### Automaticly enter 'yes' when asked:
#for i in program1 program2 program3; do
#  apt-get install $i -y
#done
#
### INSTALLATION VON EXTERNEN PROGRAMMEN, BEISPIEL:
#Externe Programme herunterladen:
#z.B. MicrosoftTeams, Blender, Sublime-Text, VSCode, JetBrains WebStorm/Rider/PyCharm IDE, UnityHub,
#     magick https://imagemagick.org/script/download.php, ffmulticonverter https://sites.google.com/site/ffmulticonverter/download,...
#     mono https://www.mono-project.com/download/stable/
#
#Ordner erstellen:
mkdir ~/Programs
#Debian packages nach Programs kopieren und(&&) in diesen Ordner wechseln:
# cp ~/Downloads/*.deb ~/Programs && cd ~/Programs
#Debians installieren: sudo apt install ./*.deb
#                oder: sudo dpkg -i *.deb
#
### Install/Extract blender and copy to Programs folder:
# tar -xvf ~/Downloads/blender*.tar.xz -C ~/Programs
#Und installiere VSE_Transform_Tools fuer blender: https://github.com/doakey3/VSE_Transform_Tools
#Und GIF-Import: https://github.com/doakey3/Bligify
#
### Konsolentools herunterladen:
# cd ~/Programs && git clone https://github.com/Tornado3P9/Konsolentools
#
### Shortcut Collection herunterladen, nach ~/Programs entpacken und zip-Archiv loeschen:
wget https://www.dropbox.com/sh/svkokavmhty8xi3/AADawdnN94IPQqoE7obCAOLNa?dl=0 -O gezipptesArchiv.zip
unzip gezipptesArchiv.zip -d ~/Programs/
rm gezipptesArchiv.zip
#
### xfce4-settings-manager (Alt+F2 -> xfce4-)
xfce4-settings-manager
# -> Fenstereinstellungen der Fensterverwaltung -> Zugreifbarkeit -> Taste zum nehmen und verschieben der Fenster: None
#
### TASTENKUERZEL FUER LIEBLINGSPROGRAMME ERSTELLEN: xfce4-settings-manager -> Tastatur -> Tastenkuerzel
#Strg+Alt+Entf -> xfce4-session-logout
#Super+W       -> Webbrowser
#Super+F       -> Dateibrowser(Home Folder)
#Strg+Esc      -> Menu
#Strg+Alt+Esc  -> xkill = Kill Window under X
#Super+L       -> Bildschirm sperren
#Umschalt+Strg+Esc -> xfce4-taskmanager
#
### Bildschirm Hintergrund:
# https://www.pexels.com/
# https://www.pexels.com/photo/black-and-white-mountain-over-yellow-white-and-blue-sky-46253/
#
### Microsoft Office Alternativen, die auf allen Betriebssystemen laufen!:
# Wer nicht mit Libreoffice zufrieden ist...(ich bins und fuer grosse Arbeiten benutzt man sowieso LateX/Texmaker...),
# der kann FreeOffice von Softmaker benutzen. Das ist eine exakte Kopie von MicrosoftOffice, wenn nicht sogar besser.
# Oder WPS_Office aus China...ebenfalls eine Kopie von MSOffice.
#
### Photoshop Alternativen:
# Gimp (Fotomanipulation) https://www.gimp.org/
# Krita (Viele unterschiedliche Farbcodes, daher gut fuer Druckaufgaben) https://krita.org/
# Photopea (Onlinetool, gute Kompatibilitaet zu Photoshops Textobjekten) https://www.photopea.com/
# Inkscape (Vektorgrafiken) https://inkscape.org/
# MyPaint (Professionelles Maltool fuer Arbeit am Digital Drawing Tablet) http://mypaint.org/
# Blender2.8 (Professionelles 2D-Maltool fuer Arbeit am Digital Drawing Tablet) https://www.blender.org/
exit 0