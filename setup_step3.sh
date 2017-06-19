#!/bin/bash

### miner setup
cd ~
mkdir miners
mkdir miners/Claymore_ETH_v9.5
mkdir miners/Claymore_ZEC_v12.5
mkdir miners/EWBF_ZEC_0.3.3b
tar -xvzf Claymore_ETH_v9.5.tar.gz -C miners/Claymore_ETH_v9.5/
tar -xvzf Claymore_ZEC_v12.5.tar.gz -C miners/Claymore_ZEC_v12.5/
tar -xvzf EWBF_ZEC_0.3.3b.tar.gz -C miners/EWBF_ZEC_0.3.3b/
chown rig_admin:rig_admin miners -R

cp start_Claymore_ETH.sh miners/Claymore_ETH_v9.5/start.sh
cp start_Claymore_ZEC.sh miners/Claymore_ZEC_v9.5/start.sh
cp start_EWBF_ZEC.sh miners/EWBF_ZEC_0.3.3b/start.sh

