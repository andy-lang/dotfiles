#!/usr/bin/env bash

tmuxProcesses=$(ps -e | grep tmux | wc -l) # get number of tmux processes
echo '|'"$tmuxProcesses"'|'
two=2
if [ "$tmuxProcesses" -ge "$two" ]; then # if at least 2 tmux processes (ie client and server) running, then we're most likely in a tmux session
	s=$(tmux display-message -p '#S') # get current session
	for p in `tmux list-panes -s -F "#{pane_current_command}-#{pane_id}" -t "$s"` ; do # get current command of each pane in session, and associated pane id
		progname=$(echo $p | tr "-" " " | awk '{print $1}')
		paneid=$(echo $p | tr "-" " " | awk '{print $2}')
		echo $progname, $paneid
		if [ $progname == 'vim' ]; then # if the program in the current pane is vim, send commands to vim in this pane
			# change vim's pwd to the directory of the pane where the command was sent
			tmux send-keys -l -t $paneid ":cd $PWD
			"
			# then send the command line arguments
			for var in "$@"; do
				tmux send-keys -l -t $paneid ":ed $var
				"
			done
			# move vim back to the previous working directory
			tmux send-keys -l -t $paneid ":cd -
			"

			tmux select-pane -t $paneid # select the pane where Vim is located
			exit # end
		fi
	done
	# if we get to here, no process was found. So just make a new Vim session in the current pane.
	/usr/bin/vim $*
else
	# not enough tmux processes, so just make vim in the current terminal window
	/usr/bin/vim $*
fi
