#!/bin/bash

## SETUP PARTITIONS
sudo su
  parted -s $disk mklabel gpt
  parted -s --align=optimal $disk mkpart ESP fat32 1MiB 1Gib 
  parted -s $disk set 1 esp on
  #parted -s $disk set 1 bios_grub on
  parted -s --align=optimal $disk mkpart btrfs 1Gib 100%
  parted -a optimal /dev/sda1 mkpart primary 0% 1024MB
# Download stage 3 files

echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
