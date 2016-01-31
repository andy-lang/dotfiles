#!/usr/bin/bash

dotfiles_location='~/.dotfiles'

while getopts "h?d:" opt; do
	case "$opt" in
		d)
			if [ -d "$OPTARG" ]; then
				dotfiles_location="$OPTARG"
			else
				printf "$s is not a valid directory. Exiting." "$OPTARG"
				exit 1
			fi
			;;
		h|\?)
			printf "Installs the dotfiles and programs necessary for this workflow."
			printf ""
			printf "-h:		Print this help file."
			printf "-d ARG:	The location of the dotfiles. This defaults to ~/.dotfiles if not given."
			exit 0
			;;
	esac
done

# Install necessary programs. Assumes that apt-get is the package manager of choice.
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo apt-get install tmux zsh 

attempts=0
failures=0

# Install Neovim dotfiles
attempts=$((attempts+1))
if hash nvim 2>/dev/null; then
	printf "Neovim installation found."
	ln -s "$dotfiles_location"/vim/vimrc "$dotfiles_location"/vim/vim/init.vim
	ln -s "$dotfiles_location"/vim/vim ~/.config/nvim
elif hash vim 2>/dev/null; then
	failures=$((failures+1))
	printf "Neovim installation missing, falling back to Vim."
	attempts=$((attempts+1))
	printf "Vim installation found."
	ln -s "$dotfiles_location"/vim/vimrc ~/.vimrc
	ln -s "$dotfiles_location"/vim ~/.vim
else
	attempts=$((attempts+1))
	failures=$((failures+2))
	printf "Neovim installation missing."
	printf "Vim installation missing."
fi

# Install Tmux dotfiles
attempts=$((attempts+1))
if hash tmux 2>/dev/null; then
	printf "Tmux installation found."
	ln -s "$dotfiles_location"/tmux/tmux ~/.tmux
	ln -s "$dotfiles_location"/tmux/tmux.conf ~/.tmux.conf
else
	failures=$((failures+1))
	printf "Tmux installation missing."
fi

# Install Zsh dotfiles
attempts=$((attempts+1))
if hash zsh 2>/dev/null; then
	printf "Zsh installation found."
	ln -s "$dotfiles_location"/zsh/zshrc ~/.zshrc
	source ~/.zshrc
elif hash bash 2>/dev/null; then
	attempts=$((attempts+1))
	failures=$((failures+1))
	printf "Zsh installation missing, falling back to Bash."
	printf "Bash installation found."
	ln -s "$dotfiles_location"/bash/bashrc ~/.bashrc
	ln -s "$dotfiles_location"/bash/bash-aliases ~/.bash_aliases
	source ~/.bashrc
else
	attempts=$((attempts+1))
	failures=$((failures+2))
	printf "Zsh installation missing."
	printf "Bash installation missing."
fi

# Install Git dotfiles
attempts=$((attempts+1))
if hash git 2>/dev/null; then
	printf "Git installation found."
	ln -s "$dotfiles_location"/git/gitconfig ~/.gitconfig
	ln -s "$dotfiles_location"/git/gitignore ~/.gitignore

	# Also install FZF
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
else
	failures=$((failures+1))
	printf "Git installation missing."
fi

printf "% attempted installations." "$attempts"
printf "%d successful installations, %d failed installations." "$((attempts - failures))" "$failures"
