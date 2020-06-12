---
title: Заметки
category: Прочее
order: 1
permalink:
post_video: 
post_photo_path: 
comments: true
edit: false
---

## Загрузка и запись на usb.

[https://github.com/ctlos/ctlosiso/releases](https://github.com/ctlos/ctlosiso/releases){:target="_blank"}

Прописать полную ссылку к файлу.

Wget.
```bash
sudo wget -O - https://github.com/ctlos/ctlosiso/releases/download/v1.0.0/*.iso > /dev/sdX && sync
```

Curl.
```bash
sudo curl -L https://github.com/ctlos/ctlosiso/releases/download/v1.0.0/*.iso > /dev/sdX && sync
```

Curl + dd.
```bash
sudo curl -L https://github.com/ctlos/ctlosiso/releases/download/v1.0.0/*.iso | dd bs=4M of=/dev/sdX status=progress && sync
```

---

## Arch установка без носителя (usb).

[wiki.archlinux.org/index.php/Install_from_existing_Linux](https://wiki.archlinux.org/index.php/Install_from_existing_Linux){:target="_blank"}

---

