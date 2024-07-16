#!/bin/sh
# tmux split-window -v -l 5
# tmux send-keys "z scripts/" Enter "./tailwindcss.sh --watch" Enter
tmux select-pane -t :.+
tmux send-keys "air" Enter
tmux new-window
tmux send-keys "vi" Enter
