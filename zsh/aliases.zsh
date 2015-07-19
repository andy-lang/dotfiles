setopt completealiases

# Currently using bash aliases to preserve legacy on uni servers
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

alias gpom='git push origin master'
alias gun='git checkout --'
