#!/bin/bash

export DISPLAY=:0
CLOCK=160 # 160
MEM=1000 # 2000

#echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..5}
    do
        sudo nvidia-smi -i $i -pm 0
        sudo nvidia-smi -i $i -pl 170
        # nvidia-smi -i $i -ac 4004,1911
        nvidia-settings -c :0 -a [gpu:$i]/GPUPowerMizerMode=1
        nvidia-settings -c :0 -a [gpu:$i]/GPUFanControlState=1
        nvidia-settings -c :0 -a [fan:$i]/GPUTargetFanSpeed=70
        nvidia-settings -c :0 -a [gpu:$i]/GPUGraphicsClockOffset[3]=$CLOCK
        nvidia-settings -c :0 -a [gpu:$i]/GPUMemoryTransferRateOffset[3]=$MEM
    done

exit

