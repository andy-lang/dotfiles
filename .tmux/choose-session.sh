# Interactive bash script to open a pre-existing tmux session, one from a shell script, or a brand-spankin' new one

#!/usr/bin/env bash

echo "Options: "

declare -a current_sessions
for	line in $(tmux ls -F '#S'); do
	#tmux ls -F '#S'
	echo ${#current_sessions[@]}')' $line
	current_sessions+=("$line")
done

echo ${#current_sessions[@]}') new session'
echo $((${#current_sessions[@]}+1))') new session from script'

read -p "What do you want? " num

if [ $num -lt ${#current_sessions[@]} ]; then
	tmux attach-session -t ${current_sessions[$num]}
elif [ $num -eq ${#current_sessions[@]} ]; then
	read -p "Name for new session: " name
	tmux new-session -s $name
else
	declare -a script_templates
	echo "list of script templates:"

	prevWD=$PWD
	cd ~/.tmux/scripts
	for	line in $(ls *.sh); do
		#tmux ls -F '#S'
		echo ${#script_templates[@]}')' $line
		script_templates+=("$line")
	done
	cd $prevWD
	read -p "Template: " tempnum
	if [ $tempnum -lt ${#script_templates[@]} ]; then
		read -p "Name for new session: " name
		shell_cmd="~/.tmux/scripts/"${script_templates[$tempnum]}
		#chmod +x $shell_cmd
		tmux new-session -d -s $name
		tmux send-keys -t $name.0 "$shell_cmd" Enter
		tmux attach-session -t $name
	fi
fi
