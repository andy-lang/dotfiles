#!/usr/bin/env bash

# if you have a custom alias for vim (eg default flag commands), change this variable as necessary in order to maintain it.
vim_command='gvim -v'

# make sure we're in tmux. If we are...
if [ -n "$TMUX" ]; then
	currentpaneid=$(tmux display-message -p "#D")
	currentwindowid=$(tmux display-message -p "#{window_id}")
	vimservercount=$($vim_command --serverlist | wc -l)
	winname=${currentpaneid:1} # pane id but without the @
	#echo "WINNAME = "$winname

	#echo $currentpaneid, $currentwindowid, $vimservercount
	vimservername="$currentwindowid"
	#echo "vim servername = " $vimservername

	# no current vim servers open. Create a new vim server
	if [ "$vimservercount" -eq "0" ]; then
		# if command line parameters passed in, use 'em.
		if [ "$#" -eq "0" ]; then
			tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername" C-m
		else
			tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername --remote-silent $@" C-m
		fi
	
	# there is a vim server open in the current window. So use it
	#elif [ "$vimservercount" -eq "1" ]; then
		#$vim_command --servername $vimservername --remote $@
		##?? TODO switch to pane id of vim
	
	# we have multiple vim servers. We want the one that's in the current window.
	# to do this we search the list of currently-running vim servers.
	# if there exists a server with this window id, we have a match. Otherwise, open it in the current pane
	else
		for p in $($vim_command --serverlist); do
			if [ "$p" == "$currentwindowid" ]; then
				echo "HERE"
				$vim_command --servername $vimservername --remote $@
				exit
			fi
		done

		if [ "$#" -eq "0" ]; then
			tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername" C-m
		else
			tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername --remote-silent $@" C-m
		fi
	fi
	#else
	#	for p in $(vim --serverlist); do
	#		if [ "$p" -eq "$currentwindowid" ]; then
	#			$vim_command --servername $vimservername --remote $@
	#			exit
	#		fi
	#	done

	#	# no vim server currently open in this window.
	#	if [ "$#" -eq "0" ]; then
	#		tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername" C-m
	#	else
	#		tmux send-keys -t "$currentpaneid" "$vim_command --servername $vimservername --remote-silent $@" C-m
	#	fi
	#fi

# otherwise we're not in tmux. So just launch Vim business as usual
else 
	$vim_command $@
fi
