#!/bin/bash
coin=$1

case '$coin' in
  ETH)
    miner_path='/home/rig_admin/miner/Claymore_ETH'
    tmux new-session -d -n mining
    tmux send-keys -t mining "cd $miner_path
    "
    tmux send-keys -t mining "./start.sh ETH
    "
  ;;
  ZEC)
    miner_path='/home/rig_admin/miner/Claymore_ZEC'
    tmux new-session -d -n mining
    tmux send-keys -t mining "cd $miner_path
    "
    tmux send-keys -t mining "./start.sh ZEC
    "
  ;;
esac

sleep 10
# oc 
sh ./oc.sh
sleep 2

exit 0
