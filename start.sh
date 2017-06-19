#!/bin/bash
MINER_PATH='/home/rig_admin/claymore_miner_v9.3'
CARDS_COLOR='red'
tmux new-session -d -n mining
tmux send-keys -t mining "cd $MINER_PATH
"
tmux send-keys -t mining "./start.sh
"
sleep 10

# oc 
sh ./oc_$CARDS_COLOR.sh

sleep 2
# screen -r
exit 0
