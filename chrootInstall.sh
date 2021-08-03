ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "Arch" > /etc/hostname
mkinitcpio -p linux
passwd
#yes | pacman -S refind neovim 
yes | pacman -S neovim network-manager
bootctl --path=/boot install

echo "title ArchLinux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
#echo "initrd /intel-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=/dev/sda2 rw" >> /boot/loader/entries/arch.conf
#refind-install
exit

