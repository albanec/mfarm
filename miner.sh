#!/bin/bash

if [ $1 == 'ETH' ]
  then
    echo '//// Start Claymore miner for ETH only ////'
    ewal=''
    worker='rig1'
    epool='eth-eu1.nanopool.org:9999'
    epool_pswd='x'
    cd miner/Claymore_ETH/
    ./ethdcrminer64 -epool $epool -ewal $ewal.$worker -epsw $epool_pswd -logfile noappend.log -mode 1 -ftime 10
  fi
if [ $1 == 'ETC' ]
  then
    echo '//// Start Claymore miner for ETC only ////'
    ewal=''
    worker='rig1'
    epool='eth-eu1.nanopool.org:19999'
    epool_pswd='x'
    cd miner/Claymore_ETH/
    ./ethdcrminer64 -epool $epool -ewal $ewal.$worker -epsw $epool_pswd -logfile noappend.log -mode 1 -ftime 10
  fi
if [ $1 == 'ZEC' ]
  then
    echo '//// Start EWBF miner for ZEC only ////'
    zwal=''
    worker='rig1'
    zpool='zec-eu1.nanopool.org'
    port=6666
    zpswd='z'
    cd miner/EWBF_ZEC/
    ./miner --server $zpool --user $zwal.$worker --pass $zpswd --port $port --log noappend.log --templimit 80 
  fi
if [ $1 == 'ZEN' ]
  then
    echo '//// Start EWBF miner for ZEN only ////'
    zwal=''
    worker='rig1'
    zpool='eu.zenmine.pro'
    port=9009
    zpswd='x'
    cd miner/EWBF_ZEC/
    ./miner --server $zpool --user $zwal.$worker --pass $zpswd --port $port --log noappend.log --templimit 80 
  fi
if [ $1 == 'ETH_DCR' ]  
  then
    echo '//// Start Claymore miner for ETH and DCR ////'
    ewal=''
    worker='rig1'
    epool='eth-eu1.nanopool.org:9999'
    epool_pswd='x'
    dcri=26
    dpool='stratum+tcp://dcr.suprnova.cc:3252'
    dwal=''
    dpool_pswd='123456'
    cd miner/Claymore_ETH/
    ./ethdcrminer64 -epool $epool -ewal $ewal.$worker -epsw $epool_pswd \
      -dcoin dcr -dcri 26 -dpool $dpool -dwal $dwal -dpsw $dpool_pswd \
      -logfile noappend.log -mode 1 -ftime 10
  fi    
