#!/bin/bash

export DISPLAY=:0
FANCONTROL=1
FAN=80

if [ $1 == 'ETH' ]
    then
        nvidia-settings -c :0 \
            -a [gpu:0]/GPUPowerMizerMode=1 \
            -a [gpu:0]/GPUFanControlState=$FANCONTROL \
            -a [fan:0]/GPUTargetFanSpeed=$FAN \
            -a [gpu:0]/GPUMemoryTransferRateOffset[3]=500 \
            -a [gpu:0]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:1]/GPUPowerMizerMode=1 \
            -a [gpu:1]/GPUFanControlState=$FANCONTROL \
            -a [fan:1]/GPUTargetFanSpeed=$FAN \
            -a [gpu:1]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:1]/GPUGraphicsClockOffset[3]=140 \
            -a [gpu:2]/GPUPowerMizerMode=1 \
            -a [gpu:2]/GPUFanControlState=$FANCONTROL \
            -a [fan:2]/GPUTargetFanSpeed=$FAN \
            -a [gpu:2]/GPUMemoryTransferRateOffset[3]=920 \
            -a [gpu:2]/GPUGraphicsClockOffset[3]=130 \
            -a [gpu:3]/GPUPowerMizerMode=1 \
            -a [gpu:3]/GPUFanControlState=$FANCONTROL \
            -a [fan:3]/GPUTargetFanSpeed=$FAN \
            -a [gpu:3]/GPUMemoryTransferRateOffset[3]=850 \
            -a [gpu:3]/GPUGraphicsClockOffset[3]=140 
    fi

#if [ $1 == 'ZEC' ]
#    then
#      CLOCK=160 #160
#      MEM=600 #600
#    fi

exit
