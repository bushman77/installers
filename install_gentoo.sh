#!/bin/bash
sudo su
parted -a optimal /dev/sda1 mkpart primary 0% 4096MB
# Download stage 3 files

echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
