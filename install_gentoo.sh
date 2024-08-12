#!/bin/bash

## SETUP PARTITIONS
sudo su
emerge --ask app-editors vim
parted -s /dev/sda mklabel gpt
parted -s --align=optimal /dev/sda mkpart ESP fat32 1MiB 1Gib 
parted -s /dev/sda set 1 esp on
parted -a optimal /dev/sda1

mkfs.vfat -F 32 /dev/sda1
mkfs.xfs /dev/sda3

mkswap /dev/sda2
swapon /dev/sda2

mkdir --parents /mnt/gentoo
mkdir --parents /mnt/gentoo/efi
mount /dev/sda3 /mnt/gentoo

# Download stage 3 files
cd /mnt/gentoo
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/20240811T170405Z/stage3-amd64-desktop-systemd-20240811T170405Z.tar.xz
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys 
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev 
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"

mkdir /efi
mount /dev/sda1 /efi 

emerge-webrsync
emerge --sync --quiet


echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license 
