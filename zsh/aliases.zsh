setopt completealiases

# Currently using bash aliases to preserve legacy on uni servers
#if [ -f ~/.bash_aliases ]; then
	#. ~/.bash_aliases
#fi

# Basic terminal commands
function help () {
	help $* | less
}
alias cls='clear'
alias quit='exit'
alias :q='exit'
alias :qa='exit'

# Directory movement & management
function brow() {
	if [ $# = 0 ]; then
		nautilus .
	else
		nautilus $*
	fi
}

function cs() {
	# cd to a directory and list it
	cd $1
	ls
}

function ms() {
	# Make a directory, cd to it
	mkdir $*
	cd $1
}

function size() {
	du -k $*
}
alias cd..='cd ..'
alias ll='ls -alF'
alias la='ls -A'

# Programming
function sv() {
    upperdir=~/svnRepo/2015/s2
    if [ $# != 0 ]; then
        if [ -d $upperdir/$1 ]; then
            cd $upperdir/$1
        fi
    elif [ $# = 0 ]; then
		cd $upperdir
    fi
}
alias gfort='gfortran'
alias viml="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\" --lit"
alias vim="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\""

# Git. Most of the others are covered by OMZ's git plugin
alias git=hub # always use Github's nifty plugin
alias gpom='git push origin master'
alias gun='git checkout --'
