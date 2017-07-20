#!/bin/bash

# install_cuda='TRUE'
# install_sdk='TRUE'

if [ $install_driver == 'TRUE' ]
then
  tar xf amdgpu-pro-17.10-414273.tar.xz
  cd amdgpu-pro-17.10-414273
  sudo ./amdgpu-pro-install
fi

if [ $install_sdk == 'TRUE' ]
then
  tar xf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2
  sudo ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh
  sudo usermod -a -G video rig_admin
fi

exit
exit
