#!/bin/bash

export DISPLAY=:0
NCARD=`nvidia-smi -L | wc -l`

case '$1' in
  ETC)
    CLOCK=120
    MEM=1000
    ;;
  ETH)
    CLOCK=120
    MEM=1000
    ;;
  ZEC)
    CLOCK=120
    MEM=1000
    ;;
  ZEN)
    CLOCK=120
    MEM=1000
    ;;
esac

#echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..7}
  do
    nvidia-settings -c :0 -a [gpu:$i]/GPUPowerMizerMode=1
    nvidia-settings -c :0 -a [gpu:$i]/GPUFanControlState=0
    #nvidia-settings -c :0 -a [fan:$i]/GPUTargetFanSpeed=80
    nvidia-settings -c :0 -a [gpu:$i]/GPUGraphicsClockOffset[3]=$CLOCK
    nvidia-settings -c :0 -a [gpu:$i]/GPUMemoryTransferRateOffset[3]=$MEM
  done

exit

