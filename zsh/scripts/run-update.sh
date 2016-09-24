#!/usr/bin/zsh

# small update script for various package managers etc.

sudo dnf update -y

nvim -c "PlugUpgrade" -c "PlugInstall" -c "PlugUpdate" -c "qa"
