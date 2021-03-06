if [ "$TMUX" = "" ]; then tmux -2; fi

export TERM="xterm-256color"

# environment variables
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh

export ANTIGEN=$HOME/software/antigen
export EDITOR=nvim

export FZF_DEFAULT_COMMAND='find .'

# export MANPAGER="env MAN_PN=1 vimx -M +MANPAGER -"

unset SSH_ASKPASS

# turn off EOF to close zsh because it's fUCKING ANNOYING AS SHITE
set -o ignoreeof

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# eval "`dircolors ~/.mydircolors`"
# alias ls='ls --color=auto'

# make sure prompt & colours are initialised BEFORE you start setting prompts
autoload -U colors && colors
autoload -U promptinit

# This *could* be done in a for loop, but I like to specify the order
source $ZSH/antigen.zsh
source $ZSH/aliases.zsh
if [ "$EUID" -ne 0 ]; then
	# don't set autocomplete if running in root privileges
	source $ZSH/completion.zsh
fi

if [ -z $(pidof xcape) ]; then
	$ZSH/xcape.sh
fi

# turn off beep
unsetopt beep

# vim command line editing
bindkey -v
export KEYTIMEOUT=1

# Reenable help command
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt autocd
setopt extendedglob
setopt HIST_IGNORE_DUPS
unsetopt HIST_VERIFY # make sure this is done last, as OMZ will overwrite it


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
