# Xubuntu

### Table of Contents
- [First set up the base system](#first-set-up-the-base-system)
- [Now you can make some first customizations to the new system](#now-you-can-make-some-first-customizations-to-the-new-system)
- [System Update Settings](#system-update-settings)
- [Configure Flatpak for installing apps from Flathub](#configure-flatpak-for-installing-apps-from-httpsflathuborg)
- [Graphics Card Drivers](#graphics-card-drivers)
- [Configuration Assistants are a great help](#configuration-assistants-are-a-great-help)
- [Create a `.fonts` directory for your own Truetype (.ttf) fonts](#create-a-fonts-directory-for-your-own-truetype-ttf-fonts)
- [Create a `Programs` folder for all the manually downloaded packages](#create-a-programs-folder-for-all-the-manually-downloaded-packages)
- [The `Alt` key problem](#the-alt-key-problem)
- [You can change the keyboard key map](#you-can-change-the-keyboard-key-map)
- [Firewall](#firewall2)
- [One-time password (OTP) also known as 2-Factor authentication](#one-time-password-otp-also-known-as-2-factor-authentication)
- [Additional Themes](#additional-themes)
- [Terminal behaviour](#terminal-behaviour)
- [Installing tldr (too long, didn't read) helper tool](#installing-tldr-too-long-didnt-read-helper-tool)
- [Installing Texlive and Texmaker for writing LaTeX documents](#installing-texlive-and-texmaker-for-writing-latex-documents)
- [Incomplete list of applications](#incomplete-list-of-applications)
  - [Office/School](#officeschool)
  - [Video Calls](#video-calls)
  - [Media Player](#media-player)
  - [Password Manager](#password-manager)
  - [Screen Recording](#screen-recording)
  - [Video Editing](#video-editing)
  - [Sound Editing](#sound-editing)
  - [Image Editing](#image-editing)
  - [Web Browser](#web-browser)
  - [Torrent downloads](#torrent-downloads)
  - [Development](#development)
  - [Disk Usage Analyzer](#disk-usage-analyzer)
  - [USB installation media creation tools](#usb-installation-media-creation-tools)
  - [Appimage Programs that run on any Linux system](#appimage-programs-that-run-on-any-linux-system)
- [Installation and Setup of the downloaded Programs](#installation-and-setup-of-the-downloaded-programs)
- [Firefox Web Browser](#firefox-web-browser)
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
- [Microsoft PowerShell](#microsoft-powershell)
- [Decentralised Data Storage - IPFS](#decentralised-data-storage---ipfs)
- [Converting RPM to DEB packages](#converting-rpm-to-deb-packages)
- [ShellGPT](#shellgpt)
- [The Clipboard Manager](#the-clipboard-manager)
- [A Clipboard Driver for the terminal](#a-clipboard-driver-to-paste-information-from-console-to-clipboard-so-that-it-can-be-used-together-with-the-ctrlv-shortcut-or-other-console-applications-can-be-installed-with)
- [Tiling Window Manager](#tiling-window-manager)
- [DVD](#dvd)
- [Grub2 - boot menu](#grub2---boot-menu)
- [Wine (run windows programs)](#wine-run-windows-programs)
- [External Hardware/Controller/Game Pad](#external-hardwarecontrollergame-pad)
- [Managing power profiles / battery life](#managing-power-profiles--battery-life)
- [some different topics list](#some-different-topics)
- [Deutscher Linux Support](#deutscher-linux-support)
- [List of working printers](#list-of-working-printers)

<br>

### First set up the base system
https://xubuntu.org/ + [balenaEtcher](https://www.balena.io/etcher/) or [Rufus USB Writer](https://rufus.ie/en/) for Windows users

<br>

### Now you can make some first customizations to the new system
Bring your installation [up to date](https://tecadmin.net/install-security-updates-ubuntu-debian/) (What is [apt](https://www.maketecheasier.com/ultimate-guide-apt-and-apt-get-commands/)?):
```bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove
```

Install some additional codecs:[^3]
```bash
sudo apt install ubuntu-restricted-extras rar unrar p7zip-full
```
Note: *ubuntu-restricted-extras* is a so called 'meta-package' which installs a number of other packages.  
The Microsoft Fonts for instance are not open source and therefore are not included in the ubuntu image.  
Or you can try to do this manually. Some of the packages are: *libavcodec-extra ttf-mscorefonts-installer gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi unrar rar xz-utils* 
The packages zip and unzip are also included. But making sure never hurts.  

#### Explanation for `sudo apt install ...`:
- **`sudo`** = "Dear PC, do what I tell you now with admininstrator/owner rights!"  
- **`apt`**  = That's the program that handles the whole installation or deinstallation processes on your PC and which we gave admin rights just now..  
- **`install`** = That's the function that I want the program **`apt`** to do..  
- **`mpv`** = That's the name of the thing that I want to install (in this case the mpv-media-player).  

#### Install some useful programs
Remove what lines you don't want, copy the whole command block, paste it into the terminal and press Enter. Also remember to run **`sudo apt update`** before installing new packages:

```bash
sudo apt install \
git \
gparted gnome-disk-utility mtools \
synaptic \
simple-scan \
pdfarranger atril \
htop glances whowatch arp-scan nmap nethogs wireshark speedtest-cli traceroute mtr net-tools iperf3 ipcalc \
libreoffice libreoffice-l10n-de libreoffice-help-de \
mediainfo mediainfo-gui \
mpv ffmpeg audacity guvcview handbrake \
lxsplit \
libimage-exiftool-perl perl-doc \
steam \
xsensors \
wget curl \
tree multitail ncdu autojump \
ufw gufw \
kleopatra scdaemon \
ghex okteta jeex hexcurse xxd \
usb-creator-gtk \
python3-pip python3-venv python3-tk \
tar \
trash-cli \
jq \
rename \
cmake libgtk-4-dev build-essential autoconf libasound2-dev libssl-dev libpcap-dev
```

<br>

### System Update Settings
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Software & Updates** and go to the _Updates_ tab
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → Software → Software & Updates** and go to the _Updates_ tab

<br>

### Configure [Flatpak](https://flathub.org/setup/Ubuntu) for installing apps from https://flathub.org/:

```bash
# Install Flatpak:
sudo apt install flatpak

# Add the Flathub repository:
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install some program, e.g. https://flathub.org/apps/org.stellarium.Stellarium
flatpak install --user flathub org.stellarium.Stellarium

# See, what programs were installed via flatpak:
flatpak list

# Uninstall a program via the 'Application ID':
flatpak uninstall org.stellarium.Stellarium

# Remove unused Flatpak runtimes to free up space:
flatpak uninstall --unused
```

If the app does not appear right away in the menu, just reboot your PC.

<br>

### Graphics Card Drivers
Installing drivers on Ubuntu is not necessary as Ubuntu detects the Video Card and automatically uses its own Nouveau Open Source driver for nVidia cards. But the proprietary nVidia driver does give a noticeable performance boost over the Nouveau driver, so it is still common to select the proprietary one.  
AMD graphics card drivers for Linux are provided through the open-source AMDGPU driver, which is integrated into the Linux kernel. This driver supports most modern AMD Radeon graphics cards and is included by default in many Linux distributions, including Ubuntu. The AMDGPU driver is actively developed and regularly updated with new kernel releases.
For users who require advanced features or the latest GPU support, AMD also provides the AMDGPU-PRO driver, which is a proprietary driver that includes additional features and optimizations. This driver is not included in the kernel and must be downloaded and installed separately from AMD's official website.

If you unchecked the checkbox ("automatically install proprietary software...") when installing the system, you can easily select another available nVidia driver at any time:
- open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Additional Drivers** and select a driver by klicking on the line, where it says *`proprietary, tested`*

If there are problems, try an older version. To check which Nvidia packages are installed on the system, run the command `dpkg -l | grep -i nvidia` or `ubuntu-drivers list`. You can even do `sudo ubuntu-drivers autoinstall` to install the recommended driver automatically, but just stay with the graphical **"Additional Drivers"** menu and you're good.

NVidea will install an additional configuration center "NVIDEA X SERVER SETTINGS" with a green icon in case you want to look for it inside the Settings Menu. You can also open it from the terminal with the command `nvidia-settings`. Only go there if you encounter any problems with the standard configuration. For example you could enable "Force Composition Pipeline" inside the "X SERVER DISPLAY CONFIGURATION" tab, then "apply" and "Save To X Configuration File" if you encounter things like "screen tearing". I myself have never encountered any problems with the standard configuration.

To open the AMD Driver Configuration Center from the terminal, you would typically use the command for the specific tool provided by AMD for your graphics card. For many AMD graphics cards, this tool is called amdcccle, which stands for AMD Catalyst Control Center: Linux Edition. However, AMD has transitioned to the amdgpu driver and associated tools for newer cards.
If you have the amdcccle installed, you can open it by running `amdcccle` or if you are using the newer amdgpu-pro driver, you might have a different tool, and you can try opening the Radeon Software for Linux with `radeon-settings`.

<br>

### Configuration Assistants are a great help
- https://www.linux-assistant.org/ Beginner friendly and with [Youtube-Tutorials](https://youtu.be/uW11Uu8vhqc)
- https://github.com/ChrisTitusTech/linutil For Linux users
- https://github.com/ChrisTitusTech/winutil For Windows users

You can find most configuration files in your home directory (**`cd /home/$USER/`**). Use the shortcut **`Ctrl+H`** to display the hidden files in the *File Manager* or the commands **`ls -a`** or **`ls -la`** in the terminal.
The names of hidden files or directories start with a dot, e.g. **`.config`**.
System configuration is done in the **`/etc`** folder and User configuration is done in the **`/home/user/.config`** folder.

You can start your *File Manager* with the shortcut **`Windows key + F`** or by typing **`thunar`** into the terminal. You also can start your main web browser with the shortcut **`Windows key + W`** or by typing **`firefox`** into the terminal.

You can open any file by just clicking on it and the system will use the default application for that specific file type. You can change the default application by clicking on a file with the **Right Mouse Button** to open the "context menu" and by going to **Properties** → **General** → ***Open With***

You can also use the command [**`xdg-open`**](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/xdg-open.md) to achieve the same behaviour when using the terminal.

<br>

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

**Some additional notes:**  
In order to use Microsoft-owned TrueType fonts, such as Arial, Times New Roman, and Verdana, on your Linux system, you can install the **`ttf-mscorefonts-installer`** package.
Instead of putting your manually downloaded font files into the **`~/.fonts`** folder in the home directory, you can also put them into **`/usr/share/fonts/truetype`** for system-wide availability.
After adding new fonts, you may need to run **`fc-cache -fv`** to refresh the font cache.
To display all available fonts, you can use the **`fc-list`** command. You can filter the output for a specific font using the **`grep`** command:  
```bash
# Looking for the Garamond font:
fc-list | grep -i garamond
```

<br>

### Create a `Programs` folder for all the manually downloaded packages
If you keep all the downloaded binaries and installation files together in this folder instead of deleting them, you will always know what you did to your system in the past. Very simple.  
```bash
mkdir $HOME/Programs
```
`$HOME/` and `~/` and `/home/$USER/` basically do the same thing.

You can also create multiple directories in a more compact way using a single **`mkdir`** command with the **`-p`** option:  
```bash
mkdir -p $HOME/{Programs,.fonts,.icons,"Directory Name With Spaces"}
```

<br>

### The Alt key problem
Some Linux systems support the option to move applications around using the **`Alt`** key. The problem is that a lot of programs that run on both Windows and Linux also make heavy usage of the Alt key. Therefore it might be necessary to remove the presetting on Linux.
- Open **![menu](https://docs.xubuntu.org/current/user/libs/images/icon_menu.png) → ![preferences](https://docs.xubuntu.org/current/user/libs/images/preferences-desktop.png) Settings Manager → Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**
- Press **Alt+F2** and type *xfce4-settings-manager*. Then go to **Window Manager Tweaks → Accessibility** and change the *Key used to grab and move windows* to **None**

You can make things even better by setting the *Key used to grab and move windows* to the **Super** key, which is the intern name for the Windows key. This also makes it very easy to snap a window to a corner.

<br>

### You can change the keyboard key map (not advised)


Show general keyboard status with `localectl status`.

- [**Kanata**](https://github.com/jtroo/kanata) - A cross-platform software keyboard remapper for Linux, macOS and Windows  
Setup: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md  
Example: https://github.com/dreamsofcode-io/escapecontrol/tree/main/linux/kanata
- [caps2esc](https://gitlab.com/interception/linux/plugins/caps2esc) for Linux
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) for macOS

<br>

### Firewall[^2]

- YouTube Tutorial: [Linux und Virenschutz - So nutzt Du Deinen Linux-Desktop-Rechner sicher!](https://youtu.be/Sb4_LKFT1Xo)
- Uncomplicated Firewall: [https://wiki.archlinux.org/title/Uncomplicated_Firewall](https://wiki.archlinux.org/title/Uncomplicated_Firewall)

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

Optionally use [Firejail](https://firejail.wordpress.com/) to restrict the access of applications to the system by sandboxing.  
Install from the repository with `sudo apt install firejail`.

<br>

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

<br>

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
ls /usr/share/xfce4/backdrops
tree /usr/share/backgrounds
```

<br>

### Terminal behaviour
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

<br>

### Installing tldr (too long, didn't read) helper tool

The Ubuntu-Repository does have an older version of this program.
```bash
sudo apt install tldr
```

Or you could choose one of multiple installation methods for a more recent version: 
https://github.com/tldr-pages/tldr/blob/main/README.md

- Python: https://github.com/tldr-pages/tldr-python-client
- Node.js: https://github.com/tldr-pages/tldr-node-client
- Rust: https://github.com/tldr-pages/tlrc

In contrast to the information provided by `--help` or `man`, the `tldr` command typically offers more concise examples and explanations, albeit with less detail.

<br>

### Installing [Texlive](https://wiki.ubuntuusers.de/TeX_Live/) and [Texmaker](https://www.xm1math.net/texmaker/) for writing LaTeX documents
```bash
sudo apt install texlive texlive-lang-german texlive-lang-english texlive-latex-extra texmaker
```

<br>

### Incomplete list of applications

- https://wiki.archlinux.org/title/List_of_applications
- https://github.com/fastfetch-cli/fastfetch

#### Office/School
- GeoGebra https://www.geogebra.org/calculator / https://www.geogebra.org/classic (online)
- JFLAP https://www.jflap.org/jflaptmp/ (start with: `java -jar JFLAP.jar`)
- Periodic Table https://ptable.com/#Properties (online)
- CrypTool https://www.cryptool.org/en/ educational cryptography tools
- mailARS https://github.com/JoernLoviscach/mailARS
- Xournal++ https://github.com/xournalpp/xournalpp (part of the repository: `sudo apt install xournalpp` )
- printfriendly https://www.printfriendly.com/ (online)
- Diagram Editor https://www.diagrameditor.com/ (online)
- ExcaliDraw https://excalidraw.com/ (online)
- Dia Diagram Editor http://dia-installer.de/download/linux.html (part of the repository: `sudo apt install dia` )
- Mermaid Diagram Editor https://mermaid.live/ [about](https://mermaid-js.github.io/mermaid/#/) [video](https://youtu.be/JiQmpA474BY) (online)
- Miro Board https://miro.com/ (online)
- Trello Board https://trello.com/ (online)
- OnlyOffice https://www.onlyoffice.com/
- FreeOffice https://www.freeoffice.com/en/
- WPS Office https://www.wps.com/ (developed by Kingsoft, based in Beijing, China)
- LibreOffice https://www.libreoffice.org/ (already preinstalled)
- OpenOffice https://www.openoffice.org/
- SoftMaker Office https://www.softmaker.com/en/products/softmaker-office
- Polaris Office https://www.polarisoffice.com/en/
- Microsoft Office 365 https://www.office.com/ (online)
- Google Docs https://www.google.com/docs/about/ (online)
- Proton Docs https://proton.me/drive/docs / https://proton.me/ (online)
- Atril - PDF/ebook Viewer https://wiki.mate-desktop.org/mate-desktop/applications/atril/ (already preinstalled)
- PDFArranger (part of the repository: `sudo apt install pdfarranger`)
- PDFsam https://pdfsam.org/
- Stirling PDF https://stirlingpdf.io/ (online)
- img2pdf - Lossless conversion using Terminal https://gitlab.mister-muffin.de/josch/img2pdf (part of the repository: `sudo apt install img2pdf`)
- Pandoc - a universal document converter https://pandoc.org/ (part of the repository: `sudo apt install pandoc`)
- Calibre - ebook management https://calibre-ebook.com/download_linux (part of the repository: `sudo apt install calibre`)
- Microsoft OneNote https://www.onenote.com/hrd (online)
- Google Workspace - like OneNote https://workspace.google.com/ (online)
- Obsidian - like OneNote but private https://obsidian.md/download (**.Deb**, Snap or .AppImage)
- Libre Workspace https://www.libre-workspace.org/ (online/local, language german)
- Tresorit - cloud-based file synchronization and sharing service that focuses on enhanced security and data encryption https://tresorit.com/ (online)
- Kleopatra https://www.openpgp.org/software/kleopatra/ (part of the repository: `sudo apt install kleopatra scdaemon`)
- KMail - KDE email client that integrates well with Kleopatra https://apps.kde.org/kmail2/ (part of the repository: `sudo apt install kmail`)
- Thunderbird - Popular email client https://www.thunderbird.net/ (part of the repository: `sudo apt install thunderbird`)
- Document Scanner https://gitlab.gnome.org/GNOME/simple-scan (best choice and part of the repository: `sudo apt install simple-scan`)
- XSane https://help.ubuntu.com/community/XSane (part of the repository: `sudo apt install xsane`)
- Messaging app for integrating WhatsApp, Facebook Messenger, Slack, Telegram, WeChat, Google Hangouts, Skype, Zendesk, Instagram, Discord, Teams and many more in a single application, thereby simplifying the workspace.  
Note: These kinds of workspace simplifyers might not always support every feature of the individual application, and the messenger might run slower with many apps compared to just running one individual app:
  - Rambox https://rambox.app/download-linux/ (AppImage, .Deb, .RPM or Snap)
  - Franz https://meetfranz.com/ . [how-to](https://itsfoss.com/franz-messaging-app/) (AppImage, .Deb)
- Typora - Distractions Free Writing https://typora.io/
- Flameshot - better screenshot app https://flameshot.org/ (part of the repository: `sudo apt install flameshot`) Also assign a keyboard shortcut for the command *`flameshot gui`*, such as `Windows key + Print`.
- Safe Eyes - reduce and prevent repetitive strain injury https://slgobinath.github.io/SafeEyes/ (part of the repository: `sudo apt install safeeyes`)
- Super Productivity https://super-productivity.com/
- Webcamize allows you to use [basically any modern camera](https://github.com/cowtoolz/webcamize/blob/master/assets/supported.md) as a webcam on Linux https://github.com/cowtoolz/webcamize
- Gephi - The Open Graph Viz Platform https://gephi.org/

#### Video Calls
- Zoom https://zoom.us/download . [how-to](https://github.com/Tornado3P9/installscript-linux/blob/master/zoom.md)
- TeleGuard https://teleguard.com/
- Jitsi https://jitsi.org/
- Element https://element.io/
- Microsoft Teams https://www.microsoft.com/en-us/microsoft-teams/compare-microsoft-teams-home-options (online, the official desktop app for linux has been discontinued)  
Unofficial Desktop client https://github.com/IsmaelMartinez/teams-for-linux/releases
- Google Meet https://workspace.google.com/products/meet/
- Jami https://jami.net/
- Nextcloud Talk https://nextcloud.com/talk/
- BigBlueButton https://bigbluebutton.org/
- Discord https://discord.com/download?linux (online, .Deb, or binary)
- Skype https://snapcraft.io/skype (online or Snap)
- Slack https://slack.com/downloads/linux (.Deb, Snap, or .RPM)
- Signal https://signal.org/download/linux/
- Telegram https://desktop.telegram.org/
- WhatsApp https://web.whatsapp.com/ . [how-to](https://itsfoss.com/whatsapp-linux-desktop/) (online)
  - Note: As of yet, WhatsApp Web does not support video calls. So keep your mobile device at hand.

#### Media Player
- MPV Player https://mpv.io/ with [keyboard shortcuts](https://manpages.ubuntu.com/manpages/bionic/man1/mpv.1.html) (part of the repository: `sudo apt install mpv` )
- VLC Media Player https://www.videolan.org/vlc/ (part of the repository: `sudo apt install vlc` )
- Haruna Video Player https://haruna.kde.org/ (part of the repository: `sudo apt install haruna` )
- SMPlayer https://www.smplayer.info/ (part of the repository: `sudo apt install smplayer` )
- Parole https://docs.xfce.org/apps/parole/start (already preinstalled)
- Cider (iTunes on Linux) https://flathub.org/apps/sh.cider.Cider

#### Password Manager
- bitwarden (very professional online web service) https://bitwarden.com/
- KeePassXC (simple offline application) https://keepassxc.org/ `sudo apt install keepassxc`
- Proton Pass (online) https://proton.me/pass

#### Screen Recording
- OBS Studio (by far the best option) https://obsproject.com/wiki/install-instructions#linux (part of the repository: `sudo apt install obs-studio` )  
`ls ~/.config/obs-studio/` to see the configuration directory
- Kazam https://github.com/henrywoo/kazam (part of the repository: `sudo apt install kazam`)  
`cat ~/.config/kazam/kazam.conf` to see the configuration file
- SimpleScreenRecorder https://www.maartenbaert.be/simplescreenrecorder/#download (part of the repository: `sudo apt install simplescreenrecorder` )
- ScreenRec https://screenrec.com/screen-recorder#download
- Terminal [how-to](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/media/screen_recording_using_the_terminal.md) . https://youtu.be/vWWSpDE7Gk4

#### Video Editing
- DaVinci Resolve https://www.blackmagicdesign.com/products/davinciresolve/
- HandBrake https://handbrake.fr/ a multithreaded video transcoder (part of the repository: `sudo apt install handbrake` )
- Kdenlive Video Editor https://kdenlive.org/en/download/ (part of the repository: `sudo apt install kdenlive` )
- OpenShot Video Editor https://www.openshot.org/
- Shotcut Video Editor https://www.shotcut.org/
- Olive Video Editor https://www.olivevideoeditor.org/
- Blender https://www.blender.org/features/video-editing/
- Lightworks https://lwks.com/

#### Sound Editing
- Audacity https://www.audacityteam.org/ (part of the repository: `sudo apt install audacity` )
- FL Studio https://jstaf.github.io/2018/02/22/flstudio-on-linux.html
- Hydrogen http://hydrogen-music.org/downloads/ (part of the repository: `sudo apt install hydrogen` )
- Ardour https://ardour.org/ (part of the repository: `sudo apt install ardour` )
- LMMS https://lmms.io/ (part of the repository: `sudo apt install lmms` )
- Wavacity https://wavacity.com/ (derived from Audacity: online)

#### Image Editing
- Gimp (very good image manipulation editor) https://www.gimp.org/ `sudo apt install gimp`
- Photopea (online, good compatibility with Photoshop's text objects) https://www.photopea.com/
- Krita (supports many different color codes -> good for printing tasks) https://krita.org/ `sudo apt install krita`
- MyPaint (good for working with a digital drawing tablet) http://mypaint.org/ `sudo apt install mypaint`
- Inkscape (vector graphics) https://inkscape.org/ `sudo apt install inkscape`
- Blender (2d drawing tool for working with a digital drawing tablet) https://www.blender.org/
- Darktable (photography workflow application and raw developer, for photographers, by photographers) https://www.darktable.org/ `sudo apt install darktable`
- RawTherapee (photography workflow application and raw developer) https://rawtherapee.com/ `sudo apt install rawtherapee`
- Affinity (Windows Version using Wine) https://codeberg.org/Wanesty/affinity-wine-docs
- Pinta (Pinta is a GTK clone of Paint.Net 3.0) https://www.pinta-project.com/ `sudo apt install pinta`
- ExcaliDraw (online, very simple) https://excalidraw.com/
- PIXLR (online) https://pixlr.com/
- Photoflare https://photoflare.io/ `sudo apt install photoflare`
- Hugin https://hugin.sourceforge.io/
- Scribus (Adobe InDesign Alternative) https://www.scribus.net/ `sudo apt install scribus`
  - Ghostscript https://www.ghostscript.com/releases/gsdnld.html `sudo apt install ghostscript`
- (most adope applications don't work well on linux)[^6]

#### Web Browser
- Firefox https://support.mozilla.org/en-US/kb/install-firefox-linux (preinstalled as Snap, but also available as **.Deb**, Flatpak or Application Binary)
- LibreWolf: An Open-Source Firefox Fork Without the Telemetry https://librewolf.net/
- Floorp: A new Firefox based browser from Japan https://floorp.app/en-US
- Chrome https://www.google.com/chrome/ (**.Deb** or .RPM)
- Vivaldi https://vivaldi.com/download/
- Brave https://brave.com/linux/#release-channel-installation
- Thorium https://thorium.rocks/
- Mullvad https://mullvad.net/en/download/browser/linux
- Tor Browser https://www.torproject.org/download/
- Safari (sudo apt install playonlinux -> and then install Safari from there)

#### Torrent downloads
- Transmission https://transmissionbt.com/ (already preinstalled: `apt list transmission*`)

#### Development
- JetBrains WebStorm/Rider/IntelliJ/PyCharm IDE https://www.jetbrains.com/pycharm/download/#section=linux
- Cursor https://www.cursor.com/ (.AppImage)
- Sublime Text https://www.sublimetext.com/
- Sublime Merge https://www.sublimemerge.com/
- GitKraken https://www.gitkraken.com/
- VSCodium https://vscodium.com/ does not contain telemetry/tracking but some extensions have to be added [manually](https://milicendev.netlify.app/article/install-vs-codium-and-integrate-vs-code-extensions/)
- VSCode https://code.visualstudio.com/ does contain additional telemetry/tracking
- VSCode-Online https://vscode.dev/ (online)
- Atom https://atom.io/
- Micro https://micro-editor.github.io/ (part of the repository: `sudo apt install micro`)
- Eclipse IDE https://www.eclipse.org/downloads/packages/
- NetBeans IDE https://netbeans.apache.org/download/
- LazyVim https://www.lazyvim.org/
- Minisign https://jedisct1.github.io/minisign/ https://github.com/jedisct1/minisign
- Blender https://www.blender.org/download/ KeenTools https://keentools.io/ 3D CAD Sketcher https://makertales.gumroad.com/l/CADsketcher?a=742446579
- Onshape - 3D CAD https://www.onshape.com/en/ (online)
- FreeCAD - 3D CAD https://www.freecad.org/
- Solid Edge - 3D CAD https://github.com/cryinkfly/Solid-Edge-for-Linux (only using Windows executable with Wine)
- SolidWorks - 3D CAD https://github.com/cryinkfly/SOLIDWORKS-for-Linux (only using Windows executable with Wine)
- Autodesk Inventor ... Nope
- Cascadeur https://cascadeur.com/download
- NormalMap https://www.smart-page.net/smartnormal/ (online)
- magick https://imagemagick.org/script/download.php
- .NET https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu (part of the repository: `sudo apt install dotnet-sdk-8.0`)
- mono https://www.mono-project.com/ (part of the repository: `sudo apt install mono-complete`)
- gcolor2_colorpicker http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/
- SQL Developer / Universal Database Tool https://dbeaver.io/
- Oracle SQL Developer https://www.oracle.com/tools/downloads/sqldev-downloads.html
- Raspberry Pi Imager https://www.raspberrypi.com/software/ [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)
- KiCad EDA https://www.kicad.org/
- Arduino IDE https://www.arduino.cc/en/software
(additionally install: `sudo apt install python-is-python3 python3-serial`)
- Android Studio https://developer.android.com/studio https://snapcraft.io/android-studio
- Unreal Engine https://www.unrealengine.com/
- Unity https://unity.com/download
- Gaupol Subtitle Editor https://otsaloma.io/gaupol/ (part of the repository: `sudo apt install gaupol`)
- Sigil - EPUB Editor https://sigil-ebook.com/ (part of the repository: `sudo apt install sigil`)
- AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
(part of the repository: `sudo apt install awscli`)
- Google Cloud CLI https://cloud.google.com/sdk/docs/install#deb
- Azure CLI https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
- FileZilla https://filezilla-project.org/download.php?type=client (part of the repository: `sudo apt install filezilla`)
- Angry IP Scanner https://angryip.org/ (or just do `nmap -sn 192.168.1.0/24 | grep report` or `arp-scan --localnet`)
- Sparx Enterprise Architect https://sparxsystems.com/products/ea/16.1/sysreq.html
- RStudio Desktop https://posit.co/download/rstudio-desktop/
- IDA Free https://hex-rays.com/ida-free/
- NI LabVIEW https://www.ni.com/en/shop/labview.html
- QT (UI-library with C++, Python, Rust) https://www.qt.io/download-dev
- Slint (UI-library with Rust, C++, JavaScript, Python) https://slint.dev/
- GTK-4 (UI-library with Rust, C++, Python and more) https://gtk-rs.org/gtk4-rs/stable/latest/book/
- Tkinter (UI-library with Python) https://github.com/TomSchimansky/CustomTkinter
- Dioxus (Rust framework for building fullstack web, desktop, and mobile apps) https://dioxuslabs.com/
- Electron (Create cross-platform desktop apps) https://www.electronjs.org/
- Glade - A User Interface Designer https://infrastructure.pages.gitlab.gnome.org/glade-web/ , https://ultimate-gtk4-crystal-guide.geopjr.dev/en/first-app/ui-design.html (part of the repository: `sudo apt install glade`)
- Cambalache - A User Interface Designer https://gitlab.gnome.org/jpu/cambalache (Flatpak)
- Lazarus - A Delphi compatible cross-platform IDE https://www.lazarus-ide.org/
- Gitleaks https://github.com/gitleaks/gitleaks
- GitGuardian https://www.gitguardian.com/state-of-secrets-sprawl-report-2023
- GitHub CLI https://cli.github.com/ https://cli.github.com/manual/gh_repo_create (part of the repository: `sudo apt install gh`)
- Lazygit https://github.com/jesseduffield/lazygit . https://git-how.com/
- Terraform https://developer.hashicorp.com/terraform/install https://developer.hashicorp.com/terraform/cli/install/apt
- Scilab Xcos https://www.scilab.org/software/xcos (part of the repository: `sudo apt install scilab`)
- MATLAB Simulink https://www.mathworks.com/products/simulink.html
- Alacritty - modern terminal emulator https://github.com/alacritty/alacritty (part of the repository: `sudo apt install alacritty`)
- Code Beautify https://codebeautify.org/ (online)
- Carbon - code to image https://carbon.now.sh/ (online)
- xfreerdp - Remote Desktop Protocol Implementation https://www.freerdp.com/ (part of the repository: `sudo apt install lightdm-remote-session-freerdp2`)
  - Mac: Microsoft Remote Desktop
  - Android: Remote Desktop Mobile (Microsoft Remote Desktop)
- SSH Client (already preinstalled: `apt list openssh-client`)
- WireGuard https://www.wireguard.com/ (part of the repository: `sudo apt install wireguard`)
- Compiler Explorer https://godbolt.org/ (online)
- UV - An extremely fast Python package and project manager, written in Rust. https://docs.astral.sh/uv/
- Marimo - A reactive Python notebook (similar to jupyter) that's reproducible, git-friendly, and deployable as scripts or apps. https://docs.marimo.io/
- gRPCurl https://github.com/fullstorydev/grpcurl/
- gRPC UI https://github.com/fullstorydev/grpcui
- Protobuf https://github.com/protocolbuffers/protobuf/releases/ (part of the repository: `sudo apt install -y protobuf-compiler libprotobuf-dev`)
- UPX compression reduces the size of a binary but adds a small decompression delay on startup (part of the repository: `sudo apt install upx`)
- lazydocker https://github.com/jesseduffield/lazydocker

#### Disk Usage Analyzer
- Baobab https://apps.gnome.org/Baobab/ (part of the repository: `sudo apt install baobab`)
- ncdu [How-To](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/Working_with_files_and_directory/ncdu.md) (part of the repository: `sudo apt install ncdu`)
- `du -h --max-depth=1 /path/to/directory` or `du -h --max-depth=1 .` for the current directory
- GParted (best known partition editor/formatter) https://gparted.org/ (part of the repository: `sudo apt install gparted`)
- Disks https://apps.gnome.org/DiskUtility/ (already preinstalled: `sudo apt install gnome-disk-utility`)
- dysk - instead of `df -h` for listing your filesystems, previously known as lfs https://github.com/Canop/dysk
- iotop - real-time, per-process view of disk read/write usage (part of the repository: `sudo apt install iotop` run with `sudo iotop -o`)
- fatrace - file-level access monitoring in real-time (part of the repository: `sudo apt install fatrace` run with `sudo fatrace`)

#### USB installation media creation tools
- WoeUSB - A Microsoft Windows® USB installation media preparer https://github.com/WoeUSB/WoeUSB (`chmod +x woeusb-5.2.4.bash && ./woeusb-5.2.4.bash --help`)
- Cubic (Custom Ubuntu ISO Creator) - A GUI wizard to create a customized Live ISO image for Ubuntu and Debian based distributions https://github.com/PJ-Singh-001/Cubic/wiki
- Startup Disk Creator `sudo apt install usb-creator-gtk`
- BalenaEtcher https://www.balena.io/etcher/
- Raspberry Pi Imager https://www.raspberrypi.com/software/ [#advanced-options](https://www.raspberrypi.com/documentation/computers/getting-started.html#advanced-options)
- ddimage script using dd[^4]
```bash
sudo wget https://raw.githubusercontent.com/Tornado3P9/installscript-linux/master/ddimage -O /usr/local/bin/ddimage
sudo chmod a+rx /usr/local/bin/ddimage
ddimage
```

#### AppImage Programs that run on any Linux system
- Kdenlive Video Editor https://kdenlive.org/en/download/
- Aseprite (Animated sprite editor & pixel art tool) https://www.aseprite.org/
- Stellarium http://stellarium.org/
- Ultimaker Cura (3D printing + slicer) https://ultimaker.com/software/ultimaker-cura
- MeshLab https://www.meshlab.net/
- BalenaEtcher https://github.com/balena-io/etcher/releases/
- Virtual MIDI Piano Keyboard (VMPK) https://vmpk.sourceforge.io/
- OneNote (Unofficial Desktop App, actually an independent browser window for the online OneNote) https://github.com/patrikx3/onenote

<br>

### Installation and Setup of the downloaded Programs:

**You can also use `wget` or `curl` to download the programs**
```bash
wget -L https://zoom.us/client/latest/zoom_amd64.deb -P $HOME/Programs/
wget -L https://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcolor2/gcolor2_0.4-2.1ubuntu1_amd64.deb -P $HOME/Programs/
wget -L https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -P $HOME/Programs/
wget -L "https://www.geogebra.org/download/deb.php?arch=amd64" -O $HOME/Programs/geogebra5_amd64.deb
wget -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P $HOME/Programs/
wget -L https://cdn.akamai.steamstatic.com/client/installer/steam.deb -P $HOME/Programs/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

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

And if any app at all does not work correctly or has got an error, the fix might be as easy as reinstalling the affected app:  
```bash
sudo apt install --reinstall app_name
```

**AppImage Packages**  
AppImages don't require installation. You just have to tell your system that the program is allowed to be executed. Once that is done you can just double click on it.
```bash
# Setting the executable bit to all AppImage files in the Programs directory:
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

- or create a link to the system programs directory `/usr/local/bin/blender` which will let you start it from the terminal and the Applications Menu. You can create the link in `/usr/bin/`, but since it is intended for system-wide binaries managed by the package manager, consider using `/usr/local/bin/` instead, which is intended for manually installed software.
   ```bash
   sudo ln -sf /opt/program_directory/blender /usr/local/bin/blender
   ```
   Consider changing the owner and the group of the application directory `/opt/program_directory/` to the current user recursively (`-R`):
   ```bash
   sudo chown -R $(whoami):$(whoami) /opt/program_directory/
   ```
   If you want to restrict the permissions so that only the current user has access to the directory, you can use the chmod command:
   ```bash
   sudo chmod -R 700 /opt/program_directory/
   ```

- or create a [Panel App Launcher](#adding-app-launcher-to-the-xfce-panel)

- or create an **Application.desktop** file:
   ```bash
   # Either by directly copying the desktop file to the final location:
   sudo cp blender.desktop /usr/share/applications/
   # Or by letting a program handle the process for you:
   sudo desktop-file-install blender.desktop

   # Set correct permissions:
   sudo chmod 644 /usr/share/applications/blender.desktop

   # Check permissions:
   ls -l /usr/share/applications/blender.desktop

   # Update the desktop database:
   sudo update-desktop-database
   ```

<br>

### Firefox Web Browser

https://support.mozilla.org/en-US/kb/install-firefox-linux

The configuration files, addons and bookmarks of firefox reside at `/home/$USER/.mozilla/`. Deleting the directory `.mozilla` gives you the experience of a "freshly installed firefox" without any customizations. Handle with care.  

(Optional)  
Firefox ESR (Extended Support Release) is a version of the Firefox web browser designed for organizations and users who need extended support for mass deployments. Unlike the regular version of Firefox, which receives updates every four weeks, Firefox ESR is updated with major releases approximately once a year. This provides a more stable environment with only security and stability updates in between major releases, making it ideal for enterprises, educational institutions, and other users who prioritize stability over having the latest features.  
```bash
sudo apt install firefox-esr
```

Security tip for using Firefox:
- Type **`about:config`** into the *URL Search Bar* and then look for `pdfjs.enableScripting`. Set that to `false`.  
- Type **`about:preferences`** into the *URL Search Bar* and go to **Privacy & Security**. Scroll down and choose `Enable HTTPS-Only Mode in all windows`.
This way your browser will only allow save connections and will ask you for permission if the website does not support https. Also `Enable DNS over HTTPS`.
- Type **`about:performance`** into the *URL Search Bar* to see the Firefox **Task Manager**. There you can see which application or addon uses up too many resources.
- **Optionally!** you can harden your security by changing even more settings.  
**Note: disabling hackable comfort functions may also reduce comfort.**  
  - `media.peerconnection.enabled` set that to `false` to disable WebRTC if you do not specifically need this feature.  
  - `network.dnscacheExpiration` change the number down to `10`.  
  - `network.dns.disableIPv6` leave that at `false`.  
  - `dom.event.clipboardevents.enabled` set only to `false` if you don't use it (it's a nice feature though).  
  - `geo.enabled` set that to `false`.  
  - `privacy.trackingprotection.enabled` set that to `true`.  
  - `network.http.sendRefererHeader` set that at `0`.  
  - `webgl.disabled` leave that at `false`.  
  - `browser.send_pings` leave that at `false`.  
  - `network.prefetch-next` set that to `false`.  
  - `browser.formfill.enable` set that to `false`.  
  - `browser.cache.disk.enable` set that to `false`.  
  - `browser.cache.memory.enable` set that to `false`.  
  - `browser.cache.offline.enable` set that to `false`.  

More privacy stuff: https://www.privacytools.io/  

<br>

### Adding ShortCuts

*`xfce4-settings-manager`* → Keyboard → Application Shortcuts  
*`xfce4-keyboard-settings`*  

For setting Keyboard Shortcuts in your windows manager:  
*`xfce4-settings-manager`* → Window Manager → Keyboard  
*`xfwm4-settings`*  

**Custom Keyboard Shortcut:**  
`Ctrl+Alt+T` = xfce4-terminal --hide-menubar --hide-toolbar --hide-scrollbar --maximize

**Default Keyboard Shortcuts** (`Super` is another name for the `Windows Key`)  
`Ctrl+Alt+Delete` = xfce4-session-logout  
`Shift+Ctrl+Esc` = xfce4-taskmanager  
`Alt+F2` = xfrun4  
`Super+L` = xflock4  
`Super+W` = exo-open --launch WebBrowser  
`Super+F` = exo-open --launch FileManager  
`Super+T` = exo-open --launch TerminalEmulator  
`Ctrl+Alt+T` = exo-open --launch TerminalEmulator  
`Super+F1` = xfce4-find-cursor  
`Print` = xfce4-screenshooter -f  
`Shift+Print` = xfce4-screenshooter -r  
`Alt+Print`  = xfce4-screenshooter -w  
`Ctrl+Esc` = xfce4-popup-whiskermenu (Standard Menu)   
`Alt+F1` = xfce4-popup-applicationsmenu  
*Quite useful: killing the open window below the mouse pointer*  
`Ctrl+Alt+Esc` = xkill  
`Ctrl+Q` / `Ctrl+W` = Close Application/Window  

**Window Manager**  
`Alt+Space` = Window operations menu  
`Alt+Tab` = Cycle windows  
`Shift+Alt+Tab` = Cycle windows (Reverse)  
`Super+Tab` = Switch window for same application  
`Super+Arrow Up` = Maximize window  
`Super+Arrow Down` = Hide window  
`Super+Arrow Left` = Move/Tile Window Left  
`Super+Arrow Right` = Move/Tile Window Right  
`Alt+F5` = Scale Horizontal  
`Alt+F6` = Scale Vertical  
`Super+D` = Show Desktop (minimize windows)  

**Terminal**  
`Shift+Home` = Jump to top  
`Shift+End` = Jump to bottom  
`Shift+Page Up` = Jump one page up  
`Shift+Page Down` = Jump one page down  
`Shift+Arrow Up` = Scroll up  
`Shift+Arrow Down` = Scroll down  
`Ctrl+Shift+F` = Find  
`Arrow Up` = Show previous command  
`Arrow Down` = Show next command  
`Ctrl+Shift+C` = Copy to clipboard  
`Ctrl+Shift+V` = Paste from clipboard  
`Ctrl+Shift+S` = Set Title...  
`Ctrl+L` = Clear the visible output on the screen (vs the `clear` command which also clears your buffer)  
`Ctrl+Shift+Q` = Close terminal  

<br>

### Adding App launcher to the XFCE panel
![app launcher](pics/add_launcher.gif)

<br>

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

<br>

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

<br>

### Backups
- [Timeshift](https://github.com/linuxmint/timeshift) - `sudo apt install timeshift`
- [Chezmoi - Easily moving Linux installs](https://christitus.com/chezmoi/)
- [Déjà Dup Backups](https://snapcraft.io/deja-dup) - `sudo apt install deja-dup`
- [Pika Backup](https://apps.gnome.org/PikaBackup/) - (you need flatpak enabled for this)
- [Make a Full Disk Backup with DD](https://bdoga.com/full-disk-backup-with-dd/)
  - `dd if=/dev/sdc conv=sync,noerror status=progress bs=64K | gzip -c > backup_image.img.gz`
  - `gunzip -c backup_image.img.gz | dd of=/dev/sdc status=progress`

- #### Check File Integrity
  - [Check File Integrity on Linux the Easy Way With GtkHash](https://www.makeuseof.com/check-file-integrity-on-linux-with-gtkhash/) - `sudo apt install gtkhash`
  - [Advanced Intrusion Detection Environment (AIDE)](https://www.tecmint.com/check-integrity-of-file-and-directory-using-aide-in-linux/) - `sudo apt install aide`
  - [Tripwire](https://www.tripwire.com/) - `sudo apt install tripwire`
  - [rust_hasher](https://github.com/Tornado3P9/rust_hasher)
  - `md5sum testfile` → `echo "4311d1887f6d4ddf411b36df124dfde6  testfile" | md5sum -c`
  - `sha256sum testfile > checksums.txt` → `sha256sum -c checksums.txt`

<br>

### Virtual Machine
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - `sudo apt install virtualbox`
- [QEMU](https://www.qemu.org/) (Even faster than VirtualBox) - [christitus-setup](https://www.christitus.com/vm-setup-in-linux), [absprog-setup](https://absprog.com/post/qemu-kvm-ubuntu-24-04), [christitus-windows-inside-linux](https://christitus.com/windows-inside-linux/), [absprog-shared-folder](https://absprog.com/post/qemu-kvm-shared-folder)
- [Distrobox](https://wiki.archlinux.org/title/Distrobox)

<br>

### Gaming
- [Lutris](https://lutris.net/)
- [Steam](https://store.steampowered.com/about/) - optionally use `sudo apt install steam`  
  - Log files: `find $HOME/.steam/steam/steamapps/compatdata/ -type f -name "*.log"`
  - Game files: `ls -lh $HOME/.local/share/Steam/steamapps/common/`  
  or `ls -lh $HOME/.steam/steam/steamapps/common/`  
  Next to the steam directory, some games also store user-specific non-essential (application-specific) data files, such as game scores, application state, or downloaded data in the `~/.local/share/` directory. It is the equivalent of what is often called "Application Data" on Windows systems.
- [itch.io](https://itch.io/)
- [gamingonlinux.com](https://www.gamingonlinux.com/)

Many developers provide a Linux version of their game on Steam, like Shadow of Mordor or Witcher 2, for instance. But sometimes the Linux version only runs on an `NVIDIA graphics card`, e.g. Shadow of Mordor or Witcher 2. So be aware of that if sth. doesn't work. Steam also provides the feature to run Windows games with their own Wine version called Proton. That also solves the problem with specific graphics cards mentioned before (https://www.protondb.com/search?q=Middle-earth). Sometimes a Windows game runs better on Linux with Proton than on Windows (e.g. Elden Ring). Alternatively you might want to take a look onto the https://lutris.net/ platform where other linux gamers explain how to install some games. Often times there is a ready to go solution or a tutorial and there is also a forum to ask questions. But don't expect anything. Linux is not a gaming system. That's Window's speciality as the games are most of the time being made with Windows in mind! Not because Linux (or Mac for that matter) is a bad system for gaming, quite the contrary, but because as a developer you look for the biggest user base since making a game is always a bit of a gamble. Still, you will probably find a performance improvement in a lot of cases (e.g. Blender 3d rendering times, ..) just for using Linux.
If the performance on your linux machine still does not work as well as you were hoping for, try to find out which linux system the developer of your program is using. The developer for Steam Proton, for instance, seems to have worked on Fedora Linux. So just switching to that system for gaming might solve some hard to guess problems. Or use a gaming system like https://nobaraproject.org/ which is a modified version of Fedora Linux with user-friendly fixes added to it, specifically for gaming and streaming. Equally so the https://bazzite.gg/ Linux System which seems to be very robust, even for very new users.

<br>

### Game Engines
- [Pygame](https://pypi.org/project/pygame/)
- [Bevy](https://crates.io/crates/bevy)
- [SDL2](https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/How-To-Install-SDL-On-Ubuntu.md)
- [Unity](https://unity.com/download)
- [Unreal Engine](https://www.unrealengine.com/)

<br>

### Microsoft PowerShell
- https://github.com/PowerShell/PowerShell
- [Installing PowerShell on Ubuntu (Microsoft Tutorial)](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.3)

<br>

### Decentralised Data Storage - IPFS
- IPFS Desktop https://docs.ipfs.io/install/ipfs-desktop/
- IPFS Companion browser add-on https://docs.ipfs.io/install/ipfs-companion/
- host single-page website https://docs.ipfs.io/how-to/websites-on-ipfs/single-page-website/#linux

<br>

### Converting RPM to DEB packages
- FPM [fpm.readthedocs.io](https://fpm.readthedocs.io/en/latest/packages/rpm.html#arguments-when-used-as-input-type)
- Alien [manpages.ubuntu.com](https://manpages.ubuntu.com/manpages/jammy/man1/alien.1p.html) [geeksforgeeks.com](https://www.geeksforgeeks.org/how-to-convert-rpm-package-to-deb-using-alien-package-converter/)

<br>

### ShellGPT
- https://github.com/TheR1D/shell_gpt#readme

<br>

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
# on X11 it requires xclip or xsel
sudo apt install xclip
sudo apt install xsel

# on Wayland it requires wl-clipboard
sudo apt install wl-clipboard
```

<br>

### Tiling Window Manager
- [i3](https://i3wm.org/) (part of the repository: `sudo apt install i3`)
- [Hyprland](https://hyprland.org/) Example: https://youtu.be/wcHUQXMhhow

<br>

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

<br>

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

<br>

### Wine (run windows programs)
https://wiki.winehq.org/Ubuntu
```bash
sudo dpkg --add-architecture i386
sudo apt update && sudo apt install wine winetricks

winetricks
# Run winetricks in the console, and select “select the default wineprefix”. Install the “core” Microsoft fonts.

wine --version

winecfg

cd ~/Programs
wine program.exe
```

<br>

### External Hardware/Controller/Game Pad
- Xboxdrv (driver package) `sudo apt install xboxdrv`  
  For most users, the Linux kernel built-in `xpad` driver should suffice for Xbox 360 and Xbox One controllers.
- evtest (monitor and debug input devices such as keyboards, mice, and joysticks) `sudo apt install evtest`
- jstest-gtk (joystick testing and configuration tool) `sudo apt install jstest-gtk`
- python3-serial (Python library used for serial communication) `sudo apt install python3-serial`
  Alternatively: `pip3 install pyserial` and test with `python3 -c "import serial"`
  Try `pyserial-miniterm` which comes with the PySerial library.
- Devices are 'files' at `ls -l /dev/` (https://www.kernel.org/doc/Documentation/admin-guide/devices.txt)

<br>

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

<br>

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
[Inkscape complete video course - YouTube Playlist](https://www.youtube.com/playlist?list=PLHl8nuacOfLL8DvbWVyMX_xaWfea3JbfN)  
[Scribus complete video course - YouTube Playlist](https://www.youtube.com/playlist?list=PLHl8nuacOfLK709_hb3ViX3Nef9WchSQH)  
[The Ultimate GIMP 2.10 Guide - YouTube Playlist](https://www.youtube.com/playlist?list=PLHl8nuacOfLKBWAYhgQ7gguAcTqnadSXx)  
https://www.youtube.com/@GraphicdesignforFree/playlists  
[Why don't more people use Linux? - David Heinemeier Hansson](https://world.hey.com/dhh/why-don-t-more-people-use-linux-33b75f53)  
https://omakub.org/  
[How to use Zenity dialog boxes with examples](https://youtu.be/TQQxKXQq_t0)  
[I installed Linux (so should you) - PewDiePie](https://youtu.be/pVI_smLgTY0)  

<br>

### Deutscher Linux Support
- https://www.linuxguides.de/linux-support/
- https://www.b1-systems.de/

<br>

### List of working printers
- https://forum.linuxguides.de/core/index.php?article/4-liste-funktionierender-drucker/

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
[^2]:Firewall: https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/admin%20tools/firewall_ufw.md
[^4]:dd https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-images-on-linux https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/dd.md
[^5]:VideoLAN libdvdcss: https://www.videolan.org/developers/libdvdcss.html, https://wiki.ubuntuusers.de/DVD-Wiedergabe/#Problembehebung
[^6]:Photoshop: https://appdb.winehq.org/objectManager.php?sClass=application&iId=20, https://lutris.net/games/adobe-photoshop-cs6/, https://youtu.be/tDmipHok8oQ, https://tuxdigital.com/podcasts/destination-linux/dl-281/

