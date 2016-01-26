#!/usr/bin/bash

# TODO: command line parameter
dotfiles_location='~/.dotfiles'

attempts=0
failures=0

# Install Neovim dotfiles
attempts=$((attempts+1))
if hash nvim 2>/dev/null; then
	printf "Neovim installation found."
	ln -s "$dotfiles_location"/vim/vimrc "$dotfiles_location"/vim/vim/init.vim
	ln -s "$dotfiles_location"/vim/vim ~/.config/nvim
else
	failures=$((failures+1))
	printf "Neovim installation missing."
fi

# Install Vim dotfiles
attempts=$((attempts+1))
if hash vim 2>/dev/null; then
	printf "Vim installation found."
	ln -s "$dotfiles_location"/vim/vimrc ~/.vimrc
	ln -s "$dotfiles_location"/vim ~/.vim
else
	failures=$((failures+1))
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
	printf "Zsh installation missing."
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
else
	failures=$((failures+1))
	printf "Git installation missing."
fi

printf "% attempted installations." "$attempts"
printf "%d successful installations, %d failed installations." "$((attempts - failures))" "$failures"
