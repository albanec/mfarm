#!/bin/bash

### miner setup
mkdir miner
mkdir miner/Claymore_ETH
cd miner/Claymore_ETH
wget https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v9.8/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.8.-.LINUX.tar.gz
tar -xvzf Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v9.8.-.LINUX.tar.gz -C .
cd ..

mkdir EWBF_ZEC
cd EWBF_ZEC
wget https://github.com/nanopool/ewbf-miner/releases/download/v0.3.4b/Zec.miner.0.3.4b.Linux.Bin.tar.gz
tar -xvzf Zec.miner.0.3.4b.Linux.Bin.tar.gz -C .
cd ..
cd ..

exit

