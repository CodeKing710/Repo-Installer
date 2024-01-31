#!/bin/bash

aliasFile=$(cat <<ALIAS
# Add basic safety net aliases
alias chgrp="chgrp --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df="df -h"
alias du="du -h"

# QOL aliases
alias update="sudo apt update; sudo apt upgrade -y"
alias install="sudo apt install -y; update"
alias shutdown="shutdown now"
alias ping="ping -c 4"
alias tping="time ping"
alias home="cd ~; cd"
alias root="sudo -i"
alias edit-a="nano ~/.bash_aliases"
alias python="python3"

# Conditional aliases
if [[ \$USER == "root" && ! -e ~/.aliascopied ]]; then
  read -p "Would you like to copy root aliases to a user directory? [Y/n] " yn
  if [[ "\${yn,,}" == "y" ]]; then
    read -p "Enter username: " user
    cp /root/.bash_aliases "/home/\${user,,}/.bash_aliases"
    touch /root/.aliascopied
    echo "Copied aliases!"
  fi
fi
ALIAS
)

read -p "This script adds common aliases to a user, continue? [Y/n] " yn
if [[ "${yn,,}" == "y" ]]; then
  read -p "Enter user: " user
  # sudo echo "$aliasFile" > /root/.bash_aliases
  echo "$aliasFile" > "/home/${user,,}/.bash_aliases"
fi