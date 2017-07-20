#!/bin/bash
########################################################################################################################
# Скрипт для установки зелёных драйверов и CUDA
########################################################################################################################

apt-get install -y build-essential xserver-xorg build-essential xserver-xorg dkms libgtk-3-0 read-edid edid-decode

if [ $STEP == 'driver' ]
then
  echo '----------------'
  echo 'Install driver'
  echo '----------------'
  # mkdir driver
  # cd driver
  # wget http://ru.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
  # chmod +x NVIDIA-Linux-x86_64-375.66.run
  # sudo ./NVIDIA-Linux-x86_64-375.66.run
  add-apt-repository ppa:graphics-drivers/ppa
  apt-get update
  apt-get install nvidia-375 -y
  echo 'cuda' > .temp
  exit
fi

if [ $STEP == 'CUDA' ]
then
  mkdir cuda
  cd cuda
  echo '----------------'
  echo 'Download CUDA'
  echo '----------------'
  echo ''
  # wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  echo '----------------'
  echo 'Install CUDA'
  echo '----------------'
  echo ''
  # chmod +x cuda_8.0.61_375.26_linux-run
  # ./cuda_8.0.61_375.26_linux-run --silent --toolkit --samples --samplespath=/usr/local/cuda-8.0/samples --override
  dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda -y
  chown rig_admin:rig_admin cuda -R 
fi

# nvidia-xconfig -a --force-generate --allow-empty-initial-configuration --cool-bits=32 \
# --registry-dwords="PerfLevelSrc=0x2222" --no-sli --connected-monitor="DFP-0"
nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration --enable-all-gpus \
  --registry-dwords="PerfLevelSrc=0x2222" --connected-monitor="DFP-0" # --custom-edid="DFP-0:/etc/X11/edid.bin"

echo '3' > .temp

exit
