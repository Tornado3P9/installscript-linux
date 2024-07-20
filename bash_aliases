# Old command prompt: echo $PS1
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# New command prompt:
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]-->\[\033[00m\] \h: \[\033[01;34m\]\w\[\033[00m\]\$ "

# some more aliases
alias update='sudo apt update && apt list --upgradeable'
alias upgrade='sudo apt upgrade -y'
alias restartaudio='pulseaudio -k && sudo alsa force-reload'
alias nHistory='history -c && history -w'
alias nThunarHistory='rm ~/.local/share/recently-used.xbel*'
alias nthumbnails='rm -r ~/.cache/thumbnails/*'
alias emptyTrash='rm -rf ~/.local/share/Trash/*'
alias shutdown='shutdown -h now'
alias renamehelp='echo rename \'\''s/#//\'\'' \*.m4a'
alias alarmclockhelp='echo sleep 5m && mpv sound.mp3 --no-video --start=00:00:13 --loop'
alias aliases='less ~/.bash_aliases'
alias c='clear'
alias cl='clear;ls'
alias root='sudo su'
alias ports='netstat -tupan'

#Search files in the current folder: f "funny-clip"
alias f="find . | grep -i"

#sort by modification time
alias left='ls -t -1'

#count files
alias count='find . -type f | wc -l'

#list files
alias lt='ls --human-readable --size -1 -S --classify'

#view only mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

#view the mount output formated with columns
alias lsmount='mount | column -t'

#search from history by word: gh bash
alias gh='history|grep'  # same as: alias gh='history|rg'

#find the largest top 10 files and directories in human readable format (ignore hidden files)
alias dumax='du -hsx * | sort -rh | head -10'

#find which processes consume the most memory
alias memax='ps -e -orss=,args= | sort -nr | head'

#open in file manager
alias open='thunar'

#navigation
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'
alias Music='cd ~/Music'
alias Videos='cd ~/Videos'

#text editor (Alt+N = Turn line numbers on/off) (type '\nano' to use the default configuration of nano) (https://nano-editor.org/dist/latest/cheatsheet.html)
#alias nano='nano --linenumbers'

#virtual environments workflow: python3 -m venv my-project-env && source my-project-env/bin/activate
alias ve='python3 -m venv ./venv'
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'

#convert audio
alias m4a2mp3='for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k "${f%.m4a}.mp3"; done'
alias wav2mp3='for f in *.wav; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k -ar 48000 "${f%.wav}.mp3"; done'
alias mp32wav='for f in *.mp3; do ffmpeg -i "$f" "${f%.mp3}.wav"; done'
alias m4a2wav='for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.wav"; done'
alias flac2mp3='for f in *.flac; do ffmpeg -i "$f" -c:v copy -q:a 0 "${f%.flac}.mp3"; done'
alias videosoundup='for f in *.mp4; do ffmpeg -i "$f" -filter:a "volume=30dB" -codec:a aac -b:a 74k -c:v copy "_${f}"; done'

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

# overwrite 'rm' with a function that moves the files to a bin instead of directly deleting it OR use the `trash-cli` tool
rm(){
  mkdir -p /tmp/trash
  mv $@ /tmp/trash
}

##delete after asking for permission
#alias rm='rm -i'

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
alias unzip='/usr/bin/unxz --keep'
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
			*.xz) unxz --keep $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
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

#