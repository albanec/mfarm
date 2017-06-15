#!/bin/bash

zwal=''
worker='rig2'
email=''
zpool=ssl://zec-eu1.nanopool.org
port=6666
pswd='z'

-zpool $zpool:$port -zwal = $zwal.$worker/$email -zpsw z -ftime 1 -i 6 \
-wd 1 -r 0 -tstop 80 -logfile ~/miner_noappend.log -mport 0
