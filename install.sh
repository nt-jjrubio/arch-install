#!/bin/bash

echo "Installing arch linux..."

loadkeys es

# Create partition 200M EFI and EXT4 partition
yes | (
  echo g;
  echo n;
  echo ;
  echo ;
  echo +100M;
  echo t;
  echo 1;
  echo n;
  echo ;
  echo ;
  echo ;
  echo w;
) | fdisk /dev/sda


# todo: Create partitions from script
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot


pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL http://192.168.1.5:8080/chrootInstall.sh)"; 
umount /dev/sda1
umount /dev/sda2

reboot
