#!/bin/bash

install_cuda='TRUE'
install_driver='FALSE'

sudo apt-get install -y build-essential xserver-xorg build-essential xserver-xorg dkms libgtk-3-0 read-edid edid-decode

if [ $install_driver == 'TRUE' ]
then
#mkdir driver
#cd driver
#wget http://ru.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
#chmod +x NVIDIA-Linux-x86_64-375.66.run
#sudo ./NVIDIA-Linux-x86_64-375.66.run
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install nvidia-375
fi

if [ $install_cuda == 'TRUE' ]
then
mkdir cuda
cd cuda
echo 'Download CUDA'
echo ''
#wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
echo 'Install CUDA'
echo ''
#chmod +x cuda_8.0.61_375.26_linux-run
#sudo ./cuda_8.0.61_375.26_linux-run --silent --toolkit --samples --samplespath=/usr/local/cuda-8.0/samples --override
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo 'System reboot'
echo ''
sleep 5
sudo reboot now
fi

#sudo nvidia-xconfig -a --force-generate --allow-empty-initial-configuration --cool-bits=32 \
#--registry-dwords="PerfLevelSrc=0x2222" --no-sli --connected-monitor="DFP-0"
sudo nvidia-xconfig -a --cool-bits=31 --allow-empty-initial-configuration --enable-all-gpus \
    --registry-dwords="PerfLevelSrc=0x2222" --connected-monitor="DFP-0" # --custom-edid="DFP-0:/etc/X11/edid.bin"
#sudo get-edid -m 0 > edid.bin
#sudo cp edid.bin /etc/X11/
#sudo rm edid.bin

# cat > /etc/X11/xdm/Xsetup << EOF

#export PATH=/bin:/usr/bin:/sbin
#export HOME=/root
#export DISPLAY=:0
#xset -dpms
#xset s off
#xhost +
#EOF

#echo 'export DISPLAY=:0' >> ~/.bashrc
#echo 'export DISPLAY=:0' >> /etc/skel/.bashrc
#update-rc.d xdm defaults

#sed -i '/Driver/a \ \ \ \ Option         "Interactive" "False"' /etc/X11/xorg.conf

sudo reboot now
exit
