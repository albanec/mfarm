#!/bin/bash
zwal=''
worker='rig2'
email=''
zpool='zec-eu1.nanopool.org:6633'
port=6666
zpswd='z'

./zecminer64 -zpool ssl://$zpool -zwal $zwal.$worker/$email -zpsw $zpswd -ftime 1 -i 6 -tt 75