# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _expand _complete _files _ignored  _correct 
zstyle ':completion:*' insert-tab pending
setopt noautomenu # turn off tab menu

