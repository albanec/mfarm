#!/bin/bash

USER='rig_admin'
COIN=$1

echo '############################'
echo 'Change coin to: ' $COIN
echo '############################'
crontab -r
crontab -u $USER -r
echo '@reboot /home/rig_admin/mfarm/pw.sh' $COIN > .temp
crontab .temp
echo '@reboot /home/rig_admin/mfarm/start.sh' $COIN > .temp
crontab -u $USER .temp
rm .temp
echo '############################'
echo 'Change coin: OK'
echo '############################'

exit