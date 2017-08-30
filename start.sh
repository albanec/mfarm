#!/bin/bash

sleep 30

# oc 
./oc.sh $1
# start miner
tmux new-session -d -n mining
tmux send-keys -t mining "./start.sh $1
"

sleep 10

exit 0
