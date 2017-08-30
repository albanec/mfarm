#!/bin/bash

NCARD=`nvidia-smi -L | wc -l`

if [ $1 == 'ETH' ]
  then
    PL=100
  fi
if [ $1 == 'ETC' ]  
  then
    PL=100
  fi
if [ $1 == 'ZEC' ]
  then
    PL=120
  fi
if [ $1 == 'ZEN' ]
  then
    PL=120
  fi

for i in {0..$((NCARD - 1))}
  do
    sudo nvidia-smi -i $i -pm 0
    sudo nvidia-smi -i $i -p)l $PL
    # nvidia-smi -i $i -ac 4004,1911
  done

exit