#!/usr/bin/zsh

# small update script for various package managers etc.

# run DNF updates
sudo dnf update -y

# pull latest version of dotfiles
cd $DOTFILES
git pull origin
cd -

# upgrade vim-plug, then install & update plugins
nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa
