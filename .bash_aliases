#!/bin/bash

# I have a lot of aliases. I'm lazy okay

### Generic things ###

lscd() {
    cd $*
    ls
}
alias lcd='lscd' # cd to a place, then list it
alias cls='clear' # clear the terminal
#alias ls="ls --color" #list in glorious technicolor, and sorted by file extension
alias ll="ls -A"

bettergrep() {
    grep $* -n
}
alias grep='bettergrep'

naut() {
    if [ $# = 0 ]; then
	nautilus .
    else
	nautilus $*
    fi
}
alias brow="naut" # open folders in the browser

alias ff="firefox &"
alias quit="exit"
alias q="exit"

sizeof() {
    for i in $*; do
	stat "$i" -c "%n: %sB"
    done
}
alias size="sizeof" # get the size of a file/folder

### Programming ###
vimextra() {
    # if arguments given, then open these files as tabs
    if [ $# -gt 0 ]; then
	nvim -p $*
    # else if there's a file called Session.vim, open this file
    elif [ -e Session.vim ]; then
	nvim -S Session.vim
    # else open vanilla vim (vim-nilla?)
    else
	nvim
    fi
}
alias vi="vimextra"
alias vim="vimextra"
alias nvi="vimextra"
alias nvim="vimextra"

lazysvn() {
    if [ $# = 0 ]; then
	cd ~/svnRepo/2015/s1
    fi
}
alias sv='lazysvn' #yep

#alias ssh="ssh a1648205@uss.cs.adelaide.edu.au" #ssh into uni servers
scphack() {
	scp -rp $* a1648205@uss.cs.adelaide.edu.au:scp
}
alias scp="scphack" #scp whatever files I want into my uni account
