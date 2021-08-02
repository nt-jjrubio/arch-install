#!/bin/bash

echo "Installing arch linux..."

loadkeys es

# todo: Create partitions from script
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot


pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL http://192.168.1.51:8080/chrootInstall.sh)"

