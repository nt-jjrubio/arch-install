ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "Arch" > /etc/hostname
mkinitcpio -P 
passwd
pacman -S refind
refind-install
exit

