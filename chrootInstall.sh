ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
sed -i 's/#es_ES.UTF-8/es_ES.UTF-8/g'
locale-gen
echo "KEYMAP=es" > /etc/vconsole.conf
echo "Arch" > /etc/hostname

# /etc/hosts/
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hots
echo "127.0.1.1	Arch.localdomain	Arch" >> /etc/hosts

mkinitcpio -p linux
until passwd
do
    echo "Las contraseñas no son iguales"
    sleep 0.5
done
#yes | pacman -S refind neovim
yes | pacman -S neovim networkmanager
systemctl enable NetworkManager

# EFI Boot
bootctl --path=/boot install
echo "title ArchLinux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
#echo "initrd /intel-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=/dev/sda2 rw" >> /boot/loader/entries/arch.conf
#refind-install
exit

