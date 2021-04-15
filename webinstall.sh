#!/bin/bash
# Xubuntu 20.04
##############################
# First Steps!!              #
#----------------------------#
# chmod +x webinstall.sh     #
# ./webinstall.sh            #
##############################
#
##############################
# Adding PPAs                #
##############################
sudo add-apt-repository ppa:stebbins/handbrake-releases
#add-apt-repository ppa:kdenlive/kdenlive-stable
#add-apt-repository ppa:ubuntuhandbook1/audacity
#add-apt-repository ppa:cteehayder/ffmulticonverter
#add-apt-repository ppa:bashtop-monitor/bashtop
#apt-add-repository ppa:audio-recorder/ppa
##############################
# Install line apt           #
##############################
sudo apt update
sudo apt upgrade
sudo apt install git gparted synaptic python3-pip mpv jq ffmpeg gimp xsane simple-scan pdfshuffler pinta audacity htop hardinfo acpi libreoffice libreoffice-l10n-de libreoffice-help-de neofetch usb-creator-gtk sqlite3 nodejs npm gaupol mediainfo mediainfo-gui guvcview lxsplit libimage-exiftool-perl perl-doc steam kazam xsensors hugin gifsicle wget tree ufw gufw arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr kleopatra jeex bless rename
sudo apt install libavcodec-extra ttf-mscorefonts-installer unrar rar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
# PPA:
sudo apt install handbrake-gtk
#sudo apt install curl mypaint vlc tlp powertop bashtop xbacklight screenfetch audio-recorder ffmulticonverter free vpnc sysinfo ubuntu-restricted-extras zenmap
##############################
# Install line snap          #
##############################
#sudo apt install snapd
# https://snapcraft.io/store hier suchen, ob snap das gewuenschte Programm ueberhaupt hat.
#snap install heroku --classic
#snap install micro --classic
#snap install pycharm-community --classic
#snap install android-studio --classic
#snap install eclipse --classic
#snap install code --classic
#snap install blender --classic
#snap install skype --classic
#snap install inkscape krita meshlab zoom-client kdenlive discord fast
##############################
# Install line Flathub       #
##############################
#sudo apt install flatpak
# https://flathub.org hier suchen, ob flathub das gewuenschte Programm ueberhaupt hat.
##############################
# Install line pip3          #
##############################
#python3 -m pip install --upgrade pip
#python3 -m pip install --upgrade Pillow
#pip3 install --user venv selenium pytest requests flask Pillow youtube-dl
#pip3 install -U bpytop
##############################
# Install additional items   #
##############################
### 1. Do you want to install Texlive and Texmaker? https://wiki.ubuntuusers.de/TeX_Live/
#read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
#if [ "$yn" != "n" ]; then
#  sudo apt install texlive texlive-lang-german texlive-latex-extra texmaker
#fi
#
### 2. Check Firewall Status https://wiki.ubuntuusers.de/ufw/:
sudo ufw status
read -p "Do you want to activate firewall? [Y/n]: " yn3
if [ "$yn3" != "n" ]; then
  sudo ufw enable
## sudo ufw disable
fi
#
### 3. Additional Themes:
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings
#sudo apt install plank
#If Plank (Panel/Dockleiste fuer Apps wie beim Mac) is not available in the default repository,
#just install from ppa:ricotz/docky
#
### 4. Ordner Fuer Externe Programme Erstellen:
#mkdir ~/Programs
mkdir $HOME/Programs
#
### 5. Installation Von Externen Programmen:
#A: Programme Herunterladen, z.B.:
# MicrosoftTeams, Blender, Sublime-Text, VSCode, JetBrains WebStorm/Rider/PyCharm IDE,
# magick https://imagemagick.org/script/download.php,
# ffmulticonverter https://sites.google.com/site/ffmulticonverter/download,
# mono https://www.mono-project.com/download/stable/
# zoom-client https://zoom.us/download
# gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/
# celluloid https://celluloid-player.github.io/
# Appimages z.B.:
# krita https://krita.org/,
# inkscape https://inkscape.org/,
# MyPaint http://mypaint.org/,
# Stellarium http://stellarium.org/,
# Unity-Hub https://unity3d.com/get-unity/download,
# Kdenlive https://kdenlive.org/en/download/
#
#B: Debian packages nach Programs kopieren und(&&) in diesen Ordner wechseln:
# cp ~/Downloads/*.deb ~/Programs && cd ~/Programs
# installieren per: sudo apt install ./*.deb
#             oder: sudo dpkg -i *.deb
#
#C: Move AppImages to ~/Programs and make executable
# mv ~/Downloads/*.AppImage ~/Programs
# chmod +x ~/Programs/*.AppImage
#
#D: Extract blender and copy to Programs folder:
# tar -xvf ~/Downloads/blender*.tar.xz -C ~/Programs
#Und installiere VSE_Transform_Tools fuer Videobearbeitung: https://github.com/doakey3/VSE_Transform_Tools
#Und GIF-Import: https://github.com/doakey3/Bligify
#Und CAD_Tool: https://github.com/Laurent26/techdraw
#Und JMesh_Hard_Surface_Tools: https://github.com/jayanam/jmesh-tools
#
### 6. Konsolentools herunterladen:
#cd ~/Programs && git clone https://github.com/Tornado3P9/Konsolentools
#
### 7. Virtuelle Python Environment erstellen, siehe in alias.txt unter 'virtual environments workflow'
#mkdir ~/my-python-venv && cd ~/my-python-venv
#python3 -m venv ./venv
#
### 8. Shortcut Collection herunterladen, nach ~/Programs entpacken und zip-Archiv loeschen:
#wget https://www.dropbox.com/sh/svkokavmhty8xi3/AADawdnN94IPQqoE7obCAOLNa?dl=0 -O gezipptesArchiv.zip
#unzip gezipptesArchiv.zip -d ~/Programs/
#rm gezipptesArchiv.zip
#
### 9. xfce4-settings-manager (Alt+F2 -> xfce4-)
#echo "xfce4-settings-manager -> Fenstereinstellungen der Fensterverwaltung -> Zugreifbarkeit -> Taste zum nehmen und verschieben der Fenster: None"
#read -p "EnterTaste:"
#xfce4-settings-manager
#
### 10. TASTENKUERZEL FUER LIEBLINGSPROGRAMME ERSTELLEN: xfce4-settings-manager -> Tastatur -> Tastenkuerzel
#Strg+Alt+Entf -> xfce4-session-logout
#Strg+Alt+Esc  -> xkill = Kill Window under X
#Super+L       -> xflock4 = Bildschirm sperren
#Umschalt+Strg+Esc -> xfce4-taskmanager
#--Defaults--
#Alt+F2        -> xfrun4
#Super+W       -> exo-open --launch WebBrowser
#Super+F       -> exo-open --launch FileManager
#Print         -> xfce4-screenshooter -f
#Shift+Print   -> xfce4-screenshooter -r
#Alt+Print     -> xfce4-screenshooter -w
#Super+F1      -> xfce4-find-cursor
#Strg+Esc      -> xfce4-popup-whiskermenu (Standard Menu)
#Alt+F1        -> xfce4-popup-applicationsmenu
#
### 11. Bildschirm Hintergrund:
# https://www.pexels.com/
# https://www.pexels.com/photo/black-and-white-mountain-over-yellow-white-and-blue-sky-46253/
# To search for background folder:
#locate backdrops
#
### 12. Add custom alias:
#read -p "Do you want to copy old alias? [Y/n]: " yn2
#if [ "$yn2" != "n" ]; then
#  cat alias.txt >> ~/.bashrc
#fi
#
### 13. Weiteres:
#
### Microsoft Office Alternativen, die auf allen Betriebssystemen laufen!:
# Wer nicht mit Libreoffice zufrieden ist...(ich bins und fuer grosse Arbeiten benutzt man sowieso LateX/Texmaker...),
# der kann FreeOffice von Softmaker benutzen. Das ist eine exakte Kopie von MicrosoftOffice, wenn nicht sogar besser.
# OnlyOffice ist ebenfalls ein sehr gut aussehendes Paket und kompatibel mit MSOffice.
# Oder WPS_Office aus China...ebenfalls eine Kopie von MSOffice.
#
### Photoshop Alternativen:
# Gimp (Fotomanipulation) https://www.gimp.org/
# Krita (Viele unterschiedliche Farbcodes, daher gut fuer Druckaufgaben) https://krita.org/
# Photopea (Onlinetool, gute Kompatibilitaet zu Photoshops Textobjekten) https://www.photopea.com/
# Inkscape (Vektorgrafiken) https://inkscape.org/
# MyPaint (Professionelles Maltool fuer Arbeit am Digital Drawing Tablet) http://mypaint.org/
# Blender2.9 (Professionelles 2D-Maltool fuer Arbeit am Digital Drawing Tablet) https://www.blender.org/
#
### Automaticly enter 'yes' when asked:
#for i in program1 program2 program3; do
#  apt-get install $i -y
#done
#
### install better compatibility with "the better distro kernel" (optional)
#https://liquorix.net/
#
### Audio+Video Converter:
# ffmpeg (complex converter tool for videos, movies, images, pdfs, ...) https://wiki.ubuntuusers.de/FFmpeg/ http://ffmpeg.org/ffmpeg.html
# handbrake (Very Good! -> see above for PPA install) https://wiki.ubuntuusers.de/HandBrake/
# winff (Grafic Interface for ffmpeg)
# traGtor (Alternatively) http://mein-neues-blog.de/
#
### Professionelle Videobearbeitung:
# DaVinci Resolve
# Kdenlive
# Blender
# Shotcut
# Olive
# Openshot (Simple)
#
### Desktop Sketchpads / Draw directly on the Screen:
# Ardesia for XFCE
#sudo apt install ardesia
# "Annotate" plugin in compiz for Gnome
#sudo apt install compizconfig-settings-manager compiz-plugins compiz-plugins-extra
#
### Create and Edit EPUB Files on Linux With Sigil
#sudo apt install sigil
#
#read -t 3
read
printf "\n"
