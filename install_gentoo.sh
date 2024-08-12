#!/bin/bash
sudo su
sudo sfdisk -d /dev/sda > sda.sfdisk
sfdisk -d /dev/sda > sda.sfdisk
# Download stage 3 files

echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
