#!/bin/bash
export DISPLAY=:0
FANCONTROL=1
FAN=60

if [ $1 == 'ETH' ]
    then
        nvidia-settings -c :0 \
            -a [gpu:0]/GPUPowerMizerMode=1 \
            -a [gpu:0]/GPUFanControlState=$FANCONTROL \
            -a [fan:0]/GPUTargetFanSpeed=$FAN \
            -a [gpu:0]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:0]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:1]/GPUPowerMizerMode=1 \
            -a [gpu:1]/GPUFanControlState=$FANCONTROL \
            -a [fan:1]/GPUTargetFanSpeed=$FAN \
            -a [gpu:1]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:1]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:2]/GPUPowerMizerMode=1 \
            -a [gpu:2]/GPUFanControlState=$FANCONTROL \
            -a [fan:2]/GPUTargetFanSpeed=$FAN \
            -a [gpu:2]/GPUMemoryTransferRateOffset[3]=1150 \
            -a [gpu:2]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:3]/GPUPowerMizerMode=1 \
            -a [gpu:3]/GPUFanControlState=$FANCONTROL \
            -a [fan:3]/GPUTargetFanSpeed=$FAN \
            -a [gpu:3]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:3]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:4]/GPUPowerMizerMode=1 \
            -a [gpu:4]/GPUFanControlState=$FANCONTROL \
            -a [fan:4]/GPUTargetFanSpeed=$FAN \
            -a [gpu:4]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:4]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:5]/GPUPowerMizerMode=1 \
            -a [gpu:5]/GPUFanControlState=$FANCONTROL \
            -a [fan:5]/GPUTargetFanSpeed=$FAN \
            -a [gpu:5]/GPUMemoryTransferRateOffset[3]=720 \
            -a [gpu:5]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:6]/GPUPowerMizerMode=1 \
            -a [gpu:6]/GPUFanControlState=$FANCONTROL \
            -a [fan:6]/GPUTargetFanSpeed=$FAN \
            -a [gpu:6]/GPUMemoryTransferRateOffset[3]=320 \
            -a [gpu:6]/GPUGraphicsClockOffset[3]=130
    fi

#if [ $1 == 'ZEC' ]
#    then
#      CLOCK=160 #160
#      MEM=600 #600
#    fi

exit
