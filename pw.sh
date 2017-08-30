#!/bin/bash

NCARD=`nvidia-smi -L | wc -l`

case '$1' in
  ETC)
    PL=100
    ;;
  ETH)
    PL=100
    ;;
  ZEC)
    PL=120
    ;;
  ZEN)
    PL=120
    ;;
esac

for i in {0..$((NCARD - 1))}
  do
    sudo nvidia-smi -i $i -pm 0
    sudo nvidia-smi -i $i -p)l $PL
    # nvidia-smi -i $i -ac 4004,1911
  done

exit