#!/bin/bash
ewal=''
worker=''
email=''
epool='eth-eu1.nanopool.org:9999'
epool_pswd='x'
ethi=16
dpool='stratum+tcp://dcr.suprnova.cc:3252'
dwal=''
dpool_pswd='123456'
#sclk=0
#mclk=0
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

case '$1' in
  ETH)
    ./ethdcrminer64 -epool $epool -ewal $ewal/$worker/$email -epsw $epool_pswd -mode 1 -ftime 10     
  ;;
esac
#
#
#./ethdcrminer64 -epool $epool -ewal $ewal/$worker/$email -epsw $epool_pswd -ethi 16 -etha 2 \
#-dcoin dcr -dcri 30 -dpool $dpool -dwal $dwal -dpsw $dpool_pswd  -asm 1 \
#-wd 1 -r 0 -tstop 80 -logfile ~/miner_noappend.log -mport 0

