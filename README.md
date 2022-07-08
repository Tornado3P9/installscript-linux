# Xubuntu 22.04 LTS

### First set up the base system
https://xubuntu.org/ + [balenaEtcher](https://www.balena.io/etcher/) or [Rufus USB Writer](https://rufus.ie/en/) for Windows users

### Now you can make some customizations to the new system
Bring your installation up to date:
```bash
sudo apt update && sudo apt upgrade -y
```

Install some useful packages:
```bash
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
wireguard \
jeex bless jq rename \
usb-creator-gtk \
python3-pip python3-venv libopencv-dev python3-opencv python-is-python3 \
xclip \
docker.io
```

Install some additional codecs:[^3]
```bash
sudo apt install ubuntu-restricted-extras rar
```
*ubuntu-restricted-extras* is a so called 'meta-package' which installs a number of other packages.  
The Microsoft Fonts for instance are not open source and therefore are not included in the ubuntu image.  
Or you can try to do this manually. Some of the packages are:  
*libavcodec-extra ttf-mscorefonts-installer gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi unrar rar xz-utils*  
The packages zip and unzip are also included. But making sure never hurts.  

### Create a '.fonts' directory for your own Truetype (.ttf) fonts
```bash
# Just put all your favourite fonts into this folder. The System will automatically find them.
mkdir $HOME/.fonts

# Moving the .ttf files from the Downloads folder to the .fonts folder:
mv ~/Downloads/*.ttf ~/.fonts/

# Show hidden files with the shortcut 'Ctrl+H' (or 'Strg+H')
```

### Create a 'Programs' folder for all the manually downloaded packages. 
If you keep all the downloaded binaries and installation files together in this folder instead of deleting them, you will always know what you did to your system in the past. Very simple.
```bash
mkdir $HOME/Programs
```

### System Update Settings
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Software & Updates** and go to the _Updates_ tab
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → Software → Software & Updates** and go to the _Updates_ tab

### The Alt key problem
Some Linux systems support the option to move applications around using the **Alt** key. The problem is that a lot of programs that run on both Windows and Linux also make heavy usage of the Alt key.
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**
- Press **Alt+F2** and type *xfce4-settings-manager*. Then go to **Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**

### Firefox[^1]
Security tip for using Firefox:
- Type `about:config` into the *URL Search Bar* and then look for `pdfjs.enableScripting`. Set that to `false`.
- Type `about:preferences` into the *URL Search Bar* and go to **Privacy & Security**. Scroll down and choose `Enable HTTPS-Only Mode in all windows`.
This way your browser will only allow save connections and will ask you for permission if the website does not support https.
- Type `about:performance` into the *URL Search Bar* to see the Firefox **Task Manager**. There you can see which application or addon uses up too many resources.


How to disable Snaps and making sure it doesn’t automatically reinstall.
The issue with Snaps is that they run 'root' and update automatically without your knowledge and without asking for permission.
They are also terribly slow, especially at first startup, and will overflow your filesystem output with a lot of loopback devices.
The desktop integration is not always perfect. The results can be wrong color schemes or unreadable texts. However, Snaps seem to be working well on server installations.
Snaps are certainly a promising idea, but because we can just create the debian installation file ourselves if it doesn't exist, Snaps only worsen the overall experience.
You can also use [Flatpaks](https://flathub.org/home) or Appimages if you have to. If you want to use [Snaps, then here](https://snapcraft.io/) is where to look for apps.

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
# The file firefox.tar.bz2 will be overwritten automatically because of the '-O'
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
echo "$USER  hard  nproc  2000" | sudo tee -a /etc/security/limits.conf

```

### Additional Themes
```bash
# Themes and Icons
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings

# Install a Panel/Dockleiste https://wiki.ubuntuusers.de/Plank/
# If Plank is not available in the default repository, just install from ppa:ricotz/docky (Press Ctrl+Right_Mouse_Button for the configuration menu)
sudo apt install plank

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

### Installing Texlive and Texmaker for writing LaTeX documents
```bash
sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
```

### Installing additional applications that are not included in the repository (some are but not the most recent version)
**Development**  
JetBrains WebStorm/Rider/PyCharm IDE https://www.jetbrains.com/pycharm/download/#section=linux  
Sublime Text https://www.sublimetext.com/  
Sublime Merge https://www.sublimemerge.com/  
VSCodium https://vscodium.com/ does not contain telemetry/tracking  
VSCode https://code.visualstudio.com/ does contain additional telemetry/tracking  
Atom https://atom.io/  
Eclipse IDE https://www.eclipse.org/  
NetBeans IDE https://netbeans.apache.org/download/  
Blender https://www.blender.org/download/ KeenTools https://keentools.io/  
NormalMap https://www.smart-page.net/smartnormal/ (online)  
magick https://imagemagick.org/script/download.php  
ffmulticonverter https://sites.google.com/site/ffmulticonverter/download  
mono https://www.mono-project.com/download/stable/  
gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/  
SQL Developer / Universal Database Tool https://dbeaver.io/  
Oracle SQL Developer https://www.oracle.com/tools/downloads/sqldev-downloads.html  
Raspberry Pi Imager https://www.raspberrypi.com/software/ [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)  
KiCad EDA https://www.kicad.org/  
Arduino IDE https://www.arduino.cc/en/software  
(additionally install: `sudo apt install python-is-python3 python3-serial`)  
Android Studio https://developer.android.com/studio https://snapcraft.io/android-studio  
DaVinci Resolve https://www.blackmagicdesign.com/products/davinciresolve/  
FL Studio https://jstaf.github.io/2018/02/22/flstudio-on-linux.html  
Unreal Engine https://www.unrealengine.com/  
Gaupol Subtitle Editor https://otsaloma.io/gaupol/ (part of the repository: `sudo apt install gaupol` )  
Sigil - EPUB Editor https://sigil-ebook.com/ (part of the repository: `sudo apt install sigil`)  
AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html  
(part of the repository: `sudo apt install awscli`)  
FileZilla https://filezilla-project.org/download.php?type=client (part of the repository: `sudo apt install filezilla`)  

**Team/School**  
zoom-client https://zoom.us/download  
Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app  
Jitsi https://jitsi.org/  
GeoGebra https://wiki.geogebra.org/en/Reference:GeoGebra_Installation#GeoGebra_Classic_5_for_Desktop  
OBS Studio https://obsproject.com/wiki/install-instructions#linux  
JFLAP https://www.jflap.org/jflaptmp/ (start with: `java -jar JFLAP.jar`)  
Periodic Table https://ptable.com/#Properties (online)  
printfriendly https://www.printfriendly.com/ (online)  
Diagram Editor https://www.diagrameditor.com/ (online)  
Dia Diagram Editor http://dia-installer.de/download/linux.html (part of the repository: `sudo apt install dia` )  
Mermaid Diagram Editor https://mermaid.live/ [about](https://mermaid-js.github.io/mermaid/#/) [video](https://youtu.be/JiQmpA474BY) (online)  
OnlyOffice https://www.onlyoffice.com/  
FreeOffice https://www.freeoffice.com/en/  
WPS Office https://www.wps.com/  
LibreOffice https://www.libreoffice.org/ (already preinstalled)  
OpenOffice https://www.openoffice.org/  
Microsoft Office 365 https://www.office.com/ (online)  
Google Docs https://www.google.com/docs/about/ (online)  
Atril - PDF Viewer https://wiki.mate-desktop.org/mate-desktop/applications/atril/ (already preinstalled)  
PDFArranger (part of the repository: `sudo apt install pdfarranger`)  

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
Obsidian https://obsidian.md/  
BalenaEtcher https://www.balena.io/etcher/  
Virtual MIDI Piano Keyboard (VMPK) https://vmpk.sourceforge.io/  
Hugin Panorama Stitcher - Grafics Editor http://hugin.sourceforge.net/  
Kdenlive Video Editor https://kdenlive.org/en/download/  
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
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
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

`xfce4-settings-manager` → Keyboard → Application Shortcuts  
`xfce4-keyboard-settings`  

For setting Keyboard Shortcuts in your windows manager:  
`xfwm4-settings`  

**Default:**  
(Ctrl+Alt+Delete = xfce4-session-logout)  
(Shift+Ctrl+Esc = xfce4-taskmanager)  
(Alt+F2 = xfrun4)  
(Super+L = xflock4)  
(Super+W = exo-open --launch WebBrowser)  
(Super+F = exo-open --launch FileManager)  
(Super+D = Show Desktop (minimize windows) )  
(Super+F1 = xfce4-find-cursor)  
(Print = xfce4-screenshooter -f)  
(Shift+Print = xfce4-screenshooter -r)  
(Alt+Print  = xfce4-screenshooter -w)  
(Ctrl+Esc = xfce4-popup-whiskermenu (Standard Menu) )  
(Alt+F1 = xfce4-popup-applicationsmenu)  
*Quite useful: killing the open window below the mouse pointer*  
(Ctrl+Alt+Esc = xkill)  

### Adding App launcher to the panel
![app launcher](pics/add_launcher.gif)

### 4 ways to create a Linux Live System on a usb stick
1. Startup Disk Creator `sudo apt install usb-creator-gtk`
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
sudo apt install squashfs-tools ruby-full rpm && sudo gem install fpm
fpm --version

# GoLang (https://go.dev/)
sudo apt install golang
go version

# Rust (https://www.rust-lang.org/tools/install)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.profile && rustc --version
```

### pip install ...

The pip version is always up to date and usually the better choice compared to the repository version of your operating system.
```bash
# Installing tldr (too long didn´t read) for better help information compared to the usually 'man'-page or the --help command.
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

### Photoshop alternatives (most adope applications don't work well on linux)[^6]
- Gimp (very good image manipulation editor) https://www.gimp.org/
- Krita (supports many different color codes -> good for printing tasks) https://krita.org/
- MyPaint (good for working with a digital drawing tablet) http://mypaint.org/
- Inkscape (vector graphics) https://inkscape.org/
- Blender (2d drawing tool for working with a digital drawing tablet) https://www.blender.org/
- Darktable (photography workflow application and raw developer) https://www.darktable.org/
- PIXLR (online) https://pixlr.com/
- Photopea (online, good compatibility with Photoshop's text objects) https://www.photopea.com/

### Decentralised Data Storage - IPFS
- IPFS Desktop https://docs.ipfs.io/install/ipfs-desktop/
- IPFS Companion browser add-on https://docs.ipfs.io/install/ipfs-companion/
- host single-page website https://docs.ipfs.io/how-to/websites-on-ipfs/single-page-website/#linux

### Converting RPM to DEB packages
- FPM [fpm.readthedocs.io](https://fpm.readthedocs.io/en/latest/packages/rpm.html#arguments-when-used-as-input-type)
- Alien [manpages.ubuntu.com](https://manpages.ubuntu.com/manpages/jammy/man1/alien.1p.html) [geeksforgeeks.com](https://www.geeksforgeeks.org/how-to-convert-rpm-package-to-deb-using-alien-package-converter/)

### DVD
If your PC has got a DVD player, then you might want to install the missing library for playing commercial DVDs[^5]
```bash
# On Debian and Ubuntu, you can install `libdvdcss` via `libdvd-pkg` helper package:
sudo apt install libdvd-pkg
# And by running the following command, which will download, build and install the latest libdvdcss source to your machine:
sudo dpkg-reconfigure libdvd-pkg
```
If there are problems with the video playback, then it might help to delete the hidden directory `rm -r ~/.dvdcss/` in order to force the program to create a new css key.
You also might want to [disable Hardware-accelerated decoding](https://wiki.videolan.org/VLC_HowTo/Hardware_acceleration/) in your media player if the displayed output is flawed and you are using a AMD Radeon graphics card.

### Grub2 - boot menu
To make small changes to the configuration, just open this text file with the command `nano /etc/default/grub`. You will then be presented with smth like this:
```bash
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=2
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

```
Changing the number from `GRUB_TIMEOUT` will change the number of seconds that the grub menu will be visible.  
For further instructions go to https://www.gnu.org/software/grub/manual/grub/grub.html#Simple-configuration  

### Tipps:
[Customize Your Xfce Desktop To Look Like macOS Big Sur](https://youtu.be/uvvoJU69uNo)  
[Make Your Xfce Desktop Look More Unique and Beautiful](https://youtu.be/X3siZNJN3ec)  
[If you do these 5 things... You should NOT use Linux](https://youtu.be/06cKL5DQ5CY)  
[Who should use Linux?](https://youtu.be/7SU-BupOe7s)  
[Simple Tasks on Linux](https://youtu.be/6h2UmKTcCfA)  
[Understanding Linux Distros](https://youtu.be/DKFnqAtEOvc)  
[Choosing the Right Linux Distro](https://youtu.be/dL05DoJ0qsQ)  
[Linux gaming is better than Windows sometimes](https://youtu.be/i9Op7Xa5eKs)  
[Linux being better for Blender 3D Renderings](https://youtu.be/cpE2B2QSsa0)  
[How to Use GitHub](https://youtu.be/v_1iqtOnUMg)  
[Git Tutorial Playlist](https://www.youtube.com/playlist?list=PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR)  

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
[^5]:VideoLAN libdvdcss: https://www.videolan.org/developers/libdvdcss.html, https://wiki.ubuntuusers.de/DVD-Wiedergabe/#Problembehebung
[^6]:Photoshop: https://appdb.winehq.org/objectManager.php?sClass=application&iId=20, https://lutris.net/games/adobe-photoshop-cs6/

