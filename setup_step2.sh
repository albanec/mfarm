#!/bin/bash
########################################################################################################################
# Скрипт для установки зелёных драйверов и CUDA
########################################################################################################################

DRIVER='TRUE'
DRIVER_VERSION='390'
CUDA='FALSE'

apt-get install -y build-essential xserver-xorg build-essential xserver-xorg dkms libgtk-3-0 read-edid edid-decode

if [ DRIVER == TRUE ]
then
echo '############################'
echo 'Initial setup: step 2 - install DRIVER'
echo '############################'
  # mkdir driver
  # cd driver
  # wget http://ru.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
  # chmod +x NVIDIA-Linux-x86_64-375.66.run
  # ./NVIDIA-Linux-x86_64-375.66.run
  add-apt-repository ppa:graphics-drivers/ppa
  apt-get update
  apt-get install nvidia-$DRIVER_VERSION -y
  reboot now
fi

if [ CUDA == TRUE ]
then
  echo '############################'
  echo 'Initial setup: step 2 - install CUDA'
  echo '############################'
  echo ''
  mkdir cuda
  cd cuda
  # wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  # chmod +x cuda_8.0.61_375.26_linux-run
  # ./cuda_8.0.61_375.26_linux-run --silent --toolkit --samples --samplespath=/usr/local/cuda-8.0/samples --override
  dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda -y
  chown rig_admin:rig_admin cuda -R
  reboot now 
fi

# exit
