---
title: Установка доп. программ
category: Дополнительные пакеты
order: 1
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

> Некоторые пояснения и рекомендации по использованию.

#### Содержание статьи:
- [Сборка пакетов](/wiki/3packages/other-pkg/#сборка-пакетов-из-исходников)
- [Discord](/wiki/3packages/other-pkg/#установка-discord)
- [Virtualbox](/wiki/3packages/other-pkg/#virtualbox)
- [Steam](/wiki/3packages/other-pkg/#steam)
- [Установка и запуск Tor](/wiki/3packages/other-pkg/#установка-и-запуск-tor)
- [Bluetooth](/wiki/3packages/other-pkg/#bluetooth)
- [Офисные пакеты](/wiki/3packages/other-pkg/#офисные-пакеты)
- [Принтеры](/wiki/3packages/other-pkg/#принтеры)

## Сборка пакетов из исходников.

Создать кваталог `~/.build` и перейти в него.
```bash
mkdir ~/.build && cd ~/.build
```

Найти нужный пакет на сайте [aur.archlinux.org](https://aur.archlinux.org){:target="_blank"} и загрузить snapshot.
```bash
wget https://aur.archlinux.org/cgit/aur.git/snapshot/gtk3-mushrooms.tar.gz
```

Распаковываем, переходим в каталог, собираем пакет и устанавливаем.
```bash
tar -xvzf gtk3-mushrooms.tar.gz
cd gtk3-mushrooms
makepkg -sri
```

Если вылазят ошибки ключей, можно проигнорировать.
```bash
makepkg -s --skippgpcheck
```

После сборки появится пакет с расширением `имя.pkg.tar.xz` Установить командой.
```bash
sudo pacman -U имя.pkg.tar.xz
```

---

## Установка discord.

Discord требует зависимости `libc++`, для которых необходим ключ gpg. О ключах смотрите [тут](/wiki/1install/install-ctlos/#проверка-iso-образа){:target="_blank"}. В терминале покажется ключ для импорта, если yay не предложит его импортировать, то.

```bash
gpg --recv keys номер_ключа
yay -S libc++
yay -S discord
```

Или игнорируем проверку gpg.
```bash
yay -S --mflags "--nocheck --skippgpcheck" libc++
```

Второй способ, [Flatpak](/wiki/1install/pkg-manager/#еще-один-из-немногих-иенеджеров-flatpak){:target="_blank"}.

```bash
flatpak install --user flathub com.discordapp.Discord
```

---

## Virtualbox

Виртуалка от GNOME.
```
sudo pacman -S gnome-boxes
```

[Arch Wiki Virtualbox](https://wiki.archlinux.org/index.php/VirtualBox_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)){:target="_blank"}.

```bash
sudo pacman -S virtualbox
sudo pacman -S virtualbox-host-modules-arch
sudo pacman -S linux-headers

sudo modprobe vboxdrv
sudo gpasswd -a имя_пользователя vboxusers
```

Общая папка. На машине.
```
mkdir ~/vboxshare
```

Общая папка. На виртуалке.
```bash
mkdir ~/vboxshare
sudo mount -t vboxsf -o rw,uid=1000,gid=1000 vboxshare vboxshare
```

Настройка гостевых дополнений на виртуалке.
```bash
sudo pacman -S virtualbox-guest-utils linux-headers
sudo pacman -S virtualbox-guest-modules-arch
sudo pacman -S virtualbox-guest-iso
```

---

## Steam
Необходимо раскомментировать репозиторий **multilib** в `/etc/pacman.conf`
```bash
sudo pacman -S steam ttf-liberation lib32-alsa-plugins lib32-curl
```

[wiki.archlinux.org](https://wiki.archlinux.org/index.php/Steam_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)){:target="_blank"}.

Или установите Steam через [Flatpak](/wiki/1install/pkg-manager/#еще-один-из-немногих-иенеджеров-flatpak){:target="_blank"}.

---

## Установка и запуск Tor.
```bash
sudo pacman -S tor torsocks
```

Запуск, остановка сервиса tor.
```bash
sudo systemctl start tor
sudo systemctl stop tor
```

Запуск через tor.
```bash
torify zsh
torify ssh user@blabla -p 22
```

Проверка ip.
```bash
curl --max-time 10 -w '\n' http://ident.me
```

В firefox используйте расширение FoxyProxy.

> В настройках расширения, Добавить новый SOCKS4, ip: 127.0.0.1, port: 9050

Chromium запустите с флагом.

```bash
chromium --proxy-server='socks://127.0.0.1:9050' &
```

Если нужно отредактируйте сервис.

```bash
sudo nano /usr/lib/systemd/system/tor.service
```

```bash
[Service]
User=root
Group=root
Type=simple
```

```bash
sudo chown -R root:root /var/lib/tor/
sudo systemctl daemon-reload
sudo systemctl restart tor
```

---

## Bluetooth.
```bash
sudo pacman -S blueman bluez-utils pulseaudio-bluetooth
sudo systemctl enable bluetooth.service
```

---

## Офисные пакеты.

Wps office.
```bash
yay -S wps-office ttf-wps-fonts wps-office-extension-russian-dictionary --noconfirm
```

Libre office.
```bash
yay -S libreoffice-fresh libreoffice-fresh-ru papirus-libreoffice-theme --noconfirm
```

Openoffice.
```bash
yay -S openoffice openoffice-ru-bin --noconfirm
```

Onlyoffice.
```bash
yay -S onlyoffice-bin --noconfirm
```

---

## Принтеры.
```bash
sudo pacman -S cups cups-pdf cups-pk-helper system-config-printer
sudo systemctl enable org.cups.cupsd.service
```