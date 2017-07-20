#!/bin/bash
########################################################################################################################
# Скрипт для ввода в строй красных ригов
# запуск от рута !!!

# параметры установки
int_name='enp0s31f6'
install_kernel='FALSE'
install_driver='TRUE'
install_sdk='TRUE'
coin='ETH'
########################################################################################################################

if ls | grep kernel
then
  install_kernel='FALSE'
fi

if  ls -la | grep -w '.temp' > /dev/null
then
  step=$(cat .temp)
else
  step=1
fi

case '$step' in
  1)
    echo '############################'
    echo 'Initial setup: start step 1'
    echo '############################'
    source setup_step1.sh
    touch .temp
    echo '@reboot /home/rig_admin/mfarm/setup.sh' > .temp
    crontab .temp
    if [ $install_kernel == TRUE ]
    then
      echo 1 > .temp
    else
      echo 2 > .temp
    fi
    echo '--------------------'
    echo 'System reboot'
    echo '--------------------'    
    sleep 5
    reboot now 
  ;;
  2)
    echo '############################'
    echo 'Initial setup: start step 2'
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
    rm .temp
    echo '############################'
    echo 'Initial setup: OK'
    echo '############################'
  ;;
esac

exit
