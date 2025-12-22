# If you want to change the behavior of an alias in a running terminal without making it a permanent change, just redefine it in the terminal like `alias gh='history|grep -i'`
# If you want to change the behavior of a function, you might want to `unset -f name_of_the_function` the original function first and define it again by copying the function from here to your terminal.
# You can test any of these aliases or functions without making them permanent on your system:
#   - Define the alias or function, test it and then remove it by either 'unsetting' it or by closing the terminal window.

# Old command prompt: echo $PS1
#PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# New command prompt:
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}:) \[\033[01;34m\]\w\[\033[00m\]\$ "

# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[32m\]\t\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\]\$ "
# \[\e[32m\]: Sets the text color to green.
# \t: Displays the current time in hh:mm:ss format.
# \[\e[0m\]: Resets the text color.
# \[\033[01;34m\]\w\[\033[00m\]: Colored directory path \w.
# \$: Displays the prompt character ($ for regular users, # for root).

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
alias ports='ss -tupan'  # netstat -tupan

# different time zones
alias mytime='date "+%A %Y-%m-%d %T %Z (UTC%:z)"'
alias chinatime='TZ="Asia/Shanghai" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias germantime='TZ="Europe/Berlin" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias austriantime='TZ="Europe/Vienna" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias swisstime='TZ="Europe/Zurich" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias taiwantime='TZ="Asia/Taipei" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias portugaltime='TZ="Europe/Lisbon" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias irelandtime='TZ="Europe/Dublin" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
alias uktime='TZ="Europe/London" date +"%A %Y-%m-%d %T %Z (UTC%:z)"'
#alias moretimezones='find /usr/share/zoneinfo -type f'

#Search files in the current folder, e.g.: f "funny-clip"
alias f="find . | grep -i"

#count files (include -maxdepth 1 to only look in the current directory)
alias count='find . -type f | wc -l'

#count directories (include -maxdepth 1 to only look in the current directory)
alias countd='find . -mindepth 1 -type d | wc -l'

#Disk usage analyzer with an ncurses interface.
alias ncdu='ncdu --color off'
alias d='du -sh'  # all files data together and human readable
#du -kh file1.jpg file2.jpg file3.jpg | cut -f1
#ls -lh | cut -d ' ' -f 5

#display disk usage information for the current directory, listing the top 40 largest files and directories, and handles errors gracefully by providing an alternative output in MB if needed:
alias diskcheck='(df -h .;echo; du -ahx $(pwd) --exclude=/proc | sort -rh 2>/dev/null | head -40 | sort -rh 2>/dev/null) || (echo "Angabe in MB" && du -amx $(pwd) --exclude=/proc | sort -rn | head -40)'

#find which processes consume the most memory: ps aux --sort=-%mem | awk 'NR<=10{print $0}'
alias memcheck='free -mh; echo; ps aux --sort=-%mem | awk '\''NR<=10{printf "%-30s %s\n", $11, $4}'\'''

#list files
alias ldate='ls -ltrh'            # sort by date
alias ll='ls -Fls'                # long listing format
alias lf="ls -l | grep -Ev '^d'"  # files only
alias ldir="ls -l | grep -E '^d'" # directories only

# Show all hidden files and folders (The -d option ensures that directories are not expanded into their contents)
alias hidden='ls -d .*'

#view only mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

#view the mount output formated with columns
alias lsmount='mount | column -t'

#search from history by word: hgrep bash
alias hgrep='history|grep --ignore-case'

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

#convert video
webm2mp4() {
  input_file="$1"
  output_file="${input_file%.webm}.mp4"
  ffmpeg -i "$input_file" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 192k "$output_file"
}

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

count_string_length() {
  local input_string="$1"
  echo "${#input_string}"
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

# Display the last 10 commits in short format:
alias lol='git log --oneline -n 10'

# Usage: lzgit finally lazy commits
function lzgit() {
    # # Check if git repository (assumes the script is run in the root of the repository)
    # if [ ! -d ".git" ]; then
    #     echo "Error: Make yourself a coffee, then do 'git init'"
    #     return 1
    # fi

    # Check if inside a Git repository
    if ! git rev-parse --is-inside-work-tree &>/dev/null; then
      echo "Error: Not a Git repository."
      return 1
    fi

    # Get the current date in YYYYMMDD format
    local current_date=$(date +%Y%m%d)

    local username=$(git config user.name)
    if [ -z "$username" ]; then
        echo "Git user.name is not set."
        return 1
    fi

    # Count the number of commits made today
    local commit_count=$(git log --since=midnight --oneline | wc -l)

    # Increment the number
    local commit_number=$((commit_count + 1))

    # Create the commit message with the date and commit number
    local commit_message="${current_date}-${username}-${commit_number} $*"

    # Add all changes and commit
    #git add .  # stage changes only in the current directory and its subdirectories
    git add -A  # stage all changes in the repository
    git commit -m "$commit_message"
}

# Display the email/user from the last commit:
alias gitemail='git log --pretty=format:"%an <%ae>" -n 1'

# Get the url for the Github remote repository (you have to be inside the project folder)
function giturl() {
  git config --get remote.origin.url
}

# Toggle the git url between HTTPS and SSH
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

function create_git_tag_from_cargo_toml() {
  # Check if an argument was provided
  if [ "$#" -ne 1 ]; then
    echo "No argument found. Please use 'release' or 'private'."
    return 1
  fi

  # Extract version from Cargo.toml
  version=$(grep '^version' Cargo.toml | sed 's/version = "\(.*\)"/\1/')

  # Check if version was found
  if [ -z "$version" ]; then
    echo "Version not found in Cargo.toml"
    return 1
  fi

  if [ "$1" == "release" ]; then
    echo "Creating a Release version tag"
    git tag -a "v$version" -m "Release version $version"

    read -p "Also push the tag v$version to the remote repository? (y/n): " choice
    case "$choice" in
        y|Y )
            echo "Pushing the tag to the remote repository"
            git push origin "v$version"
            ;;
        * )
            echo "Action canceled."
            ;;
    esac

  elif [ "$1" == "private" ]; then
    echo "Creating a private tag"
    git tag "v$version"
  else
    echo "Invalid argument. Please use 'release' or 'private'."
    return 1
  fi

  echo "Tag v$version created."
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
    md5sum -c $1 | grep FAILED      # checksums.md5
    #sha256sum -c $1 | grep --color=auto FAILED  # checksums.sha256
    return
  fi
  find "$1" -type f -exec md5sum {} + > checksums.md5
  #find "$1" -type f -exec sha256sum {} + > checksums.sha256
}

# The following was partly copied from https://github.com/ChrisTitusTech/mybash/blob/main/.bashrc

mktar() { tar -cvf "${1%/}.tar" "${1%/}"; }
mktarbz2() { tar -cvjf "${1%/}.tar.bz2" "${1%/}"; }
mktargz() { tar -cvzf "${1%/}.tar.gz" "${1%/}"; }
mktarxz() { tar -cJf "${1%/}.tar.xz" "${1%/}"; }

alias xz='/usr/bin/xz --keep'
alias unxz='/usr/bin/unxz --keep'

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
        # *.zip) zipinfo $archive ;;
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

  # External IP Lookup (ident.me, ifconfig.me)
  echo -n "External IP: "
  curl -s ident.me
  echo ""
}

function ipconfig() {
ip -o -f inet addr show | while read -r line; do
    # Declare variables as local
    local iface ip_cidr ip prefix_length subnet_mask status broadcast ipv6_info ipv6_address ipv6_prefix gateway ipv6_gateway

    # Extract interface name, IP address, and CIDR
    iface=$(echo "$line" | awk '{print $2}')
    ip_cidr=$(echo "$line" | awk '{print $4}')
    
    # Split IP and CIDR
    ip=$(echo "$ip_cidr" | cut -d'/' -f1)
    prefix_length=$(echo "$ip_cidr" | cut -d'/' -f2)
    
    # Calculate subnet mask from prefix_length
    subnet_mask=$(awk -v prefix_length="$prefix_length" 'BEGIN {
        for (i=0; i<4; i++) {
            n = (prefix_length >= 8) ? 255 : (256 - 2^(8-prefix_length%8));
            prefix_length -= 8;
            printf "%s%s", n, (i<3 ? "." : "\n");
        }
    }')
    
    # Determine interface status
    ip link show $iface | grep --color=auto -q "state UP" && status="Up" || status="Down"
    
    # Get broadcast address
    broadcast=$(ip -o -f inet addr show $iface | awk '{print $6}')
    
    # Get IPv6 information
    ipv6_info=$(ip -o -f inet6 addr show $iface | awk '{print $4}')
    IFS='/' read -r ipv6_address ipv6_prefix <<< "$ipv6_info"
    
    # Get gateways
    gateway=$(ip route show default 0.0.0.0/0 dev $iface | awk '/default/ {print $3}')
    ipv6_gateway=$(ip -6 route show default dev $iface | awk '/default/ {print $3}')
    
    # Print in a format similar to ipconfig from windows
    echo "==================================================="
    echo "Ethernet adapter $iface:"
    echo ""
    echo "   Status . . . . . . . . . . . : $status"
    echo "   IPv4 Address . . . . . . . . : $ip/$prefix_length"
    echo "   Subnet Mask. . . . . . . . . : $subnet_mask"
    echo "   Broadcast Address. . . . . . : $broadcast"
    echo "   IPv6 Address . . . . . . . . : $ipv6_address"
    echo "   IPv6 Prefix Length . . . . . : $ipv6_prefix"
    echo "   Default Gateway (IPv4) . . . : $gateway"
    echo "   Default Gateway (IPv6) . . . : $ipv6_gateway"
    echo ""
done
echo "==================================================="
}
# nmcli device show
# ipcalc

function youtube() {
  if ! command -v mpv &> /dev/null; then
    echo "mpv is not installed. Please install it first."
    return 1
  fi
  if [ "$#" -ne 1 ]; then
    echo 'Usage: youtube "https://www.youtube.com/watch?v=Y_YVkQaS6Uc"'
    return 1
  fi
  mpv --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-format='bestvideo[height<=1080][fps<=30][vcodec!=vp9]+bestaudio/best' --fullscreen --screenshot-format=png --screenshot-directory="$HOME" "${1}"
}

# get-from-playlist https://youtu.be/Qz9myXwR7Cc?list=PLhKnLRfabC1ZHGLdA4TBBmsyP6LVRX9w2 -> https://youtu.be/Qz9myXwR7Cc
function getfromplaylist() {
  echo "$1" | sed 's/\?.*//'
}

# divide_into_30_min_parts 24  # begin with output_024.m4a instead of output_000.m4a
function divide_into_30_min_parts() {
  ffmpeg -i input.m4a -f segment -segment_time 1800 -c copy -reset_timestamps $1 -segment_start_number 1 output_%03d.m4a
}

# Usage: cdf <directory|file>
function cdf() {
    # Check if argument was provided
    if [ $# -eq 0 ]; then
        cd "$HOME"
        return $?
    fi

    # Get absolute path of target
    target="$1"

    # If it's a directory, cd directly
    if [ -d "$target" ]; then
        cd "$target"
        return $?
    fi

    # If it's a file, get its directory
    if [ -f "$target" ]; then
        dir=$(dirname "$(readlink -f "$target")")
        cd "$dir"
        return $?
    fi

    # If neither exists, show error
    echo "Error: '$target' is neither a valid directory nor file"
    return 1
}
# Create alias for the function
#alias cd='cdf'
#