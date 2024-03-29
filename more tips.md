
### Excel VBA:
Man kann Excel per Wine auf Linux installieren, empfehle ich aber nicht.  
Libreoffice-Calc hat ja bereits die selben Eigenschaften wie Excel.  
Trotzdem empfehle ich statt VBA lieber "Python Pandas" auf allen Betriebssystemen zu benutzen!  
https://youtu.be/Lh6FLhgPxbc  https://youtu.be/F-gDgQ6kuuk  
https://pandas.pydata.org/pandas-docs/stable/getting_started/index.html#getting-started  
https://plotly.com/python/plotly-express/  

Grafical Disk Usage Analyzer https://apps.gnome.org/app/org.gnome.baobab/ https://apps.gnome.org/app/org.gnome.DiskUtility/
```bash
sudo apt install baobab
```

### go (go-golang) programming language
Newest Version: https://golang.org/doc/install
```bash
# Delete via:
sudo rm -rf /usr/local/go
# and also remember to delete the `export PATH=$PATH:/usr/local/go/bin` line

# Repository Version (Golang version 1.13):
sudo apt install golang-go

# Delete via:
sudo apt purge golang-go

# Test installation:
go version
```

### Speeding up Ubuntu
https://itsfoss.com/speed-up-ubuntu-1310/  
https://github.com/Tornado3P9/Linux-Console-Tools/blob/master/snap.md (completely remove snapd)  
https://averagelinuxuser.com/linux-swap/ (Decrease Swap use)  

### Installing drivers on Ubuntu is not necessary as Ubuntu detects the Video Card automaticly and installs the driver. AMD drivers have already been integrated into the linux kernel..so nothing much to do there..
But for the case that you unchecked the checkbox (automaticly install proprietary software...) when installing the system then you can go to (Settings -> Additional Drivers) -> and klick on the line, where it says (proprietary, tested)
https://phoenixnap.com/kb/install-nvidia-drivers-ubuntu This will automaticly install the driver for you. If there are problems, just try an older version. If there are still problems, then your configuration might need some changes.
By the way..NVidea will install an additional configuration center (with a green Icon "NVIDEA X SERVER SETTINGS" in case you want to go look for it inside the Settings Menu) but you can just ignore it.
Only go there if you encounter any problems with the standard configuration. For example you could enable "Force Composition Pipeline" inside the "X SERVER DISPLAY CONFIGURATION" tab, "apply" and "Save To X Configuration File" if you encounter things like "screen tearing".
I myself never encountered any Problems with grafics cards, but just in case. https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa

### Prolong the life span of your SSD/Flash Memory
https://linuxconfig.org/improve-hard-drive-write-speed-with-write-back-caching  
```bash
sudo apt install hdparm
```
Or Create A Ramdisk:  
https://linuxhint.com/ramdisk_ubuntu_1804/ https://www.linuxbabe.com/command-line/create-ramdisk-linux https://www.cyberciti.biz/faq/howto-create-linux-ram-disk-filesystem/

Disable swap to [prolong the life of the Micro SDCard](https://raspberrypi.stackexchange.com/a/186).
  * `sudo swapoff --all` disabled swap, will revert after reboot
  * `sudo apt-get remove dphys-swapfile` permanently disables swap

### Managing Trash/Recycle Bin
```bash
sudo apt install trash-cli

# More interesting details about trash handling below and in the man page.
restore-trash (1)    # Restore for Command line trash utility.
trash (1)            # Command line trash utility.
trash-empty (1)      # Empty for Command line trash utility.
trash-list (1)       # List trashed files.
trash-put (1)        # Command line trash utility.
trash-rm (1)         # Removes files matching a pattern from the trash can
# Or create an alias emptyTrash='rm -rf ~/.local/share/Trash/*' if you wish to delete only
# Or you could use this script: https://askubuntu.com/a/727758/225694 even with custom sound!
# Or you could use 'sudo apt-get install autotrash' https://vitux.com/how-to-automatically-empty-the-trash-in-ubuntu/
```

### Audio Control
https://www.howtoforge.com/tutorial/advanced-audio-control-on-linux/  
If audio give you trouble and it's not because of some proprietary Hardware/Software reason...  
then that's probably because of 'pulse audio' which is still managing the audio today...better versions coming in the future hopefully  
But what you can do is to open the conf file `sudo nano /etc/pulse/daemon.conf` and change two lines (activate them by deleting the semicolon):  
```bash
default-sample-rate = 44100
alternate-sample-rate = 44100
```
A good tipp: before you change anything in a configuration file...make a copy of the original...or make a screenshot!(usually has got the date and time in it's name)  
and then put this into a directory on your desktop? where you save all your originals so that you always know what changes you made in the past  
because you will forget sooner or later what it was you did!!  
You probably also can try changing "avoid-resampling" to true or just restart the audio. `pulseaudio -k` will kill the process and systemd will automaticly restart the process.  
That will work but is just inconvenient.  

### Record Desktop:
 * OBS Studio https://obsproject.com/
 * ffmpeg https://github.com/Tornado3P9/Linux-Console-Tools/tree/master/media/FFmpeg
 * kazam (type `cat ~/.config/kazam/kazam.conf` to see your kazam configuration file)

### Gaming:
Many Developers provide a Linux version for their game in Steam. Like "Shadow of Morder" for instance. But sometimes the linux version only runs on a NVidea grafics card (Witcher 2). So be aware of that if sth. doesn't work.
Steam also provides the feature to run Windows games with their own wine version called Proton. Alteratively you might want to take a look onto the https://lutris.net/ platform where other linux gamers explain
how to install some games. Often times there is a ready to go solution or a tutorial and there is also a forum to ask questions. But don't expect anything. Linux is not a gaming system. That's Window's speciality.

### Clipboard for multiple items
```bash
sudo apt install xfce4-clipman-plugin
```

### Terraform
https://www.terraform.io/downloads  
https://www.terraform.io/cli/install/apt  
```bash
sudo apt install terraform
```

### AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```bash
sudo apt install awscli
```

### fd (alternative for the find command)
https://github.com/sharkdp/fd  
https://youtu.be/f0N_4SgCoMY  
```bash
sudo apt install fd-find
fdfind --version
echo "alias fd=fdfind" >> ~/.bash_aliases && source ~/.bashrc
```
