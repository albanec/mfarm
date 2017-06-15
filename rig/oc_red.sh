#!/bin/bash

# увеличение скорости кулеров
for n in 0 1 2 3 4 5; do
echo 'Setting fan speed for GPU #'$n' to 80%';
echo 200 > /sys/class/drm/card$n/device/hwmon/hwmon$n/pwm1;
done;

# sleep 10
# разгон
sclk=0
mclk=0
for n in 0 1 2 3 4 5; do
echo 'Overclocking settings for GPU #'$n;
echo $sclk > /sys/class/drm/card$n/device/pp_sclk_od;
echo $mclk > /sys/class/drm/card$n/device/pp_mclk_od;
done;

## оптимизация питания
for n in 0 1 2 3 4 5; do
echo 'Power settings for GPU #'$n;
echo auto > /sys/class/drm/card$n/device/power_dpm_force_performance_level
#echo 6 > /sys/class/drm/card$n/device/pp_dpm_sclk;
done;

exit
