#!/bin/bash
########################################################################################################################
# Скрипт для установки красных майнеров
########################################################################################################################

mkdir miner
mkdir miner/Claymore_ETH
cd miner/Claymore_ETH
wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v9.7/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.7.-.LINUX.tar.gz
tar -xvzf Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.7.-.LINUX.tar.gz -C .
cd ..
mkdir Claymore_ZEC
cd Claymore_ZEC
wget https://github.com/nanopool/ClaymoreZECMiner/releases/download/v12.5/Claymore.s.ZCash.AMD.GPU.Miner.v12.5.-.LINUX.tar.gz
tar -xvzf Claymore.s.ZCash.AMD.GPU.Miner.v12.5.-.LINUX.tar.gz .
cd ..
cd ..

cp start_Claymore_ETH.sh miner/Claymore_ETH/start.sh
cp start_Claymore_ZEC.sh miner/Claymore_ZEC/start.sh

exit

