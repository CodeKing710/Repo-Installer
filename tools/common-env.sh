#!/bin/bash

# Sets up a common environment (Bash/GitBash)

# Vars
__cwd=`pwd`
__alias=`cat <<-A
### Safety nets ###
alias chgrp="chgrp --preserve-root"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias mv="mv -i"
alias df="df -h"
alias du="du -h"

### QOL aliases ###
alias update="sudo apt update; sudo apt upgrade -y"
alias reload="[ -f ~/.d/rc ] && source ~/.d/rc || source ~/.bashrc"
alias shutdown="shutdown now"
alias ping="ping -c 4"
alias tping="time ping"
alias root="sudo -i"
alias edit-a="nano ~/.d/aliases"
alias edit-p="nano ~/.d/prompt"
alias edit-rc="[ -f ~/.d/rc ] && nano ~/.d/rc || nano ~/.bashrc"
alias python="python3"
alias ipkg="sudo apt install"

### Other aliases ###
# Git
alias sync="git pull; git push origin"
alias pull="git pull"
alias push="git push origin"

### Rebound Aliases ###
# Clear
alias fclear="tput clear"
alias clear="tput -x clear"
alias fclr="fclear"
alias clr="clear"

# Remove and Copy
alias rm="smart-rm"
alias cp="smart-cp"

### Conditional aliases ###
if [[ \$USER == "root" && ! -e ~/.aliascopied ]]; then
  read -p "Would you like to copy root aliases to a user directory? [Y/n] " yn
  if [[ "\${yn,}" == "y" ]]; then
    read -p "Enter username: " user
    cp /root/.bash_aliases "/home/\${user,}/.bash_aliases"
    touch /root/.aliascopied
    echo "Copied aliases!"
  fi
fi
A
`
__prompt=`cat <<-P
PS1_GIT='\`[[ "\$(git branch 2>/dev/null | cut -d " " -f2)" == "" ]] && echo "" || echo "(\$(git branch 2>/dev/null | cut -d " " -f2)) "\`'
#PS1='\[033]0;\u:\$PWD\007\]'
PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[38;5;27m\]\h\[\e[0m\] \[\e[95m\]\w\[\e[96m\] '
PS1="\$PS1""\$PS1_GIT"
PS1="\$PS1"'\[\e[0m\]\$ '
unset PS1_GIT
P
`
__smartrm=`cat <<-SR
#!/bin/bash
for arg in \$@; do
  if [ -d \$arg ]; then
    rm -rf \$arg
  else
    rm -f \$arg
  fi
done
SR
`
__smartcp=`cat <<-SC
#!/bin/bash
[ -d \$1 ] && cp -r \$1 \$2 || cp \$1 \$2
SC
`
__kjob=`cat <<-K
#!/bin/bash
[ -z "\$1" ] && echo "Usage: killjob [PROCESS_NAME]" || ( ps | grep \$1 | sed "s| \\+| |g" | sed "s/ //" | cut -d ' ' -f1 | xargs -i kill {} )
K
`

__yn=`cat <<-Y
#!/bin/bash
read -p "\$1 " yn
[[ "\${yn,}" == 'y' ]] && ( \$2 ) || ( \$3 )
Y
`

# Ensure env vars are good
[ -z "$USER" ] && USER=`id -u -n`

# Setup user's home directory
[ ! -d $HOME/bin ] && mkdir $HOME/bin
[ ! -d $HOME/.d ] && mkdir $HOME/.d
[ ! -d $HOME/repos ] && mkdir $HOME/repos
[ ! -e $HOME/.d/alias ] && echo "$__alias" > $HOME/.d/alias
[ ! -e $HOME/.d/prompt ] && echo "$__prompt" > $HOME/.d/prompt
[ ! -e $HOME/bin/kjob ] && echo "$__kjob" > $HOME/bin/kjob
[ ! -e $HOME/bin/smart-rm ] && echo "$__smartrm" > $HOME/bin/smart-rm
[ ! -e $HOME/bin/smart-cp ] && echo "$__smartcp" > $HOME/bin/smart-cp
[ ! -e $HOME/bin/yn ] && echo "$__yn" > $HOME/bin/yn

# Ask to install BSM
read -p "Would you like Bash Script Manager installed? [Y/n] " yn
[[ "${yn,}" == 'y' ]] && ( cd $HOME/repos && git clone https://github.com/CodeKing710/Bash-Script-Manager && ./Bash-Script-Manager/bsm-install -i; cd $__cwd )

# Ask to install RepoInstaller
read -p "Would you like Repo Installer installed? [Y/n] " yn
[[ "${yn,}" == 'y' ]] && ( cd $HOME/repos && git clone https://github.com/CodeKing710/Repo-Installer && ./RepoInstaller/ri; cd $__cwd )

# Ask to install ChangePath
read -p "Would you like Change Path installed? [Y/n] " yn
[[ "${yn,}" == 'y' ]] && ( cd $HOME/repos && git clone https://github.com/CodeKing710/Change-Path && cp ./Change-Path/chpath $HOME/bin; cd $__cwd )

# Cleanup
unset __alias __prompt __smartrm __smartcp __yn __kjob
