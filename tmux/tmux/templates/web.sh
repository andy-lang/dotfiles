# tmux layout for code development
# large terminal for vim on top, smaller terminal for general purposes on the bottom

tmux split-window -v -p 20 -c "#{pane_current_path}"
tmux split-window -h -p 30 -c "#{pane_current_path}"
tmux select-pane -L
tmux select-pane -U


