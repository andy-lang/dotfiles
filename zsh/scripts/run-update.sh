#!/usr/bin/zsh

# small update script for various package managers etc.

sudo dnf update -y

nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa
