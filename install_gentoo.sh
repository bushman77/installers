#!/bin/bash
sudo su
parted -s /dev/sda mklabel gpt
parted -a optimal /dev/sda1 mkpart primary 0% 1024MB
# Download stage 3 files

echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
