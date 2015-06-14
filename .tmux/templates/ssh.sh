# Run ssh into uni servers, two windows side by side

#!/usr/bin/env bash

tmux split-window -h -c "#{pane_current_path}"
tmux select-pane -L
ssh a1648205@uss.cs.adelaide.edu.au

