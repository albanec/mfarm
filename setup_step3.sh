#!/bin/bash

COIN='ETH'
USER='rig_admin'
CARD_TYPE='1060'

echo '############################'
echo 'Initial setup: start step 3'
echo '############################'

get-edid -m 0 > edid.bin
cp edid.bin /etc/X11/ 
rm edid.bin
nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration --enable-all-gpus \
  --registry-dwords="PerfLevelSrc=0x2222" --connected-monitor="DFP-0" # --custom-edid="DFP-0:/etc/X11/edid.bin"

### miner setup
mkdir miner
mkdir miner/Claymore_ETH
cd miner/Claymore_ETH
wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v10.0/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz
tar -xvzf Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz -C .
cd ..

mkdir EWBF_ZEC
cd EWBF_ZEC
wget https://github.com/nanopool/ewbf-miner/releases/download/v0.3.4b/Zec.miner.0.3.4b.Linux.Bin.tar.gz
tar -xvzf Zec.miner.0.3.4b.Linux.Bin.tar.gz -C .
cd ..
cd ..

crontab -r
crontab -u $USER -r
echo '@reboot /home/rig_admin/mfarm/pw.sh' $COIN $CARD_TYPE > .temp
crontab .temp
echo '@reboot /home/rig_admin/mfarm/start.sh' $COIN $CARD_TYPE > .temp
crontab -u $USER .temp
rm .temp
chown $USER:$USER * -R
chmod +x *.sh
echo '############################'
echo 'Initial setup: OK'
echo '############################'
reboot now

# exit

