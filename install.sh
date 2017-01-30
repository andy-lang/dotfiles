#!/bin/bash

cmd="stow"
if ! command -v $cmd > /dev/null; then
	printf "%s is not installed. Please install stow before continuing.\n" "$cmd"
	exit 1
fi

declare -a stow_dirs=("bash" "editorconfig" "gdb" "git" "latexmk" "tmux" "vim" "zsh")
for d in "${stow_dirs[@]}"; do
	stow "$d"
done
