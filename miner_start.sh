#!/bin/bash
COIN=$1

case '$COIN' in
  ETH)
    MINER_PATH='/home/rig_admin/miner/Claymore_ETH'
    tmux new-session -d -n mining
    tmux send-keys -t mining "cd $MINER_PATH
    "
    tmux send-keys -t mining "./start.sh ETH
    "
  ;;
  ZEC)
    MINER_PATH='/home/rig_admin/miner/Claymore_ZEC'
    tmux new-session -d -n mining
    tmux send-keys -t mining "cd $MINER_PATH
    "
    tmux send-keys -t mining "./start.sh ZEC
    "
  ;;
esac

sleep 10

# fan 
sh ./fan.sh
sleep 2

exit 0
