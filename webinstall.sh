#!/bin/bash
# Xubuntu 20.04
#
##############################
# Command Line Variables     #
##############################
#
##############################
# Adding PPAs                #
##############################
add-apt-repository ppa:stebbins/handbrake-releases
#add-apt-repository ppa:cteehayder/ffmulticonverter
#add-apt-repository ppa:bashtop-monitor/bashtop
#apt-add-repository ppa:audio-recorder/ppa
##############################
# Install line apt           #
##############################
sudo apt update
sudo apt upgrade
sudo apt install git snapd gparted synaptic python3-pip mpv jq ffmpeg gimp xsane simple-scan pdfshuffler pinta audacity bless htop hardinfo acpi \
                 libreoffice libreoffice-l10n-de libreoffice-help-de neofetch usb-creator-gtk sqlite3 nodejs npm gaupol mediainfo mediainfo-gui \
                 guvcview lxsplit libimage-exiftool-perl perl-doc steam kazam xsensors handbrake-gtk hugin gifsicle wget tree ufw gufw arp-scan \
                 nmap nethogs wireshark speedtest-cli traceroute mtr kleopatra
#sudo apt install libavcodec-extra ttf-mscorefonts-installer unrar rar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
#apt install mypaint vlc tlp powertop bashtop xbacklight screenfetch audio-recorder ffmulticonverter free vpnc sysinfo ubuntu-restricted-extras zenmap
##############################
# Install line snap          #
##############################
# https://snapcraft.io/store hier suchen, ob snap das gewuenschte Programm ueberhaupt hat.
sudo snap install discord
sudo snap install heroku --classic
#snap install micro --classic
#snap install pycharm-community --classic
#snap install android-studio --classic
#snap install eclipse --classic
#snap install code --classic
#snap install blender --classic
#snap install skype --classic
#snap install inkscape krita meshlab zoom-client kdenlive fast
##############################
# Install line Flathub       #
##############################
#sudo apt install flatpak
# https://flathub.org hier suchen, ob flathub das gewuenschte Programm ueberhaupt hat.
##############################
# Install line pip3          #
##############################
#python3 -m pip install --user --upgrade pip
#pip3 install --user virtualenv selenium pytest requests flask youtube-dl
##############################
# Install additional items   #
##############################
### 1. Do you want to install Texlive and Texmaker?
#read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
#if [ "$yn" != "n" ]; then
#  sudo apt install texlive-full texmaker
#fi
#read -p "Do you want to copy old alias? [Y/n]: " yn2
#if [ "$yn2" != "n" ]; then
#  cat alias.txt >> ~/.bashrc
#fi
### 2. Check Firewall Status https://wiki.ubuntuusers.de/ufw/:
#sudo ufw status
#read -p "Do you want to activate firewall? [Y/n]: " yn3
#if [ "$yn3" != "n" ]; then
#  sudo ufw enable
## sudo ufw disable
#fi
#
### 3. Additional Themes:
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings
#
### 4. Ordner Fuer Externe Programme Erstellen:
mkdir ~/Programs
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
# cd ~/Programs && git clone https://github.com/Tornado3P9/Konsolentools
#
### 7. Virtuelle Python Environment erstellen, siehe in alias.txt unter 'virtual environments workflow'
#mkdir ~/my-python-venv && cd ~/my-python-venv
#python3 -m venv ./venv
#
### 8. Shortcut Collection herunterladen, nach ~/Programs entpacken und zip-Archiv loeschen:
wget https://www.dropbox.com/sh/svkokavmhty8xi3/AADawdnN94IPQqoE7obCAOLNa?dl=0 -O gezipptesArchiv.zip
unzip gezipptesArchiv.zip -d ~/Programs/
rm gezipptesArchiv.zip
#
### 9. xfce4-settings-manager (Alt+F2 -> xfce4-)
echo "xfce4-settings-manager -> Fenstereinstellungen der Fensterverwaltung -> Zugreifbarkeit -> Taste zum nehmen und verschieben der Fenster: None"
read -p "EnterTaste:"
xfce4-settings-manager
#
### 10. TASTENKUERZEL FUER LIEBLINGSPROGRAMME ERSTELLEN: xfce4-settings-manager -> Tastatur -> Tastenkuerzel
#Strg+Alt+Entf -> xfce4-session-logout
#Super+W       -> Webbrowser
#Super+F       -> Dateibrowser(Home Folder)
#Strg+Esc      -> Menu
#Strg+Alt+Esc  -> xkill = Kill Window under X
#Super+L       -> Bildschirm sperren
#Umschalt+Strg+Esc -> xfce4-taskmanager
#
### 11. Bildschirm Hintergrund:
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
#
### Automaticly enter 'yes' when asked:
#for i in program1 program2 program3; do
#  apt-get install $i -y
#done
#
### install better compatibility with "the better distro kernel" (optional)
#https://liquorix.net/
exit 0
