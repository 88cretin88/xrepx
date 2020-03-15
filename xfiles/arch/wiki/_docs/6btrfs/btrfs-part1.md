---
title: Btrfs установка
category: Btrfs
order: 1
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

## Введение в Btrfs.

Установите пакет пользовательских утилит 	btrfs-progs	.
```bash
pacman -S btrfs-progs arch-install-scripts
```

`lsblk` - подсветить все разделы что бы определиться что монтировать.

Так как Btrfs не может содержать swap-файл, необходимо заранее позаботиться о разделе с подкачкой, если он вам нужен.
```bash
mkswap /dev/sda2
```

Создаём файловую систему на разделе. Для разделов от 1ГБ и меньше, чтобы более эффективно использовать пространство, рекомендуется передать ключ -M к параметрам `mkfs.btrfs`.

При желании можно задать лэйбл ключом -L.
```bash
mkfs.btrfs /dev/sda<цифра>
mkfs.btrfs -L "root" /dev/sda<цифра>
```

Теперь монтируем.
```bash
mount /dev/sdb1 /mnt
```

Затем создадим два подтома под корень и домашние каталоги пользователей.
```bash
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
```
```bash
btrfs subvolume list /mnt
```

И отмонтируем корень ФС.
```bash
umount /mnt
```

Для того, чтобы монтировать подтом подобно обычному разделу диска, команде mount нужно указывать опцию subvol.

Монтируем корень.
```bash
mount -o subvol=@,compress=lzo,relatime,space_cache,autodefrag /dev/sdb1 /mnt
```

Так же в параметрах мы указали использовать сжатие (lzo), что даёт прирост экономии места плюс повышает производительность, и дефрагметацию в фоне.

Создаём папку и монтируем в неё наш будущий каталог пользователей.
```bash
mkdir /mnt/home
mount -o subvol=@home,compress=lzo,relatime,space_cache,autodefrag /dev/sdb1 /mnt/home
```

Дальше действуем по вики, т.е. выбираем зеркала и ставим базовую систему. При генерации initramfs mkinitcpio будет ругаться на отсутствие fsck.btrfs - это нормальное явление. Уберём этот хук `fsck` из конфига, т.к. для Btrfs он не требуется.
```bash
nano /etc/mkinitcpio.conf
```

Вот данная строка в файле.
```bash
HOOKS="base udev autodetect modconf block filesystems keyboard"
```

И пересоздадим initramfs.
```bash
mkinitcpio -p linux
```

И ещё момент по поводу загрузчика, не знаю как другие, а grub точно умеет грузиться с Btrfs, так что выбрать лучше именно его. Так же не забудьте установить пакет btrfs-progs и позаботиться о бэкапах.

### Использование btrfs.

Снимки. Монтируем корень ФС.
```bash
mount /dev/sdb1 /mnt
```

Создаём снимок корня системы.
```bash
btrfs subvolume snapshot /mnt/@ /mnt/@_bac
btrfs subvolume snapshot /mnt/@home /mnt/@home_bac

btrfs subvolume list /mnt
```

Каталоги абсолютно идентичны, и пока мы не начнём изменять файлы, снимки места не занимают.

Удаление.
```bash
btrfs subvolume delete /mnt/@
```

Откат: грузимся с live CD, монтируем корень ФС и переименовываем подтома. Так же подтома можно переименовать прямо в рабочей системе, если загрузка удачна.
```bash
mount /dev/sdb1 /mnt
mv /mnt/@ /mnt/@_bad
mv /mnt/@_bac /mnt/@

mv /mnt/@home /mnt/@home_bad
mv /mnt/@home_bac /mnt/@home
```

Либо грузимся как обычно, а в меню grub'а указываем подтом с бэкапом `rootflags=subvol=backup`.

Копирование при записи (CoW). Если использовать команду `cp` с ключом `--reflink=auto`, то копия файла не будет занимать место на диске. И впоследствии, допустим, при изменении скопированного файла, записываться на диск будут только изменённые блоки.

"Онлайн"-проверка ФС. При которой осуществляется чтение всех данных/метаданных с перепроверкой контрольных сумм, при наличии ошибок обнаружение их и исправление по возможности.
```bash
btrfs scrub start -B /
```

Если опустить ключ `-B`, процесс уйдёт в фон, и о ходе выполнения можно будет узнать командой.
```bash
btrfs scrub status /
```

Пример вывода.
```bash
scrub status for 56edc366-a153-4eee-b2a6-471b7066b93d
scrub started at Sat Dec 14 06:37:19 2013 and finished after 3242 seconds
total bytes scrubbed: 222.45GB with 0 errors
```

Рекомендуется проводить проверку регулярно (еженедельно). "Оффлайн" - проверка ФС (на отмонтированном разделе). При отсутствии ошибок утилита возвратит 0.
```bash
btrfs check /dev/sda
```

---

## Установка из существующей системы или с live usb.
```bash
pacman -S btrfs-progs arch-install-scripts
```

`lsblk` - подсветить все разделы что бы определиться что монтировать.

Так как Btrfs не может содержать swap-файл, необходимо заранее позаботиться о разделе с подкачкой, если он вам нужен.
```bash
mkswap /dev/sda2
```

Внимание! это отформатирует весь ваш диск, с потерей данных!
```bash
mkfs.btrfs -f -L WD /dev/sdbX
```

Монтируем.
```bash
mount /dev/sdb /mnt
```

Создадим два подтома под root и домашний каталог пользователя.
```bash
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
```

И отмонтируем корень ФС.
```bash
umount /mnt
```

Монтируем корень.
```bash
mount -o subvol=@,compress=lzo,relatime,space_cache,autodefrag /dev/sdb /mnt
```

Создаём папку и монтируем в неё наш будущий каталог пользователей.
```bash
mkdir /mnt/home
mount -o subvol=@home,compress=lzo,relatime,space_cache,autodefrag /dev/sdb /mnt/home
```

Создаем папку и монтируем boot, если нужно.
```bash
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount -t sysfs none /mnt/sys

swapon /dev/sda2
```

Проверим.
```bash
btrfs subvolume list /mnt
```

Устанавливаем базовые пакеты.
```bash
pacstrap /mnt base xorg-xinit xorg-server grub zsh mc
```

Создаём fstab.
```bash
genfstab -pU /mnt
genfstab -U /mnt >> /mnt/etc/fstab
```
Или.
```bash
genfstab -pU /mnt >> /mnt/etc/fstab
```

Проверяем
```bash
cat /mnt/etc/fstab
```

Входим в систему
```bash
arch-chroot /mnt /bin/zsh
```
Или Debian подобных.
```bash
chroot /mnt /bin/bash
```

Называем компьютер.
```bash
echo ctlos > /etc/hostname
```

Локализация.
```bash
nano /etc/locale.gen
```

Расскомментировать.
```bash
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
```

Сгенерировать локали.
```bash
locale-gen
```

Выберем локаль для системы.
```bash
nano /etc/locale.conf
```
Прописать в `/etc/locale.conf`.
```bash
LANG=ru_RU.UTF-8
LC_MESSAGES=ru_RU.UTF-8
```

Создаём рам-диск mkinitcpio и добавим русскую локаль в консоль.
```bash
nano /etc/mkinitcpio.conf
```

В `/etc/mkinitcpio.conf`, в разделе **HOOKS**, должен быть прописан хук `keymap`, и убрать `fsck`.

В разделе **MODULES** нужно прописать свой драйвер видеокарты: i915 для Intel, radeon для AMD, nouveau для Nvidia.
```bash
mkinitcpio -p linux
```

Задать пароль рута.
```bash
passwd
```

Создать пользователя.
```bash
useradd -m -g users -G wheel,audio,video,storage -s /bin/zsh st
```

И задать ему пароль.
```bash
passwd st
```

Расскомментировать в `/etc/pacman.conf`.
```bash
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Затем выполнить.
```bash
pacman-key --init
pacman-key --populate archlinux
pacman -Syy
```

Установка boot loaderа.
```bash
grub-install /dev/sdb
grub-mkconfig -o /boot/grub/grub.cfg
```

Выбор часового пояса.
```bash
timedatectl set-timezone Europe/Moscow
```

Русский шрифт в консоли.
```bash
nano /etc/vconsole.conf
```

С таким содержимым.
```bash
KEYMAP=ru
FONT=cyr-sun16
```

Настройка sudo.
```bash
EDITOR=nano visudo
```

Дать пользователю привилегии суперпользователя или группе, когда он вводит sudo.
```bash
malody ALL=(ALL) ALL
```
Или.
```bash
%wheel ALL=(ALL) ALL
```
Чтобы не спрашивать пароль у пользователя.
```bash
Defaults:malody      !authenticate
```