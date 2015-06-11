#!/usr/bin/env bash

s=$(tmux display-message -p '#S')
for p in `tmux list-panes -s -F "#{pane_current_command}-#{pane_id}" -t "$s"` ; do
	progname=$(echo $p | tr "-" " " | awk '{print $1}')
	paneid=$(echo $p | tr "-" " " | awk '{print $2}')
	if [ $progname == 'vim' ]; then
		tmux send-keys -l -t $paneid ":cd $PWD
		"
		for var in "$@"; do
			tmux send-keys -l -t $paneid ":ed $var
			"
		done
		tmux send-keys -l -t $paneid ":cd -
		"
		tmux select-pane -t $paneid
		exit
	fi
done

# if we get to here, no process was found.
# So just make a new Vim session in the current pane.
vim $*
