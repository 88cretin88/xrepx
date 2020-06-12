---
title: Рекомендации
category: Конфигурирование системы
order: 2
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

### Установка ядра Linux-zen [Kernels](https://wiki.archlinux.org/index.php/Kernels){:target="_blank"}.

Если у вас nvidia карта, драйвер также нужно заменить `sudo pacman -S nvidia-390xx-dkms`.
```bash
sudo pacman -S linux-zen linux-zen-headers
sudo mkinitcpio -p linux-zen
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

---

### Уменьшение размера журнала логов Systemd.
```bash
sudo nano /etc/systemd/journald.conf
```
Расскомментировать и изменить строку.
```bash
SystemMaxUse=5M
```

---

### Отключаем переодическое увеличение загрузки из-за man-db.service.
```bash
sudo systemctl disable man-db.service
sudo systemctl disable man-db.timer
```