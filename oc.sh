#!/bin/bash

CLOCK=200 # 160
MEM=1500 # 2000

echo "performance" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..5}
    do
        nvidia-smi -i ${i} -pm 0
        nvidia-smi -i ${i} -pl 170
        # nvidia-smi -i ${i} -ac 4004,1911
        nvidia-settings -a [gpu:${i}]/GPUPowerMizerMode=1
        nvidia-settings -a [gpu:${i}]/GPUFanControlState=1
        nvidia-settings -a [fan:${i}]/GPUTargetFanSpeed=80
        for x in {3..3}
        do
            nvidia-settings -a [gpu:${i}]/GPUGraphicsClockOffset[${x}]=${CLOCK}
            nvidia-settings -a [gpu:${i}]/GPUMemoryTransferRateOffset[${x}]=${MEM}
    done

# x=( $(nvidia-smi -L | awk '{print $2}' | sed 's/\://') )
# for i in "${x[@]}"
# do
#         lim=$(nvidia-smi -q -d POWER -i $i | grep "Max Power Limit" | awk '{print $5}')
#                 echo card $i limit $lim
#             sudo nvidia-smi -i $i -pl $lim
# done
