#!/bin/bash

sleep 30
tmux new-session -d -n mining 
tmux send-keys -t mining "cd ~/mfarm 
"
tmux send-keys -t mining "./oc.sh $1 $2
"
sleep 5
tmux send-keys -t mining "./miner.sh $1 $2
"
sleep 10

exit 0
