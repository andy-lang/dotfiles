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
		nautilus . &
	else
		nautilus $* &
	fi
}

function cs() {
	# cd to a directory and list it
	cd $1
	ls
}

function mc() {
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
alias mkdir='mkdir -p'
alias mk='mkdir'

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
alias gun='git checkout --' # "git undo"

# aliases for svn
alias sva='svn add'
alias svc='svn commit'
alias svd='svn diff'
alias svl='svn log'
alias svm='svn move'
alias svmk='svn mkdir --parents'
alias svr='svn revert'
alias svrr='svn revert --depth=infinity'
alias svs='svn status'
alias svu='svn update'
alias svrm='svn delete'
alias svrmk='svn delete --keep-local'
