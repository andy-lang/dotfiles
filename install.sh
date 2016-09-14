#!/usr/bin/bash

PACK_CMD='dnf'
SOURCE_DIR='~'
INSTALL_STUFF=false

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
