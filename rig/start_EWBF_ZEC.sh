#!/bin/bash

zwal=''
worker='rig2'
email=''
zpool='zec-eu1.nanopool.org:9999'
pswd='z'
port=6666

./miner --server $zpool --user $zwal.$worker/$email --pass $pswd --port $port --log --templimit 80 
