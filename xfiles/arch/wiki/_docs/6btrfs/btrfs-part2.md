---
title: Btrfs перенос
category: Btrfs
order: 2
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

## Перенос снапшотов на раздел btrfs.
```bash
pacman -S rsync btrfs-progs arch-install-scripts
```

`lsblk` - подсветить все разделы что бы определиться что монтировать.

Монтируем.
```bash
mount /dev/sda6 /mnt
```

Создадим три подтома root, домашний каталог пользователя и подтом для хранения.
```bash
btrfs subvolume create /mnt/@_root
btrfs subvolume create /mnt/@_home
btrfs subvolume create /mnt/@_snapshots

btrfs subvolume list /mnt
```

Для переноса смонтируйте резервную систему и перенесите ее.
```bash
mkdir /mnt/dump
mount /dev/sdb1 /mnt/dump
```

```bash
rsync -aAXv --delete --delete-excluded --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/var/lib/pacman/sync/*","/var/cache/*","/var/tmp/*","/boot/*","/home/*"} /mnt/dump/@/* /mnt/@_root/
```

```bash
rsync -aAXv --delete --delete-excluded --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/var/lib/pacman/sync/*","/var/cache/*","/var/tmp/*","/boot/*","/home/*"} /mnt/dump/@home/* /mnt/@_home/
```

И отмонтируем корень ФС.
```bash
umount /mnt
rm -rf /mnt/dump
```

Чтобы монтировать подтом подобно обычному разделу диска, команде mount нужно указывать опцию subvol=PATH. PATH - путь относительно корня ФС. Монтируем корень.
```bash
mount -o subvol=@_root,compress=lzo,relatime,space_cache,autodefrag /dev/sda6 /mnt
```

What are the recommended options for installing on a pendrive, a SD card or a slow SSD drive? In `/etc/fstab` См. https://wiki.debian.org/Btrfs.

```bash
/dev/sdaX / btrfs x-systemd.device-timeout=0,noatime,compress=lzo,commit=0,ssd_spread,autodefrag 0 0
UUID=<the_device_uuid> /mount/point/ btrfs noauto,compress=lzo,noatime,autodefrag 0 0
```

Так же в параметрах указано сжатие lzo, что даёт прирост экономии места + повышает производительность, и дефрагметацию в фоне. Создаём папку и монтируем в неё наш будущий каталог пользователей. Если boot раздел отдеольно, нужно его тоже смонтироват в `/mnt/boot`.

Если нужно `mkdir /mnt/home`.
```bash
mount -o subvol=@_home,compress=lzo,relatime,space_cache,autodefrag /dev/sda6 /mnt/home
```

Если нужно `mkdir /mnt/snapshots`.
```bash
mount -o subvol=@_snapshots,compress=lzo,relatime,space_cache,autodefrag /dev/sda6 /mnt/snapshots

mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount -t sysfs none /mnt/sys

swapon /dev/sda2
```

Теперь нужно проинициализировать систему. Редактируем FSTAB, или запускаем genfstab.
```bash
rm /mnt/etc/fstab
genfstab -pU /mnt > /mnt/etc/fstab
```

Переходим в нашу новую систему.
```bash
arch-chroot /mnt /bin/zsh
```
Или Debian подобных.
```bash
chroot /mnt /bin/bash
pacman -Syy
```

Перегенерироваь файловую систему с помощью mkinicpio.
```bash
mkinitcpio -p linux
```

Установить загрузчик GRUB2 и сконфигурировать его.
```bash
grub-install /dev/sdХ
grub-mkconfig -o /boot/grub/grub.cfg
```

`exit` или "Ctrl + D" выйти из chroot.

Теперь  нужно все размонтировать.
```bash
umount /mnt/home
umount /mnt/snapshots
umount /mnt
reeboot
```

---

## Снапшот на другой раздел/диск.

Монтируем основной раздел.
```bash
mkdir /mnt/arch
mount /dev/sda6 /mnt/arch
```

Монтируем раздел/диск для сброса снапшота.
```bash
mkdir /mnt/other
mount /dev/sdb1 /mnt/other
```

Создаем снапшоты.
```bash
btrfs subvolume snapshot -r /mnt/arch/@ /mnt/arch/@_BACKUP
btrfs subvolume snapshot -r /mnt/arch/@home /mnt/arch/@home_BACKUP
```

Сбрасываем все из кэша на диск.
```bash
sync
```

Просмотрим листинг.
```bash
btrfs subvolume list /mnt/arch
```

Переносим снапшоты.
```bash
btrfs send /mnt/arch/@_BACKUP | btrfs receive /mnt/other/
btrfs send /mnt/arch/@home_BACKUP | btrfs receive /mnt/other/
```

Просмотрим листинг.
```bash
btrfs subvolume list /mnt/other
```

Удаляем, если нужно.
```bash
btrfs subvolume delete /mnt/arch/@_BACKUP
btrfs subvolume delete /mnt/arch/@home_BACKUP
```

Отмонтируем.
```bash
umount /mnt/arch
umount /mnt/other
```

Восстановление в обратном порядке с live-usb, или с другой системы. Монтируем раздел для восстановления поврежденный и раздел с backup.
```bash
mkdir /mnt/backup
mount /dev/sdb1 /mnt
mount /dev/sda6 /mnt/backup
```

Просмотрим листинг.
```bash
btrfs subvolume list /mnt/backup
```

Переносим снапшоты.
```bash
btrfs send /mnt/backup/@_BACKUP | btrfs receive /mnt/
btrfs send /mnt/backup/@home_BACKUP | btrfs receive /mnt/
```

Просмотрим листинг.
```bash
btrfs subvolume list /mnt
```

Переименуем.
```bash
mv /mnt/@_BACKUP /mnt/@
mv /mnt/@home_BACKUP /mnt/@home
```

Отмонтируем.
```bash
umount /mnt/backup
umount /mnt
rmdir /mnt/backup
```

Монтируем файловую систему.
```bash
mount -o subvol=@,compress=lzo,relatime,space_cache,autodefrag /dev/sdb1 /mnt
ls /mnt
mkdir /mnt/home
mount -o subvol=@home,compress=lzo,relatime,space_cache,autodefrag /dev/sdb1 /mnt/home
```

Если boot раздел отдеольно, то нужно его тоже смотнтироват в /mnt/boot  + все другие subvolume.
```bash
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount -t sysfs none /mnt/sys

swapon /dev/sdb2
```

Редактируем FSTAB, или запускаем genfstab.
```bash
rm /mnt/etc/fstab
genfstab -pU /mnt > /mnt/etc/fstab
```

Переходим в нашу новую систему.
```bash
arch-chroot /mnt
```
Или.
```bash
arch-chroot /mnt /bin/zsh
```

Перегенерироваь.
```bash
mkinitcpio -p linux
```

Установить загрузчик GRUB2 и сконфигурировать его.
```bash
grub-install /dev/sdХ
grub-mkconfig -o /boot/grub/grub.cfg
```

`exit` или "Ctrl + D" выйти из chroot.

Теперь  нужно все размонтировать.
```bash
umount /mnt/home
umount /mnt
reeboot
```