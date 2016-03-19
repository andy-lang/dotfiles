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
	dir=$(pwd)/$*
	mkdir "$dir"
	cd "$1"
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
    upperdir="/home/andrew/uni/svn/2016"
    if [ $# != 0 ]; then
        if [ -d $upperdir/$1 ]; then
            cd $upperdir/$1
        fi
    elif [ $# = 0 ]; then
		cd $upperdir
    fi
}
# alias gfort='gfortran'
# alias viml="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\" --lit"
# alias vim="~/.tmux/scripts/omnivim.sh --vimcmd gvim --vimflags \"-v\""
alias viml="python ~/.tmux/scripts/omnivim.py --lit"
alias vim="python ~/.tmux/scripts/omnivim.py"
export OMNIVIM_EDITOR=nvim
export NVIM_SOCKET_PATH='/home/andrew/'

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

# aliases for dnf. Similar to oh-my-zsh's yum aliases
alias dns="dnf search"                       # search package
alias dnp="dnf info"                         # show package info
alias dnl="dnf list"                         # list packages
alias dngl="dnf grouplist"                   # list package groups
alias dnli="dnf list installed"              # print all installed packages
alias dnmc="dnf makecache"                   # rebuilds the yum package list
alias dnu="sudo dnf update"                  # upgrate packages
alias dni="sudo dnf install"                 # install package
alias dngi="sudo dnf groupinstall"           # install package group
alias dnr="sudo dnf remove"                  # remove package
alias dngr="sudo dnf groupremove"            # remove pagage group
alias dnrl="sudo dnf remove --remove-leaves" # remove package and leaves
alias dnc="sudo dnf clean all"               # clean cache
