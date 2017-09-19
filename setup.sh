#!/bin/bash
########################################################################################################################
# Скрипт для ввода в строй зеленых ригов
# запуск от рута !!!

# параметры установки
INT_NAME='enp0s31f6'
INSTALL_KERNEL='FALSE'
INSTALL_DRIVER='TRUE'
INSTALL_CUDA='FALSE'
COIN='ETH'
USER='rig_admin'
########################################################################################################################

if ls | grep kernel
  then
    INSTALL_KERNEL='FALSE'
  fi
if ls | grep driver
  then
    INSTALL_DRIVER='FALSE'
  fi
if ls | grep cuda
  then
    INSTALL_CUDA='FALSE'
  fi

if  ls -la | grep -w '.temp' > /dev/null
  then
    STEP=$(cat .temp)
  else
    STEP=1
  fi

if [ $STEP == 1 ]
  then
    echo '############################'
    echo 'Initial setup: start step 1'
    echo '############################'
    source setup_step1.sh
    touch .temp
    echo '@reboot /home/rig_admin/mfarm/setup.sh' > .temp
    crontab .temp
    if [ $INSTALL_KERNEL == TRUE ]
      then
        echo 1 > .temp
      else
        echo driver > .temp
      fi
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    sleep 5
    reboot now 
  fi
if [ $STEP == 'driver' ]
  then
    echo '############################'
    echo 'Initial setup: step 2 - install driver'
    echo '############################'
    source setup_step2.sh
    if [ $INSTALL_CUDA == FALSE ]
      then 
        echo 3 > .temp
      else
        echo 'cuda' > .temp
      fi    
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    sleep 5
    reboot now 
  fi
if [ $STEP == 'cuda' ]
  then
    echo '############################'
    echo 'Initial setup: step 2 - install CUDA'
    echo '############################'
    source setup_step2.sh
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    echo '3' > .temp
    sleep 5
    reboot now 
  fi
if [ $STEP == 3 ]
  then
    echo '############################'
    echo 'Initial setup: start step 3'
    echo '############################'
    get-edid -m 0 > edid.bin
    cp edid.bin /etc/X11/ 
    rm edid.bin
    nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration --enable-all-gpus \
      --registry-dwords="PerfLevelSrc=0x2222" --connected-monitor="DFP-0" # --custom-edid="DFP-0:/etc/X11/edid.bin"
    source setup_step3.sh
    crontab -r
    crontab -u $USER -r
    echo '@reboot /home/rig_admin/mfarm/pw.sh' $COIN > .temp
    crontab .temp
    echo '@reboot /home/rig_admin/mfarm/start.sh' $COIN > .temp
    crontab -u $USER .temp
    rm .temp
    chown $USER:$USER * -R
    chmod +x *.sh
    echo '############################'
    echo 'Initial setup: OK'
    echo '############################'
  fi

exit
