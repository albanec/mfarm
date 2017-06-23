#!/bin/bash

install_cuda='TRUE'
install_driver='FALSE'

if [ $install_cuda == 'TRUE' ]
then
mkdir cuda
cd cuda
echo 'Download CUDA'
echo ''
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
echo 'Install CUDA'
echo ''
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo 'System reboot'
echo ''
sleep 5
sudo reboot now
fi

if [ $install_driver == 'TRUE' ]
then
mkdir driver
cd driver

