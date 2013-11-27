#!/bin/sh

source env.sh
tmux has-session -t cognician
if [ $? != 0 ]
then
tmux new-session -s cognician -n datomic -d
tmux send-keys -t cognician 'cd ~/Cognician/datomic' C-m
tmux send-keys -t cognician './run-datomic.sh' C-m
#tmux split-window -v -t cognician
#tmux select-layout -t cognician main-horizontal
#tmux send-keys -t cognician:1.2 'cd ~/devproject' C-m
tmux new-window -n repl -t cognician
tmux send-keys -t cognician:repl 'cd ~/Cognician/Server' C-m
tmux send-keys -t cognician:repl 'lein repl' C-m

tmux new-window -n server -t cognician
tmux send-keys -t cognician:server 'cd ~/Cognician/Server' C-m
tmux new-window -n resources -t cognician
tmux send-keys -t cognician:resources 'cd ~/Cognician/Resources' C-m
tmux select-window -t cognician:repl
fi
tmux attach -t cognician
