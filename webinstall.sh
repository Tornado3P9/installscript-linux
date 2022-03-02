#!/bin/bash
# Xubuntu 20.04
##############################
# Download, Edit and Execute #
#----------------------------#
# sudo apt install curl      #
# curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/webinstall.sh -O
# chmod +x webinstall.sh     #
# ./webinstall.sh            #
##############################
#
##############################
# Install line apt           #
##############################
# Installing from the ubuntu repository is almost always the best option because these packages have been tested.
# But ofcourse sometimes they are not the most recent up to date versions for your app.
# If you don't like that, then download the app from it's official website or use Appimages, Snaps, Flatpaks, PPAs or compile the app from source code or use the Website Version.
sudo apt update && sudo apt upgrade -y
sudo apt install \
git gparted synaptic \
xsane simple-scan \
pdfshuffler \
gimp pinta hugin gifsicle \
htop glances whowatch arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr neofetch net-tools iperf3 \
libreoffice libreoffice-l10n-de libreoffice-help-de \
sqlite3 nodejs npm \
mediainfo mediainfo-gui \
mpv ffmpeg vlc audacity guvcview kazam handbrake \
lxsplit \
libimage-exiftool-perl perl-doc \
steam \
xsensors \
wget curl \
tree \
ufw gufw \
kleopatra \
jeex bless jq rename \
usb-creator-gtk \
python3-pip python3-venv libopencv-dev python3-opencv \
xclip \
docker.io
# https://linuxhint.com/install-ubuntu-restricted-extras/ (for a media codecs single line installer)
#sudo apt install ubuntu-restricted-extras libdvd-pkg ubuntu-restricted-addons && sudo dpkg-reconfigure libdvd-pkg
sudo apt install libavcodec-extra ttf-mscorefonts-installer unrar rar gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi xz-utils
# Ubuntu has got a lot of command line utils preinstalled. To see their contents, type 'apt show package_name'.
# Interesting ones are: coreutils, alsa-utils, ubuntu-restricted-extras, util-linux, ...
##############################
# Install line snap          #
##############################
# Managed by Canonical, the company behind Ubuntu
#sudo apt install snapd
# https://snapcraft.io/store look here to see whether a snap version exists for your program.
#sudo snap install heroku --classic
#sudo snap install micro --classic
#sudo snap install pycharm-community --classic
#sudo snap install android-studio --classic
#sudo snap install eclipse --classic
#sudo snap install code --classic
#sudo snap install blender --classic
#sudo snap install skype --classic
#sudo snap install inkscape krita meshlab zoom-client kdenlive discord fast vlc obs-studio whatsapp-for-linux spotify
##############################
# Install line Flatpak       #
##############################
#https://flatpak.org/setup/Ubuntu/
#sudo apt install flatpak
# https://flathub.org look here to see whether a flatpak version exists for your program.
# https://flathub.org/apps/details/fr.handbrake.ghb
#flatpak install flathub fr.handbrake.ghb
##############################
# Install line PPA           #
##############################
# Most often non official packages. ALWAYS try the repository version or the official website first!
#sudo add-apt-repository ppa:stebbins/handbrake-releases    #handbrake-gtk
#sudo add-apt-repository ppa:kdenlive/kdenlive-stable       #kdenlive
#sudo add-apt-repository ppa:ubuntuhandbook1/audacity       #audacity
#sudo add-apt-repository ppa:cteehayder/ffmulticonverter    #ffmulticonverter
#sudo add-apt-repository ppa:bashtop-monitor/bashtop        #bashtop
#sudo add-apt-repository ppa:audio-recorder/ppa             #audio-recorder
#sudo add-apt-repository ppa:obsproject/obs-studio          #obs-studio
#sudo add-apt-repository ppa:nilarimogard/webupd8           #pulseaudio-equalizer
#
#sudo apt update
#sudo apt install audio-recorder
#
## To purge the PPA as well as downgrade the package, run command in terminal:
#sudo apt install ppa-purge && sudo ppa-purge ppa:kdenlive/kdenlive-stable
##To remove the PPA only, run command:
#sudo add-apt-repository --remove ppa:kdenlive/kdenlive-stable
##And to remove Kdenlive, run command:
#sudo apt remove --autoremove kdenlive kdenlive-data
#
#To manage the repository in a GUI, go to "Settings" > "Software & Updates" > "Other Software"
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
### Grafical installers on Linux? Don't use them! Always choose the terminal or you could try "Synaptic Package Manager" to get used to package names in the beginning.
#
### 1. Do you want to install Texlive and Texmaker? https://wiki.ubuntuusers.de/TeX_Live/
printf "\n"
read -p "Do you want to install Texlive and Texmaker? [Y/n]: " yn
if [ "$yn" != "n" ]; then
  sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
fi
#
### 2. Activate User-Friendly-Firewall https://wiki.ubuntuusers.de/ufw/:
printf "\n"
sudo ufw enable && sudo ufw status && sleep 1
#
## Limit potential DoS Attack without root access
#sudo echo "$USER  hard  nproc  2000" >> /etc/security/limits.conf
#
### 3. Additional Themes:
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings
sudo apt install plank
#If Plank (Panel/Dockleiste fuer Apps wie beim Mac) is not available in the default repository, just install from ppa:ricotz/docky
#Strg+Right_Mouse_Button für dessen Einstellungsmenu https://wiki.ubuntuusers.de/Plank/
#
### 4. Create a folder for downloading extern Applications:
mkdir $HOME/Programs
#
### 5. Installation steps for extern Applications:
#A: Download the installation file for the program that you want:
# JetBrains WebStorm/Rider/PyCharm IDE https://www.jetbrains.com/pycharm/download/#section=linux
# Sublime Text https://www.sublimetext.com/
# Sublime Merge https://www.sublimemerge.com/
# VSCodium https://vscodium.com/ does not contain telemetry/tracking
# VSCode https://code.visualstudio.com/ does contain additional telemetry/tracking
# Atom https://atom.io/
# Blender https://www.blender.org/download/
# magick https://imagemagick.org/script/download.php
# ffmulticonverter https://sites.google.com/site/ffmulticonverter/download
# mono https://www.mono-project.com/download/stable/
# zoom-client https://zoom.us/download
# Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app
# gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/
# OBS Studio https://obsproject.com/wiki/install-instructions#linux
# GeoGebra https://wiki.geogebra.org/en/Reference:GeoGebra_Installation#GeoGebra_Classic_5_for_Desktop
# SQL Developer / Universal Database Tool https://dbeaver.io/
# Raspberry Pi Imager https://www.raspberrypi.com/software/ https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options
# Web Browsers:
# Firefox (already preinstalled)
# Chrome https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Vivaldi https://vivaldi.com/download/
# Brave https://brave.com/linux/#release-channel-installation
# Safari (sudo apt install playonlinux -> and then install Safari from there)
# Appimages:
# krita https://krita.org/
# inkscape https://inkscape.org/
# MyPaint http://mypaint.org/
# Stellarium http://stellarium.org/
# Unity-Hub https://unity3d.com/get-unity/download
# Kdenlive https://kdenlive.org/en/download/
# Obsidian https://obsidian.md/
# BalenaEtcher https://www.balena.io/etcher/
# Virtual MIDI Piano Keyboard (VMPK) https://vmpk.sourceforge.io/
#
wget -L https://zoom.us/client/latest/zoom_amd64.deb -P $HOME/Programs/
wget -L https://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb -P $HOME/Programs/
wget -L https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -P $HOME/Programs/
wget -L "https://www.geogebra.org/download/deb.php?arch=amd64" -O $HOME/Programs/geogebra5_amd64.deb
wget -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $HOME/Programs/
#
#B: Change directory to the Programs folder and(&&) install all the debian packages in one go:
# cd ~/Programs && sudo apt install ./*.deb
#
#C: Move AppImages to ~/Programs and make executable (no installation needed)
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
#cd && git clone https://github.com/Tornado3P9/Konsolentools
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
#Strg+Alt+Esc      -> xkill                      = Kill Window under X
#Super+L           -> xflock4                    = Bildschirm sperren
#Shift+Strg+Esc    -> xfce4-taskmanager
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
#Super+D       -> Show Desktop (minimize windows)
### for setting other Keyboard-Shortcuts in your windows-manager:
#xfwm4-settings
#
### for displaying the date and time of the terminal history output type the following line into your terminal:
echo 'export HISTTIMEFORMAT="%F %T  "' >> ~/.bashrc
#
### 11. Bildschirm Hintergrund:
# https://www.pexels.com/
# To search for background folder:
echo -e "\nShowing you the file path to the desktop-background-image-directory:" && locate backdrops
# Or animate your background if a static one is too boring: https://youtu.be/pA-gzjyGHFc
#
### 12. Add custom alias:
echo ""
read -p "Do you want to copy premade aliases? [Y/n]: " yn2
if [ "$yn2" != "n" ]; then
  curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/bash_aliases | tee ~/.bash_aliases
fi
#
### 13. Sicherheitslücke in Firefox schließen:
# Firefox öffnen -> about:config in der URL-Zeile eingeben -> pdfjs.en eingeben -> pdfjs.enableScripting auf False stellen
#
### 14. Create a folder for your own Truetype (.ttf) fonts...show hidden files with the shortcut 'Strg+h'
mkdir $HOME/.fonts
# Now just put all your favourite fonts into this folder. The System will automaticly find them.
#mv ~/Downloads/*.ttf ~/.fonts/
#
### 15. Weiteres:
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
# Blender2.9+ (Professionelles 2D-Maltool fuer Arbeit am Digital Drawing Tablet) https://www.blender.org/
#
### Automaticly enter 'yes' when asked:
#for i in program1 program2 program3; do
#  apt-get install $i -y
#done
#
### Delete a program, either with "remove" or "purge"
#sudo apt remove program_name
#
### install better compatibility with "the better distro kernel" (optional)
#https://liquorix.net/
#
### Audio+Video Converter:
# ffmpeg (complex converter tool for videos, movies, images, pdfs, ...) https://wiki.ubuntuusers.de/FFmpeg/ http://ffmpeg.org/ffmpeg.html
# handbrake (Very Good!) https://wiki.ubuntuusers.de/HandBrake/
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
# Annotate plugin in compiz for Gnome
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
# Also remember to give permissions to the program https://www.arduino.cc/en/Guide/Linux
#
### VirtualBox - https://www.virtualbox.org/manual/  https://www.virtualbox.org/wiki/Downloads  https://youtu.be/HLnA5UekwAI
# It's better to manually download and install the programm from the official website as the version in the repositories
# is sometimes an older one. But ofcourse the repository version will work just fine:
#sudo apt install virtualbox
#sudo apt install virtualbox—ext–pack
#
### QEMU - sometimes even faster than VirtualBox
# https://www.christitus.com/vm-setup-in-linux   https://youtu.be/Kq849CpGd88
# https://github.com/Tornado3P9/Konsolentools/blob/master/QEMU%20virtual%20manager.txt
#
### Dia Diagram Editor http://dia-installer.de/ https://www.osradar.com/some-programs-to-make-uml-diagrams-in-linux/
#sudo apt install dia
#
### Grafical Disk Usage Analyzer https://apps.gnome.org/app/org.gnome.baobab/ https://apps.gnome.org/app/org.gnome.DiskUtility/
#sudo apt install baobab
#
### Create Installation Packages with FPM https://fpm.readthedocs.io/en/latest/index.html
#sudo apt install squashfs-tools
#gem install fpm
#
### Ruby language
# It should be preinstalled. If not, just do:
#sudo apt install ruby-full
#
### ddimage script to use dd more savely (for creating a linux live system on your usb drive)
# curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/ddimage -O
# chmod +x ddimage
# sudo mv ddimage /usr/bin/
# ddimage
#
### go (go-golang) programming language
# Newest Version: https://golang.org/doc/install
# Delete via: "sudo rm -rf /usr/local/go" and also remember to delete the "export PATH=$PATH:/usr/local/go/bin" line
# Repository Version (Golang version 1.13): sudo apt install golang-go
# Delete via: sudo apt purge golang-go
# Test installation: go version
#
### Speeding up Ubuntu
# https://itsfoss.com/speed-up-ubuntu-1310/
# https://github.com/Tornado3P9/Konsolentools/blob/master/snap.txt (completely remove snapd)
# https://averagelinuxuser.com/linux-swap/ (Decrease Swap use)
#
### Installing drivers on Ubuntu is not necessary as Ubuntu detects the Video Card automaticly and installs the driver. AMD drivers have already been integrated into the linux kernel..so nothing much to do there..
#But for the case that you unchecked the checkbox (automaticly install proprietary software...) when installing the system then you can go to (Settings -> Additional Drivers) -> and klick on the line, where it says (proprietary, tested)
#https://phoenixnap.com/kb/install-nvidia-drivers-ubuntu This will automaticly install the driver for you. If there are problems, just try an older version. If there are still problems, then your configuration might need some changes.
#By the way..NVidea will install an additional configuration center (with a green Icon "NVIDEA X SERVER SETTINGS" in case you want to go look for it inside the Settings Menu) but you can just ignore it.
#Only go there if you encounter any problems with the standard configuration. For example you could enable "Force Composition Pipeline" inside the "X SERVER DISPLAY CONFIGURATION" tab, "apply" and "Save To X Configuration File" if you encounter things like "screen tearing".
#I myself never encountered any Problems with grafics cards, but just in case. https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
#
### Prolong the life span of your SSD/Flash Memory
# https://linuxconfig.org/improve-hard-drive-write-speed-with-write-back-caching
#sudo apt install hdparm
# Or Create A Ramdisk:
# https://linuxhint.com/ramdisk_ubuntu_1804/ https://www.linuxbabe.com/command-line/create-ramdisk-linux https://www.cyberciti.biz/faq/howto-create-linux-ram-disk-filesystem/
#
### Managing Trash/Recycle Bin
#sudo apt install trash-cli
# More interesting details about trash handling below and in the man page.
#   restore-trash (1)    - Restore for Command line trash utility.
#   trash (1)            - Command line trash utility.
#   trash-empty (1)      - Empty for Command line trash utility.
#   trash-list (1)       - List trashed files.
#   trash-put (1)        - Command line trash utility.
#   trash-rm (1)         - Removes files matching a pattern from the trash can
# Or create an alias emptyTrash='rm -rf ~/.local/share/Trash/*' if you wish to delete only
# Or you could use this script: https://askubuntu.com/a/727758/225694 even with custom sound!
# Or you could use 'sudo apt-get install autotrash' https://vitux.com/how-to-automatically-empty-the-trash-in-ubuntu/
#
### Audio Control
# https://www.howtoforge.com/tutorial/advanced-audio-control-on-linux/
# If audio give you trouble and it's not because of some proprietary Hardware/Software reason...
# then that's probably because of 'pulse audio' which is still managing the audio today...better versions coming in the future hopefully
# But what you can do is to open the conf file "sudo nano /etc/pulse/daemon.conf" and change two lines (activate them by deleting the semicolon):
#default-sample-rate = 44100
#alternate-sample-rate = 44100
# A good tipp: before you change anything in a configuration file...make a copy of the original...or make a screenshot!(usually has got the date and time in it's name)
# and then put this into a directory on your desktop? where you save all your originals so that you always know what changes you made in the past
# because you will forget sooner or later what it was you did!!
# You probably also can try changing "avoid-resampling" to true or just restart the audio. "pulseaudio -k" will kill the process and systemd will automaticly restart the process.
# That will work but is just inconvenient.
#
### Record Desktop:
# - OBS Studio https://obsproject.com/
# - ffmpeg https://github.com/Tornado3P9/Konsolentools/tree/master/FFmpeg
# - kazam (type "cat ~/.config/kazam/kazam.conf" to see your kazam configuration file)
#
### Gaming:
# Many Developers provide a Linux version for their game in Steam. Like "Shadow of Morder" for instance. But sometimes the linux version only runs on a NVidea grafics card (Witcher 2). So be aware of that if sth. doesn't work.
# Steam also provides the feature to run Windows games with their own wine version called Proton. Alteratively you might want to take a look onto the https://lutris.net/ platform where other linux gamers explain
# how to install some games. Often times there is a ready to go solution or a tutorial and there is also a forum to ask questions. But don't expect anything. Linux is not a gaming system. That's Window's speciality.
#
### Clipboard for multiple items
#sudo apt install xfce4-clipman-plugin
#
#
read -p "Process Finished. Press Enter to Exit:"
printf "\n"
