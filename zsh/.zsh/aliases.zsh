setopt completealiases

# Basic terminal commands
function help () {
	help $* | less
}
alias cls='clear'
alias quit='exit'

# Directory movement & management
function brow() {
	if [ $# = 0 ]; then
		nautilus . &
	else
		nautilus $* &
	fi
}

alias ll='ls -alF'
alias la='ls -A'
alias cclip='echo -n | xclip -selection clipboard'
alias upd="$HOME/.zsh/scripts/run-update.sh"

# Programming
alias gdb='gdb -q'
alias pdb='python -m pdb'
alias pdb3='python3 -m pdb'

alias viml="python ~/.tmux/scripts/omnivim.py --lit"
alias vim="python ~/.tmux/scripts/omnivim.py"
export OMNIVIM_EDITOR=/usr/bin/nvim
export NVIM_SOCKET_PATH='/home/andrew/'

# Git: alias hub to git if it exists
if hash hub 2>/dev/null; then
	alias git=hub # always use Github's nifty plugin
fi

# Lastpass
alias llog='lpass login'
alias lpp='lpass show -c --password'

# geeknote
if hash geeknote 2>/dev/null; then
	alias gn=geeknote
fi
