# Old command prompt: echo $PS1
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# New command prompt version A:
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]-->\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ "
# New command prompt version B:
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$ "
#
# some more aliases
alias update='sudo apt update && apt list --upgradeable && read -p "Press Enter To Continue Or STRG+C To Cancel:" && sudo apt upgrade -y'
alias restartaudio='pulseaudio -k && sudo alsa force-reload'
alias nHistory='history -c && history -w'
alias nthumbnails='rm -r /home/user/.cache/thumbnails/*'
alias emptyTrash='rm -rf ~/.local/share/Trash/*'
alias beenden='shutdown -h now'
alias renamehelp='echo rename \'\''s/#//\'\'' \*.m4a'
alias weckerhelp='echo sleep 5m && mpv sound.mp3 --no-video --start=00:00:13 --loop'
alias aliases='less ~/.bash_aliases'
alias c='clear'
alias cl='clear;ls'
alias root='sudo su'
alias ports='netstat -tupan'
#
#find the largest top 10 files and directories in human readable format
alias dumax='du -hsx * | sort -rh | head -10'
#
#open in file manager
alias open='thunar'
#
#navigation
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'
alias Music='cd ~/Music'
alias Videos='cd ~/Videos'
#
#alias ase='acpi -b && sensors'
alias ase='sensors'
#
#virtual environments workflow: python3 -m venv my-project-env && source my-project-env/bin/activate
alias ve='python3 -m venv ./venv'
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'
#
#convert audio
alias m4a2mp3='for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k "${f%.m4a}.mp3"; done'
alias wav2mp3='for f in *.wav; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k -ar 48000 "${f%.wav}.mp3"; done'
alias mp32wav='for f in *.mp3; do ffmpeg -i "$f" "${f%.mp3}.wav"; done'
alias m4a2wav='for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.wav"; done'
alias flac2mp3='for f in *.flac; do ffmpeg -i "$f" -c:v copy -q:a 0 "${f%.flac}.mp3"; done'
alias videosoundup='for f in *.mp4; do ffmpeg -i "$f" -filter:a "volume=30dB" -codec:a aac -b:a 74k -c:v copy "_${f}"; done'
#
#search
#alias lt='ls --human-readable --size -1 -S --classify'
#
#view only mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
#
#search from history by word: gh bash
alias gh='history|grep'
#
#sort by modification time
alias left='ls -t -1'
#
#count files
alias count='find . -type f | wc -l'
#
#play 6th line inside directory (ls -1v)
#Example: playline 6
function playline() {
  local n1=$(ls -1v | sed -n "$1 p");
  mpv "$n1";
}
