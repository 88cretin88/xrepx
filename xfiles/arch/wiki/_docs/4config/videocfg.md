---
title: Видео Драйвера
category: Конфигурирование системы
order: 1
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

Узнать информацию о видео карте.
```bash
lspci -k | grep -A 2 -E "(VGA|3D)"
```

- xf86-video-amdgpu — новый, свободный драйвер для видеокарт AMD;
- xf86-video-ati — старый свободный драйвер для AMD;
- xf86-video-intel — драйвер для встроенной графики Intel;
- xf86-video-nouveau — свободный драйвер для карт NVIDIA;
- xf86-video-vesa — свободный драйвер, поддерживающий все карты, но с очень ограниченной функциональностью. Для виртуальной машины.
- nvidia — проприетарный драйвер для NVIDIA.

Проприетарные драйвера увеличивают производительность.

Пакеты lib32-* нужно устанавливать только на x86_64 системы, пердварительно раскомментировать репозиторий multilib в `/etc/pacman.conf`.

### Intel.
```bash
sudo pacman -S xf86-video-intel lib32-intel-dri
```

### Nvidia.
```bash
sudo pacman -S nvidia nvidia-settings nvidia-utils opencl-nvidia opencl-headers lib32-nvidia-utils lib32-opencl-nvidia
```

Драйвер nvidia может иметь префикс nvidia-390xx, конкретно для вашей карты, уточняйте на сайте производителя и в Арч-вики.
```bash
sudo pacman -S lib32-opencl-nvidia-390xx lib32-nvidia-390xx-utils opencl-nvidia-390xx nvidia-390xx-utils nvidia-390xx-settings nvidia-390xx
```

Еще возможно потребуется прописать модуль, уточняйте на Арч-вики.
```bash
sudo nano /etc/mkinitcpio.conf
```

Вот эта строка в пустом виде.
```bash
MODULES=()
```

С указанием модуля, для проприетарных драйверов nvidia.
```bash
MODULES=(nvidia)
```

С указанием модуля, для свободных драйверов nvidia xf86-video-nouveau.
```bash
MODULES=(nouveau)
```

Сохранить Ctrl+o, выйти Ctrl+x :).

После изменения модуля необходимо обновить initramfs образ.
```bash
sudo mkinitcpio -p linux
```

### AMD.
```bash
sudo pacman -S xf86-video-ati lib32-ati-dri
```

### Для виртуальной машины.
```bash
sudo pacman -S xf86-video-vesa
```