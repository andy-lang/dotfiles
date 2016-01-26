#!/usr/bin/bash

# TODO: command line parameter
dotfiles_location='~/.dotfiles'

# TODO counter for successes/failures (+array of successful commands?)
# TODO necessary programs install from txt file

# Install Neovim dotfiles
if hash nvim 2>/dev/null; then
	printf "Neovim installation found."
	ln -s "$dotfiles_location"/vim/vimrc "$dotfiles_location"/vim/vim/init.vim
	ln -s "$dotfiles_location"/vim/vim ~/.config/nvim
else
	printf "Neovim installation missing."
fi

# Install Vim dotfiles
if hash vim 2>/dev/null; then
	printf "Vim installation found."
	ln -s "$dotfiles_location"/vim/vimrc ~/.vimrc
	ln -s "$dotfiles_location"/vim ~/.vim
else
	printf "Vim installation missing."
fi

# Install Tmux dotfiles
if hash tmux 2>/dev/null; then
	printf "Tmux installation found."
	ln -s "$dotfiles_location"/tmux/tmux ~/.tmux
	ln -s "$dotfiles_location"/tmux/tmux.conf ~/.tmux.conf
else
	printf "Tmux installation missing."
fi

# Install Zsh dotfiles
if hash zsh 2>/dev/null; then
	printf "Zsh installation found."
	ln -s "$dotfiles_location"/zsh/zshrc ~/.zshrc
	source ~/.zshrc
elif hash bash 2>/dev/null; then
	printf "Zsh installation missing."
	printf "Bash installation found."
	ln -s "$dotfiles_location"/bash/bashrc ~/.bashrc
	ln -s "$dotfiles_location"/bash/bash-aliases ~/.bash_aliases
	source ~/.bashrc
else
	printf "Zsh installation missing."
	printf "Bash installation missing."
fi

# Install Git dotfiles
if hash git 2>/dev/null; then
	printf "Git installation found."
	ln -s "$dotfiles_location"/git/gitconfig ~/.gitconfig
	ln -s "$dotfiles_location"/git/gitignore ~/.gitignore
else
	printf "Git installation missing."
fi
