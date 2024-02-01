#!/bin/bash --login
# Ensure proper folders are made for the user in question
user=`id -u -n`
home="/c/Users/$user/BASH"
gitPrompt=$(cat <<-PROMPT
PS1='\[\033]0;\$TITLEPREFIX:\$PWD\007\]' # set window title
PS1="\$PS1"'\n'                    # new line
PS1="\$PS1"'\[\033[01;35m\][\$MSYSTEM]' # sys
PS1="\$PS1"'\[\033[00;00m\]:' # sys
PS1="\$PS1"'\[\033[00;34m\]'          # change to green
PS1="\$PS1"'\h\[\033[0m\]@\[\033[00;32m\]\u '        # user@
PS1="\$PS1"'\[\033[01;34m\]'       # change to blue
PS1="\$PS1"'\w'                 # current working directory
if test -z "\$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="\$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="\${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="\${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="\$COMPLETION_PATH/share/git/completion"
	if test -f "\$COMPLETION_PATH/git-prompt.sh"
	then
		. "\$COMPLETION_PATH/git-completion.bash"
		. "\$COMPLETION_PATH/git-prompt.sh"
		PS1="\$PS1"'\[\033[36m\]'  # change color to cyan
		PS1="\$PS1"'\`__git_ps1\`'   # bash function
	fi
fi
PS1="\$PS1"'\[\033[00;00m\]'        # change color
PS1="\$PS1"'$ '                 # prompt: always $

#Set HOME here
export HOME="/c/Users/$user/BASH"

[ ! -e .hushlogin ] && echo -e "Git for Windows\nCopyright (C) Free Software Foundation, Inc.\nAll rights reserved.\n\nTo hide this, run \`touch ~/.hushlogin\`\nTo adjust preload functionality, open \`~/.bashrc\` in your text editor of choice\nTo add aliases, open \`~/.aliases\` in your text editor of choice\n\nThe goal of this shell wrapper is to provide a more Linux-type experience within Git Bash.\nMake sure the setup script is run to ensure customizability of the environment!"
PROMPT
)
bashrc=$(cat <<-FILE
# Load various shell things
# Uncomment pieces of the code if certain variables don't load correctly
# Set ENV vars
export USER="\$(id -u -n)"
#export HOME="/c/Users/\$USER/BASH"	# Uncomment this if your HOME var is incorrect

# Load aliases file
[ -e ~/.aliases ] && . ~/.aliases

FILE
)
aliases=$(cat <<-ALIAS
alias la="ls -A"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias home="cd ~"
alias root="cd /"
alias reload="source ~/.bashrc"
alias edit-a="nano ~/.aliases"
alias edit-rc="nano ~/.bashrc"
ALIAS
)
launch="HOME=\"/c/Users/$user/BASH\" && cd ~ && bash --login"

# Check for proper home dir
[ ! -d $home ] && mkdir $home && echo "No 'BASH' directory found, making one at proper home location..."

# Check for visual config files
echo "Checking for previously made files, making them if they don't exist..."
[ ! -d $home/.config ] && mkdir $home/.config && mkdir $home/.config/git || echo "Existing visual configuration found!"
[ ! -e $home/.config/git/git-prompt.sh ] && echo "$gitPrompt" >> $home/.config/git/git-prompt.sh || echo "Existing custom prompt found!"
[ ! -e $home/.bashrc ] && echo "$bashrc" >> $home/.bashrc || echo "Existing bashrc found!"
[ ! -e $home/.aliases ] && echo "$aliases" >> $home/.aliases || echo "Existing alias file found!"
[ ! -e /p/Desktop/bash.sh ] && echo "$launch" >> /p/Desktop/bash.sh || echo "Launch script exists!"

#Setup completion
[ -f $home/.bashrc -a -f $home/.aliases -a -f $home/.config/git/git-prompt.sh ] && echo "Setup complete!"
