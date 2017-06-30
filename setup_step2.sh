#!/bin/bash

install_cuda='TRUE'
install_driver='FALSE'

apt-get install -y build-essential xserver-xorg build-essential xserver-xorg dkms libgtk-3-0

if [ $install_driver == 'TRUE' ]
then
mkdir driver
cd driver
wget http://ru.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run
chmod +x NVIDIA-Linux-x86_64-375.66.run
sudo ./NVIDIA-Linux-x86_64-375.66.run
fi

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
sudo ./cuda_8.0.61_375.26_linux-run --silent --toolkit --samples --samplespath=/usr/local/cuda-8.0/samples --override
echo 'System reboot'
echo ''
sleep 5
sudo reboot now
fi

sudo nvidia-xconfig -s -a --force-generate --allow-empty-initial-configuration --cool-bits=32 \
--registry-dwords="PerfLevelSrc=0x2222" --no-sli --connected-monitor="DFP-0"
cat > /etc/X11/xdm/Xsetup << EOF

export PATH=/bin:/usr/bin:/sbin
export HOME=/root
export DISPLAY=:0
xset -dpms
xset s off
xhost +
EOF

echo 'export DISPLAY=:0' >> ~/.bashrc
echo 'export DISPLAY=:0' >> /etc/skel/.bashrc
update-rc.d xdm defaults

sed -i '/Driver/a \ \ \ \ Option         "Interactive" "False"' /etc/X11/xorg.conf

sync && reboot
exit
