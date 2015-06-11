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

ms() {
	mkdir $1
	cd $1
}

alias vim='~/.tmux/omnivim.sh'

bettertmux() {
	if [ $# = 0 ]; then
		~/.tmux/choose-session.sh
	else
		tmux $@
	fi
}
alias tmux='bettertmux' # always start tmux in 256 colours

bettergrep() {
    grep $* -n
}
alias grep='bettergrep' # always show line numbers in grep

betterhelp() {
    help $* | less
}
alias help='betterhelp'

brow() {
    if [ $# = 0 ]; then
		nautilus .
    else
		nautilus $*
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
    upperdir=~/svnRepo/2015/s1
    if [ $# != 0 ]; then
        if [ -d $upperdir/$1 ]; then
            cd $upperdir/$1
        fi
    elif [ $# = 0 ]; then
		cd $upperdir
    fi
}
