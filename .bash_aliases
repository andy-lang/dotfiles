#!/bin/bash

# I have a lot of aliases. I'm lazy okay

### Generic things ###

vimtab() {
	vi -p $*
}
alias vi="vimtab"
alias vim="vimtab" # always open Vim files as tabs

lscd() {
    cd $*
    ls
}
alias lcd='lscd' # cd to a place, then list it
alias cls='clear' # clear the terminal
#alias ls="ls --color" #list in glorious technicolor, and sorted by file extension
alias ll="ls -A"

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
sthack() {
	subl $* &
}
alias st='sthack' #runs a script called sthack that does fancy stuff that one line just can't handle

#bettermake() {
#	if [ -e ./build ]; then
#		./build
#	else
#		make
#	fi
#}
#alias m="bettermake" # I'm super lazy

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
