A repository for my personal set of dotfiles. Currently the main software configurations are for Vim, bash, and tmux, though there are a few for git as well. Zsh is a work in progress.

Unlike the traditional structure of dotfiles, each program is split up into its own folder. The reason for this is purely my own need for compulsive organisation. If you want to use the dotfiles, you can either move them to the appropriate location (not recommended), or symlink them to the locations expected by their software. For example,

	   sudo ln -s ~/.dotfiles/vim/vimrc ~/.vimrc

would symbolically link the vimrc file to a location that Vim expects.

Any questions, queries, etc can be sent on to me. Let me know if you see me doing something and you know a better way of doing it - I always like to hear about how I can improve my workflow.
