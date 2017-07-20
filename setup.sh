#!/bin/bash
########################################################################################################################
# Скрипт для ввода в строй зеленых ригов
# запуск от рута !!!

# параметры установки
INT_NAME='enp0s31f6'
INSTALL_KERNEL='FALSE'
INSTALL_DRIVER='TRUE'
INSTALL_CUDA='TRUE'
COIN='ETH'
########################################################################################################################

if ls | grep kernel
then
  INSTALL_KERNEL='FALSE'
fi

if  ls -la | grep -w '.temp' > /dev/null
then
  STEP=$(cat .temp)
else
  STEP=1
fi

case '$STEP' in
  1)
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
  ;;
  driver)
    echo '############################'
    echo 'Initial setup: step 2 - install driver'
    echo '############################'
    source setup_step2.sh
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    sleep 5
    reboot now 
  ;;
  cuda)
    echo '############################'
    echo 'Initial setup: step 2 - install CUDA'
    echo '############################'
    source setup_step2.sh
    echo 3 > .temp
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    sleep 5
    reboot now 
  ;;
  3)
    echo '############################'
    echo 'Initial setup: start step 3'
    echo '############################'
    source setup_step3.sh
    crontab -r
    echo '@reboot /home/rig_admin/mfarm/miner_start.sh' $COIN > .temp
    crontab .temp
    rm .temp
    echo '############################'
    echo 'Initial setup: OK'
    echo '############################'
  ;;
esac

exit