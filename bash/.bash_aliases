#!/bin/bash

# I have a lot of aliases. I'm lazy okay

### Generic things ###

cdls() {
    cd $*
    ls
}
alias cd..="cd .." # for the easiest typo in all of Unix
alias cs='cdls' # cd to a place, then list it
alias cls='clear' # clear the terminal
#alias ls="ls --color" # list in glorious technicolor, and sorted by file extension
alias ll="ls -A"
alias la="ls -A"

if [ -e "~/.tmux/scripts/omnivim.py" ]; then
	export OMNIVIM_EDITOR=nvim
	alias viml="~/.tmux/scripts/omnivim.py --lit"
	alias vim="~/.tmux/scripts/omnivim.py"
fi

ms() {
	mkdir $1
	cd $1
}

bettertmux() {
	if [ $# = 0 ]; then
		~/.tmux/scripts/choose-session.sh
	else
		tmux $@
	fi
}
#alias tmux='bettertmux'

#bettergrep() {
    #grep $* -n
#}
#alias grep='bettergrep' # always show line numbers in grep

betterhelp() {
    help $* | less
}
alias help='betterhelp'

brow() {
    if [ $# = 0 ]; then
		nautilus . &
    else
		nautilus $* &
    fi
}
#alias brow="naut" # open folders in the browser

alias ff="firefox &"
alias quit="exit"
alias :q="exit"
alias :qa="exit"

size() {
    for i in $*; do
		stat "$i" -c "%n: %sB"
    done
}
#alias size="sizeof" # get the size of a file/folder

### Programming ###
sv() {
    upperdir=~/svnRepo/2015/s2
    if [ $# != 0 ]; then
        if [ -d $upperdir/$1 ]; then
            cd $upperdir/$1
        fi
    elif [ $# = 0 ]; then
		cd $upperdir
    fi
}

#alias git=hub
