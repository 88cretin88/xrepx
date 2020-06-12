#!/bin/sh
#Author Mikhail Sarvilin
#script for install Arch Linux 
#
#
mkfs.ext2 /dev/sda1 -L boot
mkswap /dev/sda2 -L swap
mkfs.btrfs /dev/sda3 -L root
mkfs.btrfs /dev/sda4 -L home
mount /dev/sda3 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
swapon /dev/sda2
mount -t proc /proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --rbind /dev /mnt/dev
echo "Server = http://mirror.yandex.ru/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel grub net-tools links wget reflector
arch-chroot /mnt pacman -S netctl dialog wpa_supplicant --noconfirm --noprogressbar --quiet
genfstab -pU /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo -e "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "en_US.UTF-8" > /etc/locale.conf
mkinitcpio -p linux
echo "archlinuxsystem" > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
passwd
echo -e "[multilib]i\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
useeradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video,wheel -s /bin/bash tux
passwd tux
systemctl enable dhcpcd
systemctl start dhcpcd
wifi-menu
reflector -l 3 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syu
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
pacman -S xorg-server xorg-xinit xorg-apps mesa-libgl lib32-mesa-libgl xterm xorg-drivers xf86-input-synaptics --noconfirm --noprogressbar --quiet
pacman -S xfce4 xfce4-goodies sddm alsa-utils --noconfirm --noprogressbar --quiet
systemctl enable sddm.service
amixer sset Master unmut
amixer sset 'Master' 50%
pacman -S ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono --noconfirm --noprogressbar --quiet
pacman -S yajl --noconfirm --noprogressbar --quiet
cd ~/Downloads/
wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
tar -xzf package-query.tar.gz
cd package-query/
makepkg
pacman -U package-query-1.1-2-x86_64.pkg.tar.xz --noconfirm --noprogressbar --quiet
cd ~/Downloads/
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
tar -xzf yaourt.tar.gz
cd yaourt/
makepkg
pacman -U yaourt-1.2.2-1-any.pkg.tar.xz --noconfirm --noprogressbar --quiet
pacman -S firefox filezilla cherrytree gimp libreoffice libreoffice-fresh-ru kdenlive audacity pidgin screenfetch mplayer smplayer smplayer-themes qt4 ufw guvcview transmission-qt simplescreenrecorder gparted btrfs-progs f2fs-tools dosfstools ntfs-3g alsa-lib gnome-calculator file-roller p7zip unrar gvfs aspell-ru klavaro gedit xcompmgr --noconfirm --noprogressbar --quiet
cd ~/Downloads
wget https://github.com/ordanax/archinstall/xfce4.tar.gz
tar -xzf xfce4.tar.gz -C /home/tux/.config/xfce4/
rm -rf ~/Downloads/*
echo "xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &" > /home/tux/.Xprofile
exit
umount -R /mnt
reboot
