#!/bin/bash

NCARD=`nvidia-smi -L | wc -l`

if [ $1 == 'ETH' ]
  then
    if [ $2 == '1060' ]
      then
        PL=75
      fi
    if [ $2 == '1070' ]
      then 
        PL=100
      fi
  fi
if [ $1 == 'ETC' ]
  then
    if [ $2 == '1060' ]
      then
        PL=75
      fi
    if [ $2 == '1070' ]
      then 
        PL=100
      fi
  fi
if [ $1 == 'ZEC' ]
  then
    if [ $2 == '1060' ]
      then
        PL=100
      fi
    if [ $2 == '1070' ]
      then 
        PL=160
      fi
  fi
if [ $1 == 'ZEN' ]
  then
    if [ $2 == '1060' ]
      then 
        PL=100
      fi
    if [ $2 == '1070' ]
      then 
        PL=160
      fi
  fi
sleep 15
for i in `seq 0 $(($NCARD - 1))`
  do
    sudo nvidia-smi -i $i -pm 0
    sudo nvidia-smi -i $i -pl $PL
    # nvidia-smi -i $i -ac 4004,1911
  done

exit
