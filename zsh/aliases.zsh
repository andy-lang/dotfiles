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

alias gdb='gdb -q'

alias viml="python ~/.tmux/scripts/omnivim.py --lit"
alias vim="python ~/.tmux/scripts/omnivim.py"
export OMNIVIM_EDITOR=/usr/bin/nvim
export NVIM_SOCKET_PATH='/home/andrew/'

# Git. Most of the others are covered by OMZ's git plugin
if hash hub 2>/dev/null; then
	alias git=hub # always use Github's nifty plugin
fi
alias gpom='git push origin master'
alias gun='git checkout --' # "git undo"
alias gap='git add -p'

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

alias lpp='lpass show -c --password'

# geeknote
if hash geeknote 2>/dev/null; then
	alias gn=geeknote
fi
