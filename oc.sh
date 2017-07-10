#!/bin/bash
export DISPLAY=:0
CLOCK=200 # 160
MEM=1500 # 2000

echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..5}
    do
        nvidia-smi -i $i -pm 0
        nvidia-smi -i $i -pl 170
        # nvidia-smi -i $i -ac 4004,1911
        nvidia-settings -a -c :0 [gpu:$i]/GPUPowerMizerMode=1
        nvidia-settings -a -c :0 [gpu:$i]/GPUFanControlState=1
        nvidia-settings -a -c :0 [fan:$i]/GPUTargetFanSpeed=80
        nvidia-settings -a -c :0 [gpu:$i]/GPUGraphicsClockOffset[3]=$CLOCK
        nvidia-settings -a -c :0 [gpu:$i]/GPUMemoryTransferRateOffset[3]=$MEM
    done

exit
