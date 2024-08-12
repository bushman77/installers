#!/bin/bash

## SETUP PARTITIONS
sudo su
emerge --ask app-editors vim
parted -s /dev/sda mklabel gpt
parted -s --align=optimal /dev/sda mkpart ESP fat32 1MiB 1Gib 
parted -s /dev/sda set 1 esp on
parted -a optimal /dev/sda1 mkpart primary 0% 1024MB
  
# Download stage 3 files

echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
