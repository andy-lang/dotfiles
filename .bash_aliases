#!/bin/bash

# I have a lot of aliases. I'm lazy okay

### Generic things ###

cdls() {
    cd $*
    ls
}
alias cdl='cdls' # cd to a place, then list it
alias cls='clear' # clear the terminal
#alias ls="ls --color" # list in glorious technicolor, and sorted by file extension
alias ll="ls -A"
alias cd..="cd .." # for the easiest typo in all of Unix

bettergrep() {
    grep $* -n
}
alias grep='bettergrep' # always show line numbers in grep

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

sizeof() {
    for i in $*; do
	stat "$i" -c "%n: %sB"
    done
}
alias size="sizeof" # get the size of a file/folder

### Programming ###
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
