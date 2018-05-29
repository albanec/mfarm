#!/bin/bash

export DISPLAY=:0
FANCONTROL=0
FAN=80

#if [ $1 == 'ETH' ]
#    then
        nvidia-settings -c :0 \
            -a [gpu:0]/GPUPowerMizerMode=1 \
            -a [gpu:0]/GPUFanControlState=$FANCONTROL \
            -a [fan:0]/GPUTargetFanSpeed=$FAN \
            -a [gpu:0]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:0]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:1]/GPUPowerMizerMode=1 \
            -a [gpu:1]/GPUFanControlState=$FANCONTROL \
            -a [fan:1]/GPUTargetFanSpeed=$FAN \
            -a [gpu:1]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:1]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:2]/GPUPowerMizerMode=1 \
            -a [gpu:2]/GPUFanControlState=$FANCONTROL \
            -a [fan:2]/GPUTargetFanSpeed=$FAN \
            -a [gpu:2]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:2]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:3]/GPUPowerMizerMode=1 \
            -a [gpu:3]/GPUFanControlState=$FANCONTROL \
            -a [fan:3]/GPUTargetFanSpeed=$FAN \
            -a [gpu:3]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:3]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:4]/GPUPowerMizerMode=1 \
            -a [gpu:4]/GPUFanControlState=$FANCONTROL \
            -a [fan:4]/GPUTargetFanSpeed=$FAN \
            -a [gpu:4]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:4]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:5]/GPUPowerMizerMode=1 \
            -a [gpu:5]/GPUFanControlState=$FANCONTROL \
            -a [fan:5]/GPUTargetFanSpeed=$FAN \
            -a [gpu:5]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:5]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:6]/GPUPowerMizerMode=1 \
            -a [gpu:6]/GPUFanControlState=$FANCONTROL \
            -a [fan:6]/GPUTargetFanSpeed=$FAN \
            -a [gpu:6]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:6]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:7]/GPUPowerMizerMode=1 \
            -a [gpu:7]/GPUFanControlState=$FANCONTROL \
            -a [fan:7]/GPUTargetFanSpeed=$FAN \
            -a [gpu:7]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:7]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:8]/GPUPowerMizerMode=1 \
            -a [gpu:8]/GPUFanControlState=$FANCONTROL \
            -a [fan:8]/GPUTargetFanSpeed=$FAN \
            -a [gpu:8]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:8]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:9]/GPUPowerMizerMode=1 \
            -a [gpu:9]/GPUFanControlState=$FANCONTROL \
            -a [fan:9]/GPUTargetFanSpeed=$FAN \
            -a [gpu:9]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:9]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:10]/GPUPowerMizerMode=1 \
            -a [gpu:10]/GPUFanControlState=$FANCONTROL \
            -a [fan:10]/GPUTargetFanSpeed=$FAN \
            -a [gpu:10]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:10]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:11]/GPUPowerMizerMode=1 \
            -a [gpu:11]/GPUFanControlState=$FANCONTROL \
            -a [fan:11]/GPUTargetFanSpeed=$FAN \
            -a [gpu:11]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:11]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:12]/GPUPowerMizerMode=1 \
            -a [gpu:12]/GPUFanControlState=$FANCONTROL \
            -a [fan:12]/GPUTargetFanSpeed=$FAN \
            -a [gpu:12]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:12]/GPUGraphicsClockOffset[2]=130 \
            -a [gpu:13]/GPUPowerMizerMode=1 \
            -a [gpu:13]/GPUFanControlState=$FANCONTROL \
            -a [fan:13]/GPUTargetFanSpeed=$FAN \
            -a [gpu:13]/GPUMemoryTransferRateOffset[2]=900 \
            -a [gpu:13]/GPUGraphicsClockOffset[2]=130
#    fi

#if [ $1 == 'ZEC' ]
#    then
#      CLOCK=160 #160
#      MEM=600 #600
#    fi

exit
