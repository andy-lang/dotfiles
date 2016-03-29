source $ANTIGEN/antigen.zsh
antigen use oh-my-zsh
antigen bundle dnf
antigen bundle git
antigen bundle svn
antigen bundle tmux
antigen bundle tmuxinator

antigen theme $DOTFILES/zsh/themes andrew
