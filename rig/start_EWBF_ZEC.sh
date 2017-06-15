#!/bin/bash

zwal=''
worker='rig2'
email=''
zpool='zec-eu1.nanopool.org:9999'
port=6666
zpswd='z'


./miner --server $zpool --user $zwal.$worker/$email --pass $zpswd --port $port --log --templimit 80 
