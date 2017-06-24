#!/bin/bash

install_cuda='TRUE'
install_driver='FALSE'

if [ $install_cuda == 'TRUE' ]
then
mkdir cuda
cd cuda
echo 'Download CUDA'
echo ''
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
echo 'Install CUDA'
echo ''
chmod +x cuda_8.0.61_375.26_linux-run
sudo ./cuda_8.0.61_375.26_linux-run
echo 'System reboot'
echo ''
sleep 5
sudo reboot now
fi

if [ $install_driver == 'TRUE' ]
then
mkdir driver
cd driver
wget http://ru.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
chmod +x NVIDIA-Linux-x86_64-375.66.run
sudo ./NVIDIA-Linux-x86_64-375.66.run
fi

exit
