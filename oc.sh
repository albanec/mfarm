#!/bin/bash

export DISPLAY=:0
CLOCK=120 # 160
MEM=1000 # 2000

#echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#echo 2800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

for i in {0..7}
do
  gpu_temp=$(cat /sys/class/drm/card$i/device/hwmon/hwmon$i/temp1_input)
  echo 1 > /sys/class/drm/card$i/device/hwmon/hwmon$i/pwm1_enable
  if gpu_temp > 60000
    echo 210 > /sys/class/drm/card$i/device/hwmon/hwmon$i/pwm1
  else 
    echo 0 > /sys/class/drm/card$i/device/hwmon/hwmon$i/pwm1_enable
  fi
done
#
exit

