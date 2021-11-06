#!/bin/bash
# Xubuntu 20.04
##############################
# Download, Edit and Execute #
#----------------------------#
# sudo apt install curl      #
# curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/webinstall.sh -o webinstall.sh
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
#add-apt-repository ppa:audio-recorder/ppa
#add-apt-repository ppa:obsproject/obs-studio
##############################
# Install line apt           #
##############################
sudo apt update && sudo apt upgrade -y
sudo apt install \
git gparted synaptic \
xsane simple-scan \
pdfshuffler \
gimp pinta hugin gifsicle \
htop glances whowatch arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr neofetch \
libreoffice libreoffice-l10n-de libreoffice-help-de \
sqlite3 nodejs npm \
mediainfo mediainfo-gui \
mpv ffmpeg vlc audacity guvcview kazam \
lxsplit \
libimage-exiftool-perl perl-doc \
steam \
xsensors \
wget curl \
tree \
ufw gufw \
kleopatra \
jeex bless jq rename tea \
usb-creator-gtk \
python3-pip python3-venv libopencv-dev python3-opencv
# https://linuxhint.com/install-ubuntu-restricted-extras/
# Show package content by typing: "apt show ubuntu-restricted-extras" or manually install via the following line:
sudo apt install libavcodec-extra ttf-mscorefonts-installer unrar rar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi
# PPA:
sudo apt install handbrake-gtk
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
#snap install inkscape krita meshlab zoom-client kdenlive discord fast vlc obs-studio
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
#pip3 install --user selenium pytest requests Flask Pillow beautifulsoup4 youtube-dl
#pip3 install -U bpytop
#pip3 install pylint flake8 isort autopep8 pandas seaborn bokeh
#pip3 install opencv-python
## https://pypi.org/project/opencv-python/
##############################
# Install additional items   #
##############################
### 1. Do you want to install Texlive and Texmaker? https://wiki.ubuntuusers.de/TeX_Live/
printf "\n"
read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
if [ "$yn" != "n" ]; then
  sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
fi
#
### 2. Activate User-Friendly-Firewall https://wiki.ubuntuusers.de/ufw/:
printf "\n"
sudo ufw enable
sudo ufw status
#
### 3. Additional Themes:
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings
sudo apt install plank
#If Plank (Panel/Dockleiste fuer Apps wie beim Mac) is not available in the default repository, just install from ppa:ricotz/docky
#Strg+Right_Mouse_Button für dessen Einstellungsmenu https://wiki.ubuntuusers.de/Plank/
#
### 4. Ordner Fuer Externe Programme Erstellen:
mkdir $HOME/Programs
#
### 5. Installation Von Externen Programmen:
#A: Programme Herunterladen, z.B.:
# Sublime-Text, VSCode, Atom, JetBrains WebStorm/Rider/PyCharm IDE
# Blender https://www.blender.org/download/
# magick https://imagemagick.org/script/download.php
# ffmulticonverter https://sites.google.com/site/ffmulticonverter/download
# mono https://www.mono-project.com/download/stable/
# zoom-client https://zoom.us/download
# Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app
# gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/
# PyCharm https://www.jetbrains.com/pycharm/download/#section=linux
# OBS Studio https://obsproject.com/wiki/install-instructions#linux
# Appimages z.B.:
# krita https://krita.org/
# inkscape https://inkscape.org/
# MyPaint http://mypaint.org/
# Stellarium http://stellarium.org/
# Unity-Hub https://unity3d.com/get-unity/download
# Kdenlive https://kdenlive.org/en/download/
# Obsidian https://obsidian.md/
# BalenaEtcher https://www.balena.io/etcher/
#
wget -L https://zoom.us/client/latest/zoom_amd64.deb -O $HOME/Programs/zoom_amd64.deb
wget -L https://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb -O $HOME/Programs/gcolor2_0.4-2.1ubuntu1_amd64.deb
wget -L https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -O $HOME/Programs/imager_latest_amd64.deb
#
#B: Debian packages nach Programs kopieren und(&&) in diesen Ordner wechseln:
# cd ~/Programs && sudo apt install ./*.deb
#
#C: Move AppImages to ~/Programs and make executable (no installation needed)
# mv ~/Downloads/*.AppImage ~/Programs/
# chmod +x ~/Programs/*.AppImage
#
#D: Extract blender and copy to Programs folder:
# tar -xvf ~/Downloads/blender*.tar.xz -C ~/Programs/
#Und installiere VSE_Transform_Tools fuer Videobearbeitung: https://github.com/doakey3/VSE_Transform_Tools
#Und GIF-Import: https://github.com/doakey3/Bligify
#Und CAD_Tool: https://github.com/Laurent26/techdraw
#Und JMesh_Hard_Surface_Tools: https://github.com/jayanam/jmesh-tools
#
### 6. Konsolentools herunterladen:
#cd ~/Programs && git clone https://github.com/Tornado3P9/Konsolentools
#
### 7. Virtuelle Python Environment erstellen https://github.com/Tornado3P9/Konsolentools/blob/master/python3_virtualenv.txt
#mkdir ~/my-python-venv && cd $_
#python3 -m venv ./venv
#
### 8. Shortcut Collection herunterladen, nach ~/Programs entpacken und zip-Archiv loeschen:
#wget https://www.dropbox.com/sh/svkokavmhty8xi3/AADawdnN94IPQqoE7obCAOLNa?dl=0 -O gezipptesArchiv.zip
#unzip gezipptesArchiv.zip -d ~/Programs/
#rm gezipptesArchiv.zip
#
### 9. xfce4-settings-manager (Alt+F2 -> xfce4-)
echo -e "\nxfce4-settings-manager -> Fenstereinstellungen der Fensterverwaltung -> Zugreifbarkeit -> Taste zum nehmen und verschieben der Fenster: None"
read -p "EnterTaste zum Fortfahren:"
#
### 10. TASTENKUERZEL FUER LIEBLINGSPROGRAMME ERSTELLEN: xfce4-settings-manager -> Tastatur -> Tastenkuerzel
### or by typing: xfce4-keyboard-settings
#Strg+Alt+Entf     -> xfce4-session-logout
#Strg+Alt+Esc      -> xkill = Kill Window under X
#Super+L           -> xflock4 = Bildschirm sperren
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
### for setting other Keyboard-Shortcuts in your windows-manager:
#xfwm4-settings
#
### for displaying the date and time of the terminal history output type the following line into your terminal:
echo "HISTTIMEFORMAT=\"%d/%m/%y %T  \"" >> ~/.bashrc
#
### 11. Bildschirm Hintergrund:
# https://www.pexels.com/
# To search for background folder:
echo -e "\nShowing the file path to the desktop-background-image-directory:" && locate backdrops
# Or animate your background if a static one is too boring: https://youtu.be/pA-gzjyGHFc
#
### 12. Add custom alias:
read -p "Do you want to copy premade aliases? [Y/n]: " yn2
if [ "$yn2" != "n" ]; then
  curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/bash_aliases | tee ~/.bash_aliases
fi
#
### 13. Sicherheitslücke in Firefox schließen:
# Firefox öffnen -> about:config in der URL-Zeile eingeben -> pdfjs.en eingeben -> pdfjs.enableScripting auf False stellen
#
### 14. Weiteres:
###
### Microsoft Office Alternativen, die auf allen Betriebssystemen laufen!:
# Wer nicht mit Libreoffice zufrieden ist...(ich bins und fuer grosse Arbeiten benutzt man sowieso LateX/Texmaker...),
# der kann FreeOffice von Softmaker benutzen. Das ist eine exakte Kopie von MicrosoftOffice, wenn nicht sogar besser.
# OnlyOffice ist ebenfalls ein sehr gut aussehendes Paket und kompatibel mit MSOffice.
# Oder WPS_Office aus China...ebenfalls eine Kopie von MSOffice.
#
### Excel VBA:
# Man kann Excel per Wine auf Linux installieren, empfehle ich aber nicht.
# Libreoffice-Calc hat ja bereits die selben Eigenschaften wie Excel.
# Trotzdem empfehle ich statt VBA lieber "Python Pandas" auf allen Betriebssystemen zu benutzen!
# https://youtu.be/Lh6FLhgPxbc  https://youtu.be/F-gDgQ6kuuk
# https://pandas.pydata.org/pandas-docs/stable/getting_started/index.html#getting-started
# https://plotly.com/python/plotly-express/
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
### Desktop Sketchpads / Direkt auf dem Bildschrirm malen:
# Gromit for most systems - https://wiki.ubuntuusers.de/Gromit/
#sudo apt install gromit
# "Annotate" plugin in compiz for Gnome
#sudo apt install compizconfig-settings-manager compiz-plugins compiz-plugins-extra
#
### Grafic Tablet Zeichenprogramme:
# Xournal++ (Professionelles kostenloses Programm für den Unterricht!) https://github.com/xournalpp/xournalpp
# MyPaint (Professionelles Maltool fuer Arbeit am Digital Drawing Tablet) http://mypaint.org/
#
### Create and Edit EPUB Files on Linux With Sigil
#sudo apt install sigil
#
### Create and Edit text-based Subtitles with Gaupol https://otsaloma.io/gaupol/
#sudo apt install gaupol
#
### ArduinoIDE benoetigt unter Umstaenden noch folgende zwei Pakete:
#sudo apt install python-is-python3 python3-serial
#
### VirtualBox - https://www.virtualbox.org/manual/  https://youtu.be/HLnA5UekwAI
#
#read -t 3
#read
read -p "Process Finished. Press Enter to Exit:"
printf "\n"
