# Xubuntu 22.04 LTS
https://cloudcone.com/docs/article/ubuntu-22-04-release-schedule-and-features/

### **Installing some useful packages**

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install \
git gparted synaptic \
xsane simple-scan \
pdfarranger img2pdf \
gimp pinta gifsicle \
htop glances whowatch arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr neofetch net-tools iperf3 \
libreoffice libreoffice-l10n-de libreoffice-help-de \
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
python3-pip python3-venv libopencv-dev python3-opencv python-is-python3 \
xclip \
docker.io
```

Installing Texlive and Texmaker for writing LaTeX documents
```bash
sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
```

Also you might want to install some additional codecs[^3]. The Mycrosoft Fonts for instance are not open source and therefore are not included in the ubuntu image.
```bash
# ubuntu-restricted-extras is a so called 'meta-package' which installes a number of other packages.
# The packages zip, unzip, unrar and xz-utils are also included.
sudo apt install ubuntu-restricted-extras rar 
```

### System Update Settings
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Software & Updates** and go to the _Updates_ tab
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → Software → Software & Updates** and go to the _Updates_ tab

### Create a '.fonts' directory for your own Truetype (.ttf) fonts
```bash
# Just put all your favourite fonts into this folder. The System will automaticly find them.
mkdir $HOME/.fonts

# Moving the .ttf files from the Downloads folder to the .fonts folder:
mv ~/Downloads/*.ttf ~/.fonts/

# Show hidden files with the shortcut 'Strg+h'
```

### Creating a 'Progams' folder for all the manually downloaded packages. 
If you keep all the downloaded binaries and installations files together in this folder instead of deleting them, then you will always know what you did to your system in the past. Very simple.

```bash
mkdir $HOME/Programs
```

### Firefox[^1]
This goes over how to Disable Snaps and making sure it doesn’t automatically reinstall.
In this case we are removing the snap version of firefox which was added in ubuntu22.04 instead of the usual .deb package.
The thing about snaps is that they run 'root' and update automaticly without your knowledge and without asking you for permission. And snaps are even terribly slow, especially at first startup.
And snaps will overflow your filesystem output with a hell lot of loopback devices. Snaps are certainly a promising idea but because I can just create the debian installation file myself if it doesn't exist therefore snaps only worsen my experience. I can also use [Flatpaks](https://flathub.org/home) or Appimages if I have to. If you want to use [Snaps then here](https://snapcraft.io/) is where to look for apps.

```bash
# List and Uninstall Snaps
snap list # This shows you what snaps are installed
sudo snap remove firefox # Fill in all snaps listed above

# Purge Snaps and Block Reinstall
sudo apt purge snapd
sudo apt-mark hold snapd

# Verify Uninstall
apt list --installed | grep snap

# Download Firefox from https://www.mozilla.org/en-US/firefox/all/#product-desktop-release
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2

# Extract it
tar xvjf firefox.tar.bz2

# Move the just extracted directory to the /opt/ directory
sudo mv firefox /opt/firefox

# Create a symbolic link to the Firefox in /usr/bin so that all users will be able to run it
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
```

You can also create a ShellScript that updates the installation in one go.

```bash
#!/bin/bash
# The file firefox.tar.bz2 will be overwritten automaticly because of the '-O'
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2
tar xvjf firefox.tar.bz2

tree firefox
read -p "Are you OK with the download? [Y/n]: " yn
[ "$yn" = "n" ] && exit

if [[ -d /opt/firefox/ ]]; then
  sudo rm -r /opt/firefox
  sudo mv firefox /opt/firefox
else
  sudo mv firefox /opt/firefox
  sudo ln -s /opt/firefox/firefox /usr/bin/firefox
fi
```

### Firewall[^2]
```bash
# Enable User_Friendly_Firewall and verify status
sudo ufw enable && sudo ufw status

# Limit potential DoS Attack without root access (optional)
sudo cp /etc/security/limits.conf /etc/security/limits.conf.backup
echo "$USER  hard  nproc  2000" | sudo tee /etc/security/limits.conf

```

### Additional Themes
```bash
# Themes and Icons
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings

# Install a Panel/Dockleiste https://wiki.ubuntuusers.de/Plank/
# If Plank is not available in the default repository, just install from ppa:ricotz/docky (Press Strg+Right_Mouse_Button for the configuration menu)
sudo apt install plank

# (Alt+F2 -> xfce4-) and change some settings:
# xfce4-settings-manager -> Window Manager Tweaks -> Accessibility -> key used to grab and move windows: None
# (german) xfce4-settings-manager -> Fenstereinstellungen der Fensterverwaltung -> Zugreifbarkeit -> Taste zum nehmen und verschieben der Fenster: None
xfce4-settings-manager

# The standard desktop image folder is located at:
locate backdrops
```

### Terminal Style
```bash
# for displaying the date and time of the terminal history output, type the following line into your terminal:
echo 'export HISTTIMEFORMAT="%F %T "' >> ~/.bashrc

# for adding some aliases
wget -L "https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/bash_aliases" -O $HOME/.bash_aliases && source ~/.bashrc
# for displaying the aliases type "aliases" or "alias"
```

### Installing additional applications that are not included in the repository (some are but not the most recent version)
**Development**  
JetBrains WebStorm/Rider/PyCharm IDE https://www.jetbrains.com/pycharm/download/#section=linux  
Sublime Text https://www.sublimetext.com/  
Sublime Merge https://www.sublimemerge.com/  
VSCodium https://vscodium.com/ does not contain telemetry/tracking  
VSCode https://code.visualstudio.com/ does contain additional telemetry/tracking  
Atom https://atom.io/  
Blender https://www.blender.org/download/  
magick https://imagemagick.org/script/download.php  
ffmulticonverter https://sites.google.com/site/ffmulticonverter/download  
mono https://www.mono-project.com/download/stable/  
gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/  
SQL Developer / Universal Database Tool https://dbeaver.io/  
Raspberry Pi Imager https://www.raspberrypi.com/software/ [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)  
KiCad EDA https://www.kicad.org/  
Arduino IDE https://www.arduino.cc/en/software (additionally install: `sudo apt install python-is-python3 python3-serial`)  
Android Studio https://developer.android.com/studio https://snapcraft.io/android-studio  
DaVinci Resolve https://www.blackmagicdesign.com/products/davinciresolve/  
Gaupol Subtitle Editor https://otsaloma.io/gaupol/ (part of the repository: `sudo apt install gaupol` )  
Sigil - EPUB Editor https://sigil-ebook.com/ (part of the repository: `sudo apt install sigil`)  
AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html (part of the repository: `sudo apt install awscli`)  

**Team/School**  
zoom-client https://zoom.us/download  
Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app  
GeoGebra https://wiki.geogebra.org/en/Reference:GeoGebra_Installation#GeoGebra_Classic_5_for_Desktop  
OBS Studio https://obsproject.com/wiki/install-instructions#linux  
JFLAP https://www.jflap.org/jflaptmp/ (start with: `java -jar JFLAP.jar`)  
Periodic Table https://ptable.com/#Properties (online)  
printfriendly https://www.printfriendly.com/ (online)  
Diagram Editor https://www.diagrameditor.com/ (online)  
Dia Diagram Editor http://dia-installer.de/download/linux.html (part of the repository: `sudo apt install dia` )  
OnlyOffice https://www.onlyoffice.com/  
FreeOffice https://www.freeoffice.com/en/  
WPS Office https://www.wps.com/  
LibreOffice https://www.libreoffice.org/ (already preinstalled)  
OpenOffice https://www.openoffice.org/  
Atril - PDF Viewer https://wiki.mate-desktop.org/mate-desktop/applications/atril/ (already preinstalled)  
PDFArranger (already preinstalled)  

**Web Browser**  
Firefox (already preinstalled)  
Chrome https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb  
Vivaldi https://vivaldi.com/download/  
Brave https://brave.com/linux/#release-channel-installation  
Safari (sudo apt install playonlinux -> and then install Safari from there)  

**Appimage Programs that run on any Linux system**  
krita https://krita.org/  
inkscape https://inkscape.org/  
MyPaint http://mypaint.org/  
Stellarium http://stellarium.org/  
Unity-Hub https://unity3d.com/get-unity/download  
Kdenlive https://kdenlive.org/en/download/  
Obsidian https://obsidian.md/  
BalenaEtcher https://www.balena.io/etcher/  
Virtual MIDI Piano Keyboard (VMPK) https://vmpk.sourceforge.io/  
Hugin Panorama Stitcher - Grafics Editor http://hugin.sourceforge.net/  
OpenShot Video Editor https://www.openshot.org/  
Shotcut Video Editor https://www.shotcut.org/  
Olive Video Editor https://www.olivevideoeditor.org/  
```bash
# You can also use 'wget' or 'curl' to download the programs
wget -L https://zoom.us/client/latest/zoom_amd64.deb -P $HOME/Programs/
wget -L https://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb -P $HOME/Programs/
wget -L https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -P $HOME/Programs/
wget -L "https://www.geogebra.org/download/deb.php?arch=amd64" -O $HOME/Programs/geogebra5_amd64.deb
wget -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $HOME/Programs/
```

Installation and Setup of the downloaded Programs:
```bash
# Changing directory to the Programs folder and(&&) installing all the debian packages in one go
cd ~/Programs && sudo apt install ./*.deb

# Making all the AppImages executable that have been placed into of the ~/Programs directory (no installation needed)
chmod u+x ~/Programs/*.AppImage

# Extracting the downloaded blender archive and copying to Programs folder...if you downloaded it into the Downloads folder... (no installation needed)
tar xvf ~/Downloads/blender*.tar.xz -C ~/Programs/
```

### Adding ShortCuts

`xfce4-settings-manager` -> Tastatur -> Tastenkuerzel  
`xfce4-keyboard-settings`  

For setting Keyboard-Shortcuts in your windows-manager:  
`xfwm4-settings`  

**Default:**  
(Strg+Alt+Entf -> xfce4-session-logout)  
(Shift+Strg+Esc -> xfce4-taskmanager)  
(Alt+F2 -> xfrun4)  
(Super+L -> xflock4)  
(Super+W -> exo-open --launch WebBrowser)  
(Super+F -> exo-open --launch FileManager)  
(Super+D -> Show Desktop (minimize windows) )  
(Super+F1 -> xfce4-find-cursor)  
(Print -> xfce4-screenshooter -f)  
(Shift+Print -> xfce4-screenshooter -r)  
(Alt+Print  -> xfce4-screenshooter -w)  
(Strg+Esc -> xfce4-popup-whiskermenu (Standard Menu) )  
(Alt+F1 -> xfce4-popup-applicationsmenu)  
Quite useful: kill the open window below the mouse pointer  
(Strg+Alt+Esc -> xkill)  

### 4 ways to create a Linux Live System on a usb stick
1. `sudo apt install usb-creator-gtk`
2. [BalenaEtcher](https://www.balena.io/etcher/)
3. [Raspberry Pi Imager](https://www.raspberrypi.com/software/) [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)
4. ddimage script using dd[^4]
```bash
curl -sS https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/ddimage -O
chmod +x ddimage
sudo mv ddimage /usr/bin/
ddimage
```

### Programming languages
```bash
# Ruby and the fpm utility (https://fpm.readthedocs.io/en/latest/index.html)
sudo apt install ruby-full rpm && sudo gem install fpm
fpm --version

# GoLang (https://go.dev/)
sudo apt install golang
go version

# Rust (https://www.rust-lang.org/tools/install)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.profile && rustc --version
```

### pip install ...

The pip version is always up to date and usually the better choice compared with the repository version of your operating system.
```bash
# Installing tldr (too long too read) for better help information compared to the usualy 'man'-page or the --help command.
# But remember that you probably have to restart your session because the PATH variable hasn't updated yet. See `echo $PATH`
# But another way is to just reload the .profile file if the entry does exist but just hasn't been updated to the current running session.
pip install tldr
source ~/.profile && tldr --version
```
Update pip via: `python3 -m pip install --upgrade pip`

### Backups
- [Timeshift](https://linuxconfig.org/ubuntu-22-04-system-backup-and-restore) - `sudo apt install timeshift`
- [Chezmoi - Easily moving Linux installs](https://christitus.com/chezmoi/)
- [Déjà Dup Backups](https://snapcraft.io/deja-dup) - `sudo apt install deja-dup`
- [Make a Full Disk Backup with DD](https://bdoga.com/full-disk-backup-with-dd/)

### Virtual Machine
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - `sudo apt install virtualbox`
- [QEMU](https://www.christitus.com/vm-setup-in-linux), [second link](https://github.com/Tornado3P9/Konsolentools/blob/master/QEMU%20virtual%20manager.txt) - Even faster than VirtualBox

### Gaming
- [Lutris](https://lutris.net/)
- [Steam](https://store.steampowered.com/)
- [itch.io](https://itch.io/)

### Tipps:
[If you do these 5 things... You should NOT use Linux](https://youtu.be/06cKL5DQ5CY)  
[Who should use Linux?](https://youtu.be/7SU-BupOe7s)  
[Simple Tasks on Linux](https://youtu.be/6h2UmKTcCfA)  
[How to Use GitHub](https://youtu.be/v_1iqtOnUMg)  
[Git Tutorial Playlist](https://www.youtube.com/playlist?list=PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR)  
[Understanding Linux Distros](https://youtu.be/DKFnqAtEOvc)  
[How to Choose a Linux Distribution](https://youtu.be/iox7fr7p5Hc)  
[Linux gaming is better than Windows sometimes](https://youtu.be/i9Op7Xa5eKs)  
[Linux being better for Blender 3D Renderings](https://youtu.be/cpE2B2QSsa0)

### Optional:
Before invoking `apt install`, filter non-existent packages out of the list. The list of installable  
packages can be obtained by running `apt-cache --generate pkgnames`, which we then `grep` for  
the packages we want to install, and `xargs` the result into `apt install`. The full command looks  
like this:  
```
apt-cache --generate pkgnames \
| grep --line-regexp --fixed-strings \
  -e package1 \
  -e package2 \
  -e package3 \
  … \
| xargs apt install -y
```


[^3]:Additional Codecs https://www.makeuseof.com/tag/ubuntu-restricted-extras-install-ubuntu-linux/
[^1]:Install Firefox manually: https://itsfoss.com/firefox-quantum-ubuntu/
[^2]:Firewall: https://github.com/Tornado3P9/Konsolentools/blob/master/firewall_ufw.txt
[^4]:dd https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-images-on-linux https://github.com/Tornado3P9/Konsolentools/blob/master/dd.txt


