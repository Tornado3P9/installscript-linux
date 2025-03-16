# If you want to change the behavior of an alias in a running terminal without making it a permanent change, just redefine it in the terminal like `alias gh='history|grep -i'`
# If you want to change the behavior of a function, you might want to `unset -f name_of_the_function` the original function first and define it again by copying the function from here to your terminal.
# You can test any of these aliases or functions without making them permanent on your system:
#   - Define the alias or function, test it and then remove it by either 'unsetting' it or by closing the terminal window.

# Old command prompt: echo $PS1
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# New command prompt:
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]-->\[\033[00m\] \h: \[\033[01;34m\]\w\[\033[00m\]\$ "

# some more aliases
alias update='sudo apt update && apt list --upgradeable'
alias upgrade='sudo apt upgrade'
alias restartaudio='pulseaudio -k && sudo alsa force-reload'
alias nHistory='history -c && history -w'
alias nThunarHistory='rm ~/.local/share/recently-used.xbel*'
alias nthumbnails='rm -r ~/.cache/thumbnails/*'
alias emptyTrash='rm -rf ~/.local/share/Trash/*'
alias shutdown='shutdown -h now'  # reboot, poweroff, shutdown, halt
alias renamehelp="echo 'rename '\''s/#//'\'' *.m4a' 'or preview(-n) what a change of every occurrence(g) of multiple space(\s+) to single space looks like:' 'rename -n '\''s/\\s+/ /g'\'' *'"
alias alarmclockhelp='echo "sleep 5m && mpv sound.mp3 --no-video --start=00:00:13 --loop"'
alias aliases='less ~/.bash_aliases'
alias c='clear'
alias cl='clear;ls'
alias root='sudo su'
alias ports='netstat -tupan'

#Search files in the current folder, e.g.: f "funny-clip"
alias f="find . | grep -i"

#sort by modification time
alias left='ls -t -1'

#count files (include -maxdepth 1 to only look in the current directory)
alias count='find . -type f | wc -l'

#count directories (include -maxdepth 1 to only look in the current directory)
alias countd='find . -mindepth 1 -type d | wc -l'

#Disk usage analyzer with an ncurses interface.
alias ncdu='ncdu --color off'

#list files
alias lt='ls --human-readable --size -1 -S --classify'

#view only mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

#view the mount output formated with columns
alias lsmount='mount | column -t'

#search from history by word: hgrep bash
alias hgrep='history|grep --ignore-case'

#find the largest top 10 files and directories in human readable format (ignore hidden files)
alias dumax='du -hsx * | sort -rh | head -10'

#find which processes consume the most memory
alias memax='ps -e -orss=,args= | sort -nr | head'

#open stuff
function open() {
  if [ $# -eq 0 ]; then
    # No arguments passed, open the current directory
    xdg-open .
  else
    # Loop through all arguments and open each one
    for arg in "$@"; do
      xdg-open "$arg"
    done
  fi
}

#navigation
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias music='cd ~/Music'
alias videos='cd ~/Videos'
alias pics='cd ~/Pictures'

#text editor (Alt+N = Turn line numbers on/off) (type '\nano' to use the default configuration of nano) (https://nano-editor.org/dist/latest/cheatsheet.html)
#alias nano='nano --linenumbers'

#virtual environments workflow: python3 -m venv my-project-env && source my-project-env/bin/activate
alias ve='python3 -m venv ./.venv'
alias ae='deactivate &> /dev/null; source ./.venv/bin/activate'
alias de='deactivate'

#convert audio
alias m4a2mp3='for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k "${f%.m4a}.mp3"; done'
alias wav2mp3='for f in *.wav; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k -ar 48000 "${f%.wav}.mp3"; done'
alias mp32wav='for f in *.mp3; do ffmpeg -i "$f" "${f%.mp3}.wav"; done'
alias m4a2wav='for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.wav"; done'
alias flac2mp3='for f in *.flac; do ffmpeg -i "$f" -c:v copy -q:a 0 "${f%.flac}.mp3"; done'
alias videosoundupmp4='for f in *.mp4; do ffmpeg -i "$f" -filter:a "volume=30dB" -codec:a aac -b:a 74k -c:v copy "_${f}"; done'

# Make a numbered list from the media files in the current directory and play the chosen file
# Example: playline
# Example: playline 6
function playline() {
  if [ "$#" -ne 1 ]; then
    ls -1v | nl
    return 0
  fi
  local n1=$(ls -1v | sed -n "$1 p");
  mpv "$n1";
}

# overwrite 'rm' with a function that moves the files to a bin instead of directly deleting it
# OR use the `trash-cli` tool
# OR create an alias rm='rm -i' for only deleting after asking for permission
function rm(){
  mkdir -p /tmp/trash
  mv $@ /tmp/trash
}

# compile a c++ program and execute
function c() {
  g++ -o app $1 && ./app
}

# change between lower and upper case string
function upper() {
  echo "$1" | tr '[:lower:]' '[:upper:]';
}
function lower() {
  echo "$1" | tr '[:upper:]' '[:lower:]';
}

# Function to remove special characters, leading and ending spaces, and multiple spaces (some editors like VSC do that automatically)
# Usage: make_markdown_link_to_some_title_on_same_page "   Hello! This is a    Test String.   "
# Returns: #hello-this-is-a-test-string
make_markdown_link_to_some_title_on_same_page() {
  # Remove special characters
  modified_string=$(echo "$1" | sed 's/[^a-zA-Z0-9 ]//g')
  # Remove leading and ending spaces
  modified_string=$(echo "$modified_string" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
  # Remove multiple spaces and replace remaining single spaces with '-'
  modified_string=$(echo "$modified_string" | tr -s ' ' | sed 's/ /-/g')
  # Convert to lowercase
  modified_string=$(echo "$modified_string" | tr '[:upper:]' '[:lower:]')
  echo "#$modified_string"
}

# lazy-git
# Usage: lzgit "finally easy commits"
function lzgit() {
  git add .
  git commit -m "$1"
}

# Get the url for the Github remote repository (you have to be inside the project folder)
# Usage: giturl
function giturl() {
  git config --get remote.origin.url
}

# Toggle the git url between HTTPS and SSH
# Usage: toggle_git_url
function toggle_git_url() {
  local current_url new_url
  current_url=$(git config --get remote.origin.url)

  if [[ $current_url == git@github.com:* ]]; then
    new_url=${current_url/git@github.com:/https:\/\/github.com\/}
  elif [[ $current_url == https://github.com/* ]]; then
    new_url=${current_url/https:\/\/github.com\//git@github.com:}
  else
    echo "Current URL is not recognized as SSH or HTTPS."
    return 1
  fi

  git remote set-url origin "$new_url"
  echo "Remote URL changed to: $new_url"

  # git config --list
  # git config --get remote.origin.url
  # git remote show origin
}

function remove_trailing_spaces() {
  # Check if a file name is provided as an argument
  if [ "$#" -ne 1 ]; then
    echo "Usage: remove_trailing_spaces <filename>"
    return 1
  fi

  # Use sed to remove trailing whitespace
  sed -i 's/[[:space:]]\+$//' "$1"

  # Alternatively create a new file instead of overwriting the old one:
  # sed 's/[[:space:]]\+$//' "$file" > "new_$file"
}

function checksums() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: checksums <directory path>"
    echo "Usage: checksums checksums.md5"
    return 1
  fi
  if [[ $1 == *.md5 ]]; then
    md5sum -c $1 | grep --color=auto FAILED      # checksums.md5
    #sha256sum -c $1 | grep --color=auto FAILED  # checksums.sha256
    return
  fi
  find "$1" -type f -exec md5sum {} + > checksums.md5
  #find "$1" -type f -exec sha256sum {} + > checksums.sha256
}

# The following was partly copied from https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

# Alias's for archives: mkgz archive.tar.gz file1 file2 file3
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

alias xz='/usr/bin/xz --keep'
alias unxz='/usr/bin/unxz --keep'
alias mktarxz='tar -cJf'
alias untarxz='tar -xvf'

# Extracts any archive(s) (if unp isn't installed): extract archive1.xz archive2.tar.gz
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*.tar.xz) tar xvf $archive ;;
			*.xz) unxz $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# List content of any archive(s)
listarchive() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar -tjf $archive ;;
			*.tar.gz) tar -tzf $archive ;;
			*.tar.xz) tar -tJf $archive ;;
			*.bz2) bzcat $archive ;;
			*.rar) unrar l $archive ;;
			*.gz) gunzip -c $archive ;;
			*.tar) tar -tf $archive ;;
			*.tbz2) tar -jtf $archive ;;
			*.tgz) tar -tzf $archive ;;
 			*.zip) unzip -l $archive ;;
#			*.zip) zipinfo $archive ;;
			*.Z) zcat $archive ;;
			*.7z) 7z l $archive ;;
			*.xz) xz --list $archive ;;
			*) echo "don't know how to list the content of '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
        # Internal IP Lookup.
        echo -n "Internal IP: "
        ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'

        # External IP Lookup
        echo -n "External IP: "
        curl -s ifconfig.me
        echo ""
}

function ipconfig() {
  # Get all the network interfaces
  interfaces=$(ip -o link show | awk -F': ' '{print $2}')

  # Loop through each interface and display relevant information
  for iface in $interfaces; do
    echo "==================================================="
    echo "Ethernet adapter $iface:"
    echo ""

    # Check if the interface is up
    ip link show $iface | grep -q "state UP" && status="Up" || status="Down"
    echo "   Status . . . . . . . . . . . : $status"

    # Get the IPv4 address, mask and gateway for the interface
    ip_info=$(ip -o -f inet addr show $iface | awk '{print $4, $6}')
    IFS=' ' read -r ip_address broadcast <<< "$ip_info"

    # subnet_mask=""
    # if [[ $status == "Up" ]]; then
    #   local cidr=${ip_address#*/}
    #   local mask=$((0xffffffff << (32 - cidr)))
    #   subnet_mask="$(( (mask >> 24) & 0xff )).$(( (mask >> 16) & 0xff )).$(( (mask >> 8) & 0xff )).$(( mask & 0xff ))"
    # fi

    echo "   IPv4 Address . . . . . . . . : $ip_address"
    # echo "   Subnet Mask. . . . . . . . . : $subnet_mask"
    echo "   Broadcast Address. . . . . . : $broadcast"

    # Get the IPv6 address and prefix
    ipv6_info=$(ip -o -f inet6 addr show $iface | awk '{print $4}')
    IFS='/' read -r ipv6_address ipv6_prefix <<< "$ipv6_info"

    echo "   IPv6 Address . . . . . . . . : $ipv6_address"
    echo "   IPv6 Prefix Length . . . . . : $ipv6_prefix"

    # Get the default gateway for IPv4
    gateway=$(ip route show default 0.0.0.0/0 dev $iface | awk '/default/ {print $3}')
    echo "   Default Gateway (IPv4) . . . : $gateway"

    # Get the default gateway for IPv6
    ipv6_gateway=$(ip -6 route show default dev $iface | awk '/default/ {print $3}')
    echo "   Default Gateway (IPv6) . . . : $ipv6_gateway"
    echo ""
  done
  echo "==================================================="
}

function youtube() {
  if [ "$#" -ne 1 ]; then
    echo 'Usage: youtube "https://www.youtube.com/watch?v=Y_YVkQaS6Uc"'
    return 1
  fi
  mpv --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-format='bestvideo[height<=1080][fps<=30][vcodec!=vp9]+bestaudio/best' --fullscreen --screenshot-format=png --screenshot-directory="$HOME" "${1}"
}

#