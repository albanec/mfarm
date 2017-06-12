#!/bin/bash

mkdir new_kernel
cd new_kernel
wget kernel.ubuntu.com/~kernel-ppa/mainline/v4.12-rc5/linux-headers-4.12.0-041200rc5-generic_4.12.0-041200rc5.201706112031_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.12-rc5/linux-image-4.12.0-041200rc5-generic_4.12.0-041200rc5.201706112031_amd64.deb
dpkg -i *.deb
update-grub
