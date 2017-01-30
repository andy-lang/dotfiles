#!/bin/bash

cmd="stow"
while getopts "nv" opt; do
	case "$opt" in
		n)
			cmd="$cmd -n"
			;;
		v)
			cmd="$cmd -v"
			;;
	esac
done

echo "$cmd"

if ! command -v $cmd > /dev/null; then
	printf "%s is not installed. Please install stow before continuing.\n" "$cmd"
	exit 1
fi

declare -a stow_dirs=("bash" "editorconfig" "gdb" "git" "latexmk" "tmux" "vim" "zsh")
for d in "${stow_dirs[@]}"; do
	full_cmd="$cmd $d"
	$($full_cmd)
done
