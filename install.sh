#!/usr/bin/bash

PACK_CMD='dnf'
SOURCE_DIR='~'
INSTALL_STUFF=false

declare -a install_programs=('vim' 'neovim' 'tmux' 'latexmk')

function help() {
	printf "Installation script for dotfiles.\n"
	printf "Calls package manager to install necessary packages (if specified), downloads & installs the necessary GitHub libraries, and symlinks the relevant stuff.\n"
	printf "Valid arguments:\n"
	printf "\t-d [ARG]\tSource directory where files shall be symlinked. Defaults to your home directory if not given.\n"
	printf "\t-h\tPrint this help text.\n"
	printf "\t-i [ARG]\tInstall relevant using a package manager. The argument gives the package manager to use.\n"
}

while getopts "d:hi:" opt; do
	case "$opt" in
		d)
			SOURCE_DIR="$OPTARG"
			printf "Set SOURCE_DIR to %s\n" "$OPTARG" 1>&2
			;;
		h)
			help
			exit 0
			;;
		i)
			INSTALL_STUFF=true
			PACK_CMD="$OPTARG"
			printf "Files will be installed using %s.\n" "$OPTARG" 1>&2
			;;
		\?)
			printf "Invalid option: -%s\n" "$OPTARG" 1>&2
			help
			exit 1;
			;;
		:)
			printf "Option -%s requires an argument.\n" "$OPTARG" 1>&2
			help
			exit 1
			;;
	esac
done

if [ "$INSTALL_STUFF" == true ]; then
	for cmd in "${install_programs[@]}"; do
		sudo "$PACK_CMD" install "$cmd"
	done
fi

# SYMLINKING
# bash
ln -s bash/bashrc "$SOURCE_DIR"/.bashrc
ln -s bash/bash-aliases "$SOURCE_DIR"/.bash_aliases

# gdb
ln -s gdb/gdbinit "$SOURCE_DIR"/.gdbinit

# git
ln -s git/gitconfig "$SOURCE_DIR"/.gitconfig
ln -s git/gitignore "$SOURCE_DIR"/.gitignore

# latexmk
ln -s latexmk/latexmkrc "$SOURCE_DIR"/.latexmkrc

# tmux
ln -s tmux/tmux.conf "$SOURCE_DIR"/.tmux.conf
ln -s tmux/tmux "$SOURCE_DIR"/.tmux

# vim
ln -s vim/vimrc "$SOURCE_DIR"/.vimrc
ln -s vim/vim "$SOURCE_DIR"/.vim
# neovim
ln -s vim/vim "$SOURCE_DIR"/.config/nvim
ln -s vim/vimrc "$SOURCE_DIR"/.config/nvim/init.vim

# zsh
ln -s zsh/zshrc "$SOURCE_DIR"/.zshrc
ln -s zsh/zsh "$SOURCE_DIR"/.zsh

# install:
	# fzf
	# media player status
	# omnivim
	# antigen
