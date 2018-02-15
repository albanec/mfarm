#!/bin/bash

FAN_CONTROL=1
FAN_SPEED=80

export DISPLAY=:0
NCARD=`nvidia-smi -L | wc -l`

if [ $1 == 'ETH' ]
  then
    if [ $2 == '1060' ]
      then
        CLOCK=120
        MEM=1000
      fi 
    if [ $2 == '1070' ]
      then
        CLOCK=120
        MEM=1000
      fi
  fi
if [ $1 == 'ETC' ]
  then
    if [ $2 == '1060' ]
      then
        CLOCK=120
        MEM=1000
      fi 
    if [ $2 == '1070' ]
      then
        CLOCK=120
        MEM=1000
      fi
  fi
if [ $1 == 'ZEC' ]
  then
    if [ $2 == '1060' ]
      then
        CLOCK=160
        MEM=600
      fi 
    if [ $2 == '1070' ]
      then
        CLOCK=160
        MEM=600
      fi
  fi
if [ $1 == 'ZEN' ]
  then
    if [ $2 == '1060' ]
      then
        CLOCK=160
        MEM=600
      fi 
    if [ $2 == '1070' ]
      then
        CLOCK=160
        MEM=600
      fi
  fi

#echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in `seq 0 $(($NCARD - 1))`
  do
    nvidia-settings -c :0 -a [gpu:$i]/GPUPowerMizerMode=1
    nvidia-settings -c :0 -a [gpu:$i]/GPUFanControlState=$FAN_CONTROL
    nvidia-settings -c :0 -a [fan:$i]/GPUTargetFanSpeed=$FAN_SPEED
    nvidia-settings -c :0 -a [gpu:$i]/GPUGraphicsClockOffset[3]=$CLOCK
    nvidia-settings -c :0 -a [gpu:$i]/GPUMemoryTransferRateOffset[3]=$MEM
  done

exit
