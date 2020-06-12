---
title: Установка Ctlos Linux
category: Установка
permalink:
order: 1
post_video: 
post_photo_path: 
comments: true
edit: true
---
Скачайте iso образ: [https://ctlos.github.io/get](https://ctlos.github.io/get "Скачать Ctlos Linux"){:target="_blank"}

## Запись iso образа на usb накопитель.

Предварительно отформатируйте usb накопитель в fat32, например в **gparted**.

### Программы для записи iso образа.

#### Linux.

Форматирование usb.
```bash
sudo mkfs.vfat /dev/sdX -I
```

Запись образа dd.
```bash
sudo dd bs=4M if=ctlos.iso of=/dev/sdX status=progress && sync
```

#### Кросплатформенные (Linux, Windows).

[https://etcher.io/](https://etcher.io/ "https://etcher.io/"){:target="_blank"}

#### Windows.

Rufus: [https://rufus.akeo.ie/](https://rufus.akeo.ie/ "https://rufus.akeo.ie/"){:target="_blank"}

## Проверка ISO образа.

### Проверка контрольных сумм в Windows.

[raylin.wordpress.com](http://raylin.wordpress.com/downloads/md5-sha-1-checksum-utility/){:target="_blank"}

### В Linux. Проверка MD5.  
`md5sum ctlos_xfce_1.0.0_20181102.iso`

#### Проверка  SHA256.  
`sha256sum ctlos_xfce_1.0.0_20181102.iso`

#### GPG.  
`sudo pacman -S gnupg`

#### Импорт ключа и проверка образа.
```bash
gpg --keyserver keys.gnupg.net --recv-keys 98F76D97B786E6A3
gpg --verify ctlos_xfce_1.0.0_20181102.iso.sig ctlos_xfce_1.0.0_20181102.iso
```

Подробнее о [GnuPG](/wiki/5other/gnupg/){:target="_blank"}.

На этом проверка образа закончена. Я привел несколько способов проверки, можите использовать любой, или все сразу.

## Установка.
<!-- <div class="embed-responsive embed-responsive-16by9">
	<iframe src="https://www.youtube.com/embed/xaaAoakklfQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div> -->

Выбор языка интерфейса.
![Ctlos step 1](/wiki/images/1install/install-ctlos/1.png)

Выбор местоположения.
![Ctlos step 2](/wiki/images/1install/install-ctlos/2.png)

**Внимание!** Во избежания дальнейших проблем, на этапе установки выбирайте раскладку **English (US) — По умолчанию**. После установки будет 2 раскладки **ru,us** по **alt+shift**.
![Ctlos step 3](/wiki/images/1install/install-ctlos/3.png)

Разметка диска.
![Ctlos step 4](/wiki/images/1install/install-ctlos/4.png)

Создание пользователя.
![Ctlos step 5](/wiki/images/1install/install-ctlos/5.png)

Проверяем данные, можно вернуться и исправить, если что-то не так.
![Ctlos step 6](/wiki/images/1install/install-ctlos/6.png)

Процесс установки.
![Ctlos step 7](/wiki/images/1install/install-ctlos/7.png)

Готово!
![Ctlos step 8](/wiki/images/1install/install-ctlos/8.png)

Выбор в меню Grub.
![Ctlos step 9](/wiki/images/1install/install-ctlos/9.png)

Менеджер входа(LightDm), в правом верхнем углу можно выбрать сессию, если присутствуют другие Окружения(DE), или Оконные менеджеры(WM). На данном скрине Xfce, она единственная и по умолчанию ничего можно не выбирать.
![Ctlos step 10](/wiki/images/1install/install-ctlos/10.png)

Вот и все! Спасибо за скрины пользователю **breadandbutter** с nnm-club.me
![Ctlos step 11](/wiki/images/1install/install-ctlos/11.png)