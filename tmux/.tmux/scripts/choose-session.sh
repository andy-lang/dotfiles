# Interactive bash script to open a pre-existing tmux session, one from a shell script, or a brand-spankin' new one

#!/usr/bin/env bash

tmux start-server
echo "Options: "

declare -a current_sessions
declare -a script_templates
i=0
for	line in $(tmux ls -F '#S'); do
	#tmux ls -F '#S'
	echo "$i"')' $line
	current_sessions+=("$line")
	let i+=1
done
echo "$i"') new session'
let i+=1

prevWD=$PWD
cd ~/.tmux/templates
for	line in $(ls *.sh); do
	echo "$i"')' $line '(template)'
	script_templates+=("$line")
	let i+=1
done
cd $prevWD

read -p "What do you want? " num

if [ $num -lt ${#current_sessions[@]} ]; then
	# attach to existing session
	tmux attach-session -t ${current_sessions[$num]}
elif [ $num -eq $((${#current_sessions[@]})) ]; then
	# new session, no template
	read -p "Name for new session: " name
	tmux new-session -s $name
else
	decr=$((${#current_sessions[@]}+1))
	idx=$((num - decr))

	read -p "Name for new session: " name
	shell_cmd="~/.tmux/templates/"${script_templates[$idx]}
	tmux new-session -d -s $name
	tmux send-keys -t $name.0 "$shell_cmd" Enter
	tmux attach-session -t $name
fi
