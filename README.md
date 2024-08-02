# Xubuntu

### Table of Contents
- [First set up the base system](#first-set-up-the-base-system)
- [Now you can make some first customizations to the new system](#now-you-can-make-some-first-customizations-to-the-new-system)
- [Graphical Configuration Assistants are a great help](#graphical-configuration-assistants-are-a-great-help)
- [Create a `.fonts` directory for your own Truetype (.ttf) fonts](#create-a-fonts-directory-for-your-own-truetype-ttf-fonts)
- [Create a `Programs` folder for all the manually downloaded packages](#create-a-programs-folder-for-all-the-manually-downloaded-packages)
- [System Update Settings](#system-update-settings)
- [The `Alt` key problem](#the-alt-key-problem)
- [You can change the keyboard key map](#you-can-change-the-keyboard-key-map)
- [Firewall](#firewall2)
- [One-time password (OTP) also known as 2-Factor authentication](#one-time-password-otp-also-known-as-2-factor-authentication)
- [Additional Themes](#additional-themes)
- [Terminal behavior](#terminal-behavior)
- [Installing tldr (too long, didn't read) helper tool](#installing-tldr-too-long-didnt-read-helper-tool)
- [Installing Texlive and Texmaker for writing LaTeX documents](#installing-texlive-and-texmaker-for-writing-latex-documents)
- [Incomplete list of applications that can be installed](#installing-additional-applications-that-are-not-included-in-the-repository-some-are-but-not-with-the-most-recent-version)
- [Installation and Setup of the downloaded Programs](#installation-and-setup-of-the-downloaded-programs)
- [`Firefox` Web Browser](#firefox-web-browser1)
- [Adding ShortCuts](#adding-shortcuts)
- [Adding App launcher to the XFCE panel](#adding-app-launcher-to-the-xfce-panel)
- [Four ways to create a Linux Live System on a usb stick](#four-ways-to-create-a-linux-live-system-on-a-usb-stick)
- [Some Programming languages](#some-programming-languages)
- [pip install ...](#pip-install-)
- [Backups](#backups)
- [Check File Integrity](#check-file-integrity)
- [Virtual Machine](#virtual-machine)
- [Gaming](#gaming)
- [Game Engines](#game-engines)
- [Photoshop alternatives (most adope applications don't work well on linux)](#photoshop-alternatives-most-adope-applications-dont-work-well-on-linux6)
- [Password manager](#password-manager)
- [Microsoft PowerShell](#microsoft-powershell)
- [Decentralised Data Storage - IPFS](#decentralised-data-storage---ipfs)
- [Converting RPM to DEB packages](#converting-rpm-to-deb-packages)
- [ShellGPT](#shellgpt)
- [The Clipboard Manager](#the-clipboard-manager)
- [A Clipboard Driver for the terminal](#a-clipboard-driver-to-paste-information-from-console-to-clipboard-so-that-it-can-be-used-together-with-the-ctrlv-shortcut-or-other-console-applications-can-be-installed-with)
- [Tiling Window Desktop Environments](#tiling-window-desktop-environments)
- [DVD](#dvd)
- [Grub2 - boot menu](#grub2---boot-menu)
- [Wine (run windows programs)](#wine-run-windows-programs)
- [External Hardware/Controller/Game Pad](#external-hardwarecontrollergame-pad)
- [Managing power profiles / battery life](#managing-power-profiles--battery-life)
- [some different topics list](#some-different-topics)
- [Deutscher Linux Support](#deutscher-linux-support)

### First set up the base system
https://xubuntu.org/ + [balenaEtcher](https://www.balena.io/etcher/) or [Rufus USB Writer](https://rufus.ie/en/) for Windows users

### Now you can make some first customizations to the new system
Bring your installation up to date (What is [apt](https://www.maketecheasier.com/ultimate-guide-apt-and-apt-get-commands/)?):
```bash
sudo apt update && sudo apt upgrade -y
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

Install some useful programs (remove what lines you don't want, copy the whole command block, paste it into the terminal and press Enter):
```bash
sudo apt update && \
sudo apt install \
git gparted synaptic mtools \
xsane simple-scan \
pdfarranger img2pdf \
gimp pinta gifsicle qrencode scrot zbar-tools \
htop glances whowatch arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr neofetch net-tools iperf3 ncdu \
libreoffice libreoffice-l10n-de libreoffice-help-de \
mediainfo mediainfo-gui \
mpv ffmpeg vlc audacity guvcview kazam handbrake \
lxsplit \
libimage-exiftool-perl perl-doc \
steam \
xsensors \
wget curl \
tree autojump \
ufw gufw \
kleopatra \
wireguard \
jeex bless jq rename rg \
usb-creator-gtk \
python3-pip python3-venv python3-tk libopencv-dev python3-opencv python-is-python3 \
docker.io \
sqlite3 \
trash-cli
```

### Graphical Configuration Assistants are a great help
- https://www.linux-assistant.org/ Beginner friendly and with [Youtube-Tutorials](https://youtu.be/uW11Uu8vhqc)
- https://github.com/ChrisTitusTech/linutil For Linux users
- https://github.com/ChrisTitusTech/winutil For Windows users

You can find most configuration files in your home directory (**`cd /home/$USER/`**). Use the shortcut **`Ctrl+H`** to display the hidden files in the *File Manager* or the commands **`ls -a`** or **`ls -la`** in the terminal.
The names of hidden files or directories start with a dot, e.g. **`.config`**

You can start your *File Manager* with the shortcut **`Windows key + F`** or by typing **`thunar`** into the terminal. You also can start your main web browser with the shortcut **`Windows key + W`** or by typing **`firefox`** into the terminal.

### Create a `.fonts` directory for your own Truetype (.ttf) fonts
Just put all your favourite fonts into this folder. The System will automatically find them.

1. Create the fonts directory (makedirectory):  
   ```bash
   mkdir $HOME/.fonts
   ```

2. Download some new fonts:  
Let's take these TeX fonts for jsMath as an example (web browsers use them to display math formulas)  
https://www.math.union.edu/~dpvc/jsMath/download/jsMath-fonts.html

3. Move all .ttf files from the Downloads folder to the .fonts folder:  
   ```bash
   mv ~/Downloads/*.ttf ~/.fonts/
   ```

### Create a `Programs` folder for all the manually downloaded packages
If you keep all the downloaded binaries and installation files together in this folder instead of deleting them, you will always know what you did to your system in the past. Very simple.
```bash
mkdir $HOME/Programs
```
`$HOME/` and `~/` and `/home/$USER/` basically do the same thing.

### System Update Settings
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Software & Updates** and go to the _Updates_ tab
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → Software → Software & Updates** and go to the _Updates_ tab

### The Alt key problem
Some Linux systems support the option to move applications around using the **`Alt`** key. The problem is that a lot of programs that run on both Windows and Linux also make heavy usage of the Alt key. Therefore it might be necessary to remove the presetting on Linux.
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**
- Press **Alt+F2** and type *xfce4-settings-manager*. Then go to **Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**

### You can change the keyboard key map
- [**Kanata**](https://github.com/jtroo/kanata) - A cross-platform software keyboard remapper for Linux, macOS and Windows  
Setup: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md  
Example: https://github.com/dreamsofcode-io/escapecontrol/tree/main/linux/kanata
- [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) for Linux
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) for macOS

### Firewall[^2]
```bash
# For Desktop Users: Enable User_Friendly_Firewall and verify status
sudo ufw enable && sudo ufw status

# For Servers: UFW, Fail2Ban, AppArmor or SELinux, iptables, ...
# Take a look at
https://christitus.com/linux-security-mistakes/
https://github.com/Jean28518/linux-guides/tree/main/basic-security-for-server
https://gitlab.com/apparmor/apparmor/-/wikis/Documentation
https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/index

# Limit potential DoS Attack without root access (optional)
sudo cp /etc/security/limits.conf /etc/security/limits.conf.backup
echo "$USER  hard  nproc  2000" | sudo tee -a /etc/security/limits.conf
```

### One-time password (OTP) also known as 2-Factor authentication
Probably more useful for server access..:
```bash
# 1. Install Google Authenticator
sudo apt install libpam-google-authenticator

# 2. Install OTP mobile app on your phone

# 3. Configure and activate Google Authenticator
google-authenticator
```
further details at: https://averagelinuxuser.com/otp-ubuntu/  

### Additional Themes
```bash
# Themes and Icons from the repository
sudo apt install arc-theme moka-icon-theme numix-icon-theme numix-gtk-theme lightdm-gtk-greeter-settings

# Be careful when downloading themes from the internet. If unsure, don't do it.

# Install an Apple Macbook like Panel/Dockleiste https://wiki.ubuntuusers.de/Plank/
# If Plank is not available in the default repository, just install from ppa:ricotz/docky (don't just trust PPAs)
# (Press Ctrl+Right_Mouse_Button for the configuration menu. For the panel to appear at startup, you have to add it to the 'session and startup' programs list in the Xubuntu Settings.)
sudo apt install plank

# The standard desktop image folder is located at:
locate backdrops
```

### Terminal behavior
```bash
# for displaying the date and time of the terminal history output, type the following line into your terminal:
echo 'export HISTTIMEFORMAT="%F %T "' >> ~/.bashrc

# for adding some aliases
wget -L "https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/bash_aliases" -O $HOME/.bash_aliases && source ~/.bashrc
# for displaying the aliases, type "aliases" or "alias"

# Show time zone:
date
timedatectl
# If you wish to change the current time zone:
dpkg-reconfigure tzdata
```
The linux terminal usually accepts `Ctrl+Shift+C` and `Ctrl+Shift+V` instead of the more common `Ctrl+C` and `Ctrl+V`. You can change that in the terminal by going to **Edit → Preferences → Shortcuts**. Still, it might be better to just get accustomed to the standard shortcuts as other people on forums will also be using those. That will make it easier for when you need to ask for help. Also remember that the shortcut for stopping a process `Ctrl+C` will not work anymore and might change to `Ctrl+Shift+C`.

### Installing tldr (too long, didn't read) helper tool
```bash
git clone https://github.com/tldr-pages/tldr-c-client.git
cd tldr-c-client

sudo ./deps.sh      # install dependencies
make                # build tldr
sudo make install   # install tldr

tldr ls             # run tldr and explain with examples how the command 'ls' works
```

### Installing [Texlive](https://wiki.ubuntuusers.de/TeX_Live/) and [Texmaker](https://www.xm1math.net/texmaker/) for writing LaTeX documents
```bash
sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
```

### Incomplete list of applications that can be installed
Incomplete list of Applications that are not included in the repository or just not with the most recent version:

**Office/School**  
GeoGebra https://wiki.geogebra.org/en/Reference:GeoGebra_Installation#GeoGebra_Classic_5_for_Desktop  
JFLAP https://www.jflap.org/jflaptmp/ (start with: `java -jar JFLAP.jar`)  
Periodic Table https://ptable.com/#Properties (online)  
printfriendly https://www.printfriendly.com/ (online)  
Diagram Editor https://www.diagrameditor.com/ (online)  
ExcaliDraw https://excalidraw.com/ (online)  
Dia Diagram Editor http://dia-installer.de/download/linux.html (part of the repository: `sudo apt install dia` )  
Mermaid Diagram Editor https://mermaid.live/ [about](https://mermaid-js.github.io/mermaid/#/) [video](https://youtu.be/JiQmpA474BY) (online)  
Miro Board https://miro.com/ (online)  
Trello Board https://trello.com/ (online)  
OnlyOffice https://www.onlyoffice.com/  
FreeOffice https://www.freeoffice.com/en/  
WPS Office https://www.wps.com/ (developed by Kingsoft, based in Beijing, China)  
LibreOffice https://www.libreoffice.org/ (already preinstalled)  
OpenOffice https://www.openoffice.org/  
Microsoft Office 365 https://www.office.com/ (online)  
Google Docs https://www.google.com/docs/about/ (online)  
Atril - PDF/ebook Viewer https://wiki.mate-desktop.org/mate-desktop/applications/atril/ (already preinstalled)  
PDFArranger (part of the repository: `sudo apt install pdfarranger`)  
Stirling PDF https://stirlingpdf.io/ (online)  
Calibre - ebook management https://calibre-ebook.com/download_linux (part of the repository: `sudo apt install calibre`)  
Microsoft OneNote https://www.onenote.com/hrd (online)  
Google Workspace - like OneNote https://workspace.google.com/ (online)  
Obsidian - like OneNote but private https://obsidian.md/download (**.Deb**, Snap or .Appimage)  
Libre Workspace https://www.libre-workspace.org/ (online/local, language german)  
Kleopatra https://www.openpgp.org/software/kleopatra/ (part of the repository: `sudo apt install kleopatra`)  

**Video Calls**  
Zoom https://zoom.us/download . [how-to](https://github.com/Tornado3P9/installscript-linux/blob/master/zoom.md)  
Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/download-app  
TeleGuard https://teleguard.com/  
Element https://element.io/  
Jitsi https://jitsi.org/  
Jami https://jami.net/  
Nextcloud Talk https://nextcloud.com/talk/  
BigBlueButton https://bigbluebutton.org/  
Discord https://discord.com/download?linux (or just use the web version)  
Skype https://snapcraft.io/skype (you need snap enabled for this)  
Slack https://slack.com/downloads/linux (**.Deb**, Snap, or .RPM)  
Signal https://signal.org/download/linux/  
Telegram https://desktop.telegram.org/  

**Video Player**  
MPV Player https://mpv.io/ with [keyboard shortcuts](https://manpages.ubuntu.com/manpages/bionic/man1/mpv.1.html) (part of the repository: `sudo apt install mpv` )  
Haruna Video Player https://haruna.kde.org/ (part of the repository: `sudo apt install haruna` )  
SMPlayer https://www.smplayer.info/ (part of the repository: `sudo apt install smplayer` )  
VLC Media Player https://www.videolan.org/vlc/ (part of the repository: `sudo apt install vlc` )  
Parole https://docs.xfce.org/apps/parole/start (already preinstalled)  

**Screen Recording**  
OBS Studio https://obsproject.com/wiki/install-instructions#linux (part of the repository: `sudo apt install obs-studio` )  
SimpleScreenRecorder https://www.maartenbaert.be/simplescreenrecorder/#download (part of the repository: `sudo apt install simplescreenrecorder` )  
Kazam https://github.com/henrywoo/kazam (part of the repository: `sudo apt install kazam` )  
ScreenRec https://screenrec.com/screen-recorder#download  
Terminal https://youtu.be/vWWSpDE7Gk4  

**Video Editing**  
DaVinci Resolve https://www.blackmagicdesign.com/products/davinciresolve/  
HandBrake https://handbrake.fr/ a multithreaded video transcoder (part of the repository: `sudo apt install handbrake` )  
Kdenlive Video Editor https://kdenlive.org/en/download/ (part of the repository: `sudo apt install kdenlive` )  
OpenShot Video Editor https://www.openshot.org/  
Shotcut Video Editor https://www.shotcut.org/  
Olive Video Editor https://www.olivevideoeditor.org/  
Blender https://www.blender.org/features/video-editing/  

**Sound Editing**  
Audacity https://www.audacityteam.org/ (part of the repository: `sudo apt install audacity` )  
FL Studio https://jstaf.github.io/2018/02/22/flstudio-on-linux.html  
Hydrogen http://hydrogen-music.org/downloads/ (part of the repository: `sudo apt install hydrogen` )  
Ardour https://ardour.org/ (part of the repository: `sudo apt install ardour` )  
LMMS https://lmms.io/ (part of the repository: `sudo apt install lmms` )  
Wavacity https://wavacity.com/ (derived from Audacity: online)  

**Web Browser**  
Firefox (already preinstalled)  
LibreWolf: An Open-Source Firefox Fork Without the Telemetry https://librewolf.net/  
Chrome https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb  
Vivaldi https://vivaldi.com/download/  
Brave https://brave.com/linux/#release-channel-installation  
Safari (sudo apt install playonlinux -> and then install Safari from there)  
Thorium https://thorium.rocks/  
Mullvad https://mullvad.net/en/download/browser/linux  
Tor Browser https://www.torproject.org/download/  

**Development**  
JetBrains WebStorm/Rider/IntelliJ/PyCharm IDE https://www.jetbrains.com/pycharm/download/#section=linux  
Sublime Text https://www.sublimetext.com/  
Sublime Merge https://www.sublimemerge.com/  
VSCodium https://vscodium.com/ does not contain telemetry/tracking but some extensions have to be added [manually](https://milicendev.netlify.app/article/install-vs-codium-and-integrate-vs-code-extensions/)  
VSCode https://code.visualstudio.com/ does contain additional telemetry/tracking  
VSCode-Online https://vscode.dev/ (online)  
Atom https://atom.io/  
Eclipse IDE https://www.eclipse.org/  
NetBeans IDE https://netbeans.apache.org/download/  
Blender https://www.blender.org/download/ KeenTools https://keentools.io/ CAD Sketcher https://makertales.gumroad.com/l/CADsketcher?a=742446579  
Onshape https://www.onshape.com/en/ (online)  
Cascadeur https://cascadeur.com/download  
NormalMap https://www.smart-page.net/smartnormal/ (online)  
magick https://imagemagick.org/script/download.php  
.NET https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204  
mono https://www.mono-project.com/download/stable/  
gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/  
SQL Developer / Universal Database Tool https://dbeaver.io/  
Oracle SQL Developer https://www.oracle.com/tools/downloads/sqldev-downloads.html  
Raspberry Pi Imager https://www.raspberrypi.com/software/ [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)  
KiCad EDA https://www.kicad.org/  
Arduino IDE https://www.arduino.cc/en/software  
(additionally install: `sudo apt install python-is-python3 python3-serial`)  
Android Studio https://developer.android.com/studio https://snapcraft.io/android-studio  
Unreal Engine https://www.unrealengine.com/  
Unity https://unity.com/download  
Gaupol Subtitle Editor https://otsaloma.io/gaupol/ (part of the repository: `sudo apt install gaupol` )  
Sigil - EPUB Editor https://sigil-ebook.com/ (part of the repository: `sudo apt install sigil`)  
AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html  
(part of the repository: `sudo apt install awscli`)  
Google Cloud CLI https://cloud.google.com/sdk/docs/install#deb  
Azure CLI https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt  
FileZilla https://filezilla-project.org/download.php?type=client (part of the repository: `sudo apt install filezilla`)  
Angry IP Scanner https://angryip.org/  
Sparx Enterprise Architect https://sparxsystems.com/products/ea/16.1/sysreq.html  
RStudio Desktop https://posit.co/download/rstudio-desktop/  
IDA Free https://hex-rays.com/ida-free/  
NI LabVIEW https://www.ni.com/en/shop/labview.html  
QT (GUI Development) https://www.qt.io/download-dev  
Slint (GUI Development) https://slint.dev/  
Gitleaks https://github.com/gitleaks/gitleaks  
GitGuardian https://www.gitguardian.com/state-of-secrets-sprawl-report-2023  

**Appimage Programs that run on any Linux system**  
Audacity https://www.audacityteam.org/  
KeePassXC https://keepassxc.org/  
Krita https://krita.org/  
Inkscape https://inkscape.org/  
MyPaint http://mypaint.org/  
Aseprite https://www.aseprite.org/  
Stellarium http://stellarium.org/  
Ultimaker Cura (3D printing + slicer) https://ultimaker.com/software/ultimaker-cura  
MeshLab https://www.meshlab.net/  
Obsidian https://obsidian.md/  
BalenaEtcher https://www.balena.io/etcher/  
Virtual MIDI Piano Keyboard (VMPK) https://vmpk.sourceforge.io/  
Hugin Panorama Stitcher - Grafics Editor http://hugin.sourceforge.net/  
Kdenlive Video Editor https://kdenlive.org/en/download/  
OpenShot Video Editor https://www.openshot.org/  
Shotcut Video Editor https://www.shotcut.org/  
Olive Video Editor https://www.olivevideoeditor.org/  
LMMS https://lmms.io/download#linux  
OneNote (Unofficial Desktop App, actually an independent browser window for the online OneNote) https://github.com/patrikx3/onenote  

**You can also use `wget` or `curl` to download the programs**
```bash
wget -L https://zoom.us/client/latest/zoom_amd64.deb -P $HOME/Programs/
wget -L https://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb -P $HOME/Programs/
wget -L https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -P $HOME/Programs/
wget -L "https://www.geogebra.org/download/deb.php?arch=amd64" -O $HOME/Programs/geogebra5_amd64.deb
wget -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $HOME/Programs/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

### Installation and Setup of the downloaded Programs:

**Debian Packages**  
Changing directory to the Programs folder and(&&) installing all the debian packages in one go:  
```bash
cd ~/Programs && sudo apt install ./*.deb  # Version A
cd ~/Programs && sudo dpkg -i *.deb        # Version B
```

If the .deb program does not install correctly, just try the `-f/--fix-broken` command ([fix-broken-packages-ubuntu](https://www.maketecheasier.com/fix-broken-packages-ubuntu/)):  
```bash
sudo apt install -f
```

**AppImage Packages**  
AppImages don't require installation. You just have to tell your system that the program is allowed to be executed. Once that is done you can just double click on it.
```bash
# Setting the executable bit to all Appimage files in the Programs directory:
chmod u+x ~/Programs/*.AppImage
```
You can do the same by clicking with your Right Mouse Button at the .AppImage file:  
`Properties` → `Permissions` → `'Allow this file to run as a program'` or `'Set executional bit'`

**Compressed/Archived Packages**  
Extract the downloaded [blender](https://www.blender.org/download/) package and copy it to your Programs folder:
```bash
tar xvf ~/Downloads/blender*.tar.xz -C ~/Programs/
```
Once that is done you can usually just double click on it.

Optionally you can extract the program directory into the /opt/ folder and..  
- add the blender directory path to the Session `PATH` variable, which will let you start blender from the terminal
   ```bash
   echo 'export PATH=$PATH:/opt/program_directory/' >> ~/.bashrc
   source ~/.bashrc
   ```
- or create a link to the system programs directory `/usr/bin/blender` which will let you start it from the terminal and the Applications Menu
   ```bash
   sudo ln -sf /opt/program_directory/blender /usr/bin/blender
   ```
- or create a [Panel App Launcher](#adding-app-launcher-to-the-xfce-panel)

### `Firefox` Web Browser[^1]
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
apt list --installed | grep -i snap

# Download Firefox from https://www.mozilla.org/en-US/firefox/all/#product-desktop-release
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2

# Extract it and Move the content to the /opt/ directory
sudo tar xvjf firefox.tar.bz2 -C /opt/

# Create a symbolic link to the Firefox in /usr/bin so that all users will be able to run it
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
```

Firefox will update itself from now on if you leave the download setting in the general settings section unchanged.
But if you are someone who likes to do the update manually, here is a script that you can use:
```bash
#!/bin/bash
# The file firefox.tar.bz2 will be overwritten automatically because of the '-O'
wget "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" -O firefox.tar.bz2
tar xjf firefox.tar.bz2
tree firefox

read -p "Are you OK with the download? [Y/n]: " yn
[ "$yn" = "n" ] && exit

[ -d /opt/firefox/ ] && sudo rm -rf /opt/firefox

sudo mv firefox /opt/firefox
sudo ln -sf /opt/firefox/firefox /usr/bin/firefox
```

The configuration files, addons and bookmarks of firefox reside at `/home/$USER/.mozilla/`. Deleting the directory `.mozilla` gives you the experience of a "freshly installed firefox" without any customizations. Handle with care.  

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

### Adding App launcher to the XFCE panel
![app launcher](pics/add_launcher.gif)

### Four ways to create a Linux Live System on a usb stick
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

### Some Programming languages
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

# GNU R (https://www.r-project.org/)
sudo apt install r-base
```

### pip install ...

The pip version is always up to date and usually the better choice compared to the repository version of your operating system.
```bash
# If you installed a python program from pypi.org ...
pip install pip-check

# ... and the program is not found by your system, it is possible that you first have to  
# restart your session because the PATH variable might not have updated yet. Type `echo $PATH` to see the current configuration.
# Another way is to just reload the .profile file if the entry does exist but just hasn't been updated to the current running session.
source ~/.profile
pip-check
```
You will find the binary at `ls /home/${USER}/.local/bin/`  
or in `./your_venv_name/bin/` if you used a virtual environment.

Update `pip` via: `python3 -m pip install --upgrade pip`

### Backups
- [Timeshift](https://linuxconfig.org/ubuntu-22-04-system-backup-and-restore) - `sudo apt install timeshift`
- [Chezmoi - Easily moving Linux installs](https://christitus.com/chezmoi/)
- [Déjà Dup Backups](https://snapcraft.io/deja-dup) - `sudo apt install deja-dup`
- [Make a Full Disk Backup with DD](https://bdoga.com/full-disk-backup-with-dd/)
  - `dd if=/dev/sdc conv=sync,noerror status=progress bs=64K | gzip -c > backup_image.img.gz`
  - `gunzip -c backup_image.img.gz | dd of=/dev/sdc status=progress`

  ### Check File Integrity
- [Check File Integrity on Linux the Easy Way With GtkHash](https://www.makeuseof.com/check-file-integrity-on-linux-with-gtkhash/) - `sudo apt install gtkhash`
- [Advanced Intrusion Detection Environment (AIDE)](https://www.tecmint.com/check-integrity-of-file-and-directory-using-aide-in-linux/) - `sudo apt install aide`
- [Tripwire](https://www.tripwire.com/) - `sudo apt install tripwire`
- [rust_hasher](https://github.com/Tornado3P9/rust_hasher)
- `md5sum testfile` → `echo "4311d1887f6d4ddf411b36df124dfde6  testfile" | md5sum -c`
- `sha256sum testfile > checksums.txt` → `sha256sum -c checksums.txt`

### Virtual Machine
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - `sudo apt install virtualbox`
- [QEMU](https://www.christitus.com/vm-setup-in-linux), [second link](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/QEMU%20virtual%20manager.md) - Even faster than VirtualBox

### Gaming
- [Lutris](https://lutris.net/)
- [Steam](https://store.steampowered.com/app/220200/Kerbal_Space_Program/) - `sudo apt install steam`  
  - Log files: `find $HOME/.steam/steam/steamapps/compatdata/ -type f -name "*.log"`
  - Game files: `ls -lh $HOME/.local/share/Steam/steamapps/common/`  
  or `ls -lh $HOME/.steam/steam/steamapps/common/`
- [itch.io](https://itch.io/)

### Game Engines
- [Pygame](https://pypi.org/project/pygame/)
- [Bevy](https://crates.io/crates/bevy)
- [SDL2](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/How-To-Install-SDL-On-Ubuntu.md)
- [Unity](https://unity.com/download)
- [Unreal Engine](https://www.unrealengine.com/)

### Photoshop alternatives (most adope applications don't work well on linux)[^6]
- Gimp (very good image manipulation editor) https://www.gimp.org/ `sudo apt install gimp`
- Krita (supports many different color codes -> good for printing tasks) https://krita.org/ `sudo apt install krita`
- MyPaint (good for working with a digital drawing tablet) http://mypaint.org/ `sudo apt install mypaint`
- Inkscape (vector graphics) https://inkscape.org/ `sudo apt install inkscape`
- Blender (2d drawing tool for working with a digital drawing tablet) https://www.blender.org/
- Darktable (photography workflow application and raw developer) https://www.darktable.org/ `sudo apt install darktable`
- Photopea (online, good compatibility with Photoshop's text objects) https://www.photopea.com/
- Affinity (Windows Version using Wine) https://codeberg.org/Wanesty/affinity-wine-docs
- Pinta (Pinta is a GTK clone of Paint.Net 3.0) https://www.pinta-project.com/ `sudo apt install pinta`
- ExcaliDraw (online, very simple) https://excalidraw.com/
- PIXLR (online) https://pixlr.com/

### Password manager
- bitwarden (very professional online web service) https://bitwarden.com/
- KeePassXC (simple offline application) https://keepassxc.org/ `sudo apt install keepassxc`

### Microsoft PowerShell
- https://github.com/PowerShell/PowerShell
- [Installing PowerShell on Ubuntu (Microsoft Tutorial)](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3)

### Decentralised Data Storage - IPFS
- IPFS Desktop https://docs.ipfs.io/install/ipfs-desktop/
- IPFS Companion browser add-on https://docs.ipfs.io/install/ipfs-companion/
- host single-page website https://docs.ipfs.io/how-to/websites-on-ipfs/single-page-website/#linux

### Converting RPM to DEB packages
- FPM [fpm.readthedocs.io](https://fpm.readthedocs.io/en/latest/packages/rpm.html#arguments-when-used-as-input-type)
- Alien [manpages.ubuntu.com](https://manpages.ubuntu.com/manpages/jammy/man1/alien.1p.html) [geeksforgeeks.com](https://www.geeksforgeeks.org/how-to-convert-rpm-package-to-deb-using-alien-package-converter/)

### ShellGPT
- https://github.com/TheR1D/shell_gpt#readme

### The Clipboard Manager
On Windows 10 and later versions, pressing the **`Windows key + V`** opens the clipboard history. This feature allows you to view a history of items you've copied to the clipboard, pin frequently used items, and choose which item to paste. However, this shortcut does not apply to Linux/Ubuntu systems, as they have different keyboard shortcuts and clipboard management tools.  
In XFCE (Xubuntu) the **xfce4-clipman-plugin** is tailored for users who prefer a plugin that integrates with the XFCE panel, but there are at least 10 other alternatives to choose from.
```bash
# The clipman-plugin can be installed with (usually preinstalled):
sudo apt install xfce4-clipman-plugin

# Open the clipboard setting with:
xfce4-clipman-settings
```
If the Plugin Icon is missing from the XFCE panel, create it by Right-clicking on the  
**`XFCE panel` → `Panel` → `Add New Items` → `Clipman`**  
Once that is done you can create a shortcut by starting the  
**xfce4-settings-manager → `Keyboard` → `Application Shortcuts` → `Add`**  
and create a custom shortcut with the command **xfce4-popup-clipman** and your preferred key combination, e.g. **`Windows key + V`**

**Note**: Make sure your password manager is compatible with your Clipboard Manager or you may introduce a security vulnerability!

#### A Clipboard Driver to paste information from console to clipboard so that it can be used together with the `Ctrl+V` shortcut or other console applications can be installed with:
```bash
# on X11 it requires xclip
sudo apt install xclip

# on Wayland it requires wl-clipboard
sudo apt install wl-clipboard
```

### Tiling Window Desktop Environments
- [i3](https://i3wm.org/) (part of the repository: `sudo apt install i3`)
- [Hyprland](https://hyprland.org/) Example: https://youtu.be/wcHUQXMhhow

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
To make small changes to the configuration, just open this text file with the command `sudo nano /etc/default/grub`. You will then be presented with smth like this:
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

### Wine (run windows programs)
https://wiki.winehq.org/Ubuntu
```bash
sudo dpkg --add-architecture i386
sudo apt update && sudo apt install wine

wine --version

winecfg

cd ~/Programs
wine program.exe
```

### External Hardware/Controller/Game Pad
- Xboxdrv (driver package) `sudo apt install xboxdrv`  
  For most users, the Linux kernel built-in `xpad` driver should suffice for Xbox 360 and Xbox One controllers.
- evtest (monitor and debug input devices such as keyboards, mice, and joysticks) `sudo apt install evtest`
- jstest-gtk (joystick testing and configuration tool) `sudo apt install jstest-gtk`
- python3-serial (Python library used for serial communication) `sudo apt install python3-serial`
  Alternatively: `pip3 install pyserial` and test with `python3 -c "import serial"`
  Try `pyserial-miniterm` which comes with the PySerial library.
- Devices are 'files' at `ls -l /dev/` (https://www.kernel.org/doc/Documentation/admin-guide/devices.txt)

### Managing power profiles / battery life

https://linuxconfig.org/how-to-manage-power-profiles-over-d-bus-with-power-profiles-daemon-on-linux

`power-profiles-daemon` is a system service that provides a D-Bus interface for applications to request certain power profiles, which is especially useful when working on a mobile device like a laptop where one wants the battery to run for as long as possible. It is typically used in GNOME or KDE environments and is not directly integrated with the XFCE desktop environment, which is known for its modularity and lightweight nature.

However, you can still install and use `power-profiles-daemon` on a system running XFCE. To do so, you can install it via the terminal:

```bash
sudo apt update
sudo apt install power-profiles-daemon
```

After installation, you can use the command line to switch between power profiles. Here are the basic commands:

```bash
# List available power profiles
powerprofilesctl list

# Name of the active profile
powerprofilesctl get

# Set a specific power profile
sudo powerprofilesctl set <profile_name>
```

Replace **`<profile_name>`** with the desired profile, such as **`performance`**, **`balanced`**, or **`power-saver`**.

Keep in mind that while you can use `power-profiles-daemon` on XFCE, the integration might not be as seamless as in GNOME, and you may need to use the command line or create custom shortcuts to switch profiles.

You can do **`sudo powertop`** or **`upower -i /org/freedesktop/UPower/devices/battery_BAT0`** and look for the "energy-rate" or "power" field to see the current discharge rate.

Remember that actual battery life can be influenced by many factors, including screen brightness, running applications, and hardware efficiency.

### some different topics:
[Speedup Linux](https://christitus.com/speedup-linux/)  
[Desktop and editor setup for Rust development](https://youtu.be/ycMiMDHopNc)  
[Customize Your Xfce Desktop To Look Like macOS Big Sur](https://youtu.be/uvvoJU69uNo)  
[Make Your Xfce Desktop Look More Unique and Beautiful](https://youtu.be/X3siZNJN3ec)  
[If you do these 5 things... You should NOT use Linux](https://youtu.be/06cKL5DQ5CY)  
[Who should use Linux?](https://youtu.be/7SU-BupOe7s)  
[Simple Tasks on Linux](https://youtu.be/6h2UmKTcCfA)  
[Understanding Linux Distros](https://youtu.be/DKFnqAtEOvc)  
[Choosing the Right Linux Distro](https://youtu.be/dL05DoJ0qsQ)  
[Linux gaming is better than Windows sometimes](https://youtu.be/i9Op7Xa5eKs)  
[Linux being better for Blender 3D Renderings](https://youtu.be/cpE2B2QSsa0)  
[Xubuntu - Configure dual monitors](https://youtu.be/O25rgXH3L7o)  
[My biggest problems with Linux Desktop and How I fixed them](https://christitus.com/my-problems-with-linux/)  
[everyone codes faster when they stop using their mouse](https://youtu.be/WkT8ZC4ncX8)  

### Deutscher Linux Support
- https://www.linuxguides.de/linux-support/
- https://www.b1-systems.de/

<!---
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
-->

[^3]:Additional Codecs https://www.makeuseof.com/tag/ubuntu-restricted-extras-install-ubuntu-linux/
[^1]:Install Firefox manually: https://itsfoss.com/firefox-quantum-ubuntu/
[^2]:Firewall: https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/admin%20tools/firewall_ufw.md
[^4]:dd https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-images-on-linux https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/dd.md
[^5]:VideoLAN libdvdcss: https://www.videolan.org/developers/libdvdcss.html, https://wiki.ubuntuusers.de/DVD-Wiedergabe/#Problembehebung
[^6]:Photoshop: https://appdb.winehq.org/objectManager.php?sClass=application&iId=20, https://lutris.net/games/adobe-photoshop-cs6/

