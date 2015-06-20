# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
PROMPT="%{$fg_bold[magenta]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$fg_no_bold[yellow]%}%1\%{$reset_color%}: "

autoload -U compinit


