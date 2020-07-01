
<!-- nav -->
# Table of Contents

- [Table of Contents](#Table-of-Contents)
- [Установка Arch Linux](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Arch-Linux)
  - [Arch Linux](#Arch-Linux)
  - [Создание образа](#%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%B0)
  - [Изменяем приоритет загрузки в BIOS/UEFI](#%D0%98%D0%B7%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC-%D0%BF%D1%80%D0%B8%D0%BE%D1%80%D0%B8%D1%82%D0%B5%D1%82-%D0%B7%D0%B0%D0%B3%D1%80%D1%83%D0%B7%D0%BA%D0%B8-%D0%B2-BIOSUEFI)
  - [Начало установки](#%D0%9D%D0%B0%D1%87%D0%B0%D0%BB%D0%BE-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8)
  - [Настройка сети](#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D1%81%D0%B5%D1%82%D0%B8)
  - [Выбор файловой системы](#%D0%92%D1%8B%D0%B1%D0%BE%D1%80-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D0%BE%D0%B9-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B)
  - [Размечаем диск](#%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%87%D0%B0%D0%B5%D0%BC-%D0%B4%D0%B8%D1%81%D0%BA)
  - [Вариант 1: LVM](#%D0%92%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82-1-LVM)
  - [Вариант 2: Btrfs](#%D0%92%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82-2-Btrfs)
  - [Устанавливаем ядро](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D1%8F%D0%B4%D1%80%D0%BE)
  - [Генерируем fstab](#%D0%93%D0%B5%D0%BD%D0%B5%D1%80%D0%B8%D1%80%D1%83%D0%B5%D0%BC-fstab)
  - [arch-chroot](#arch-chroot)
  - [Настраиваем дату и локаль](#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%B0%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D0%B4%D0%B0%D1%82%D1%83-%D0%B8-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C)
  - [Прописываем хосты](#%D0%9F%D1%80%D0%BE%D0%BF%D0%B8%D1%81%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC-%D1%85%D0%BE%D1%81%D1%82%D1%8B)
  - [Initramfs](#Initramfs)
  - [Ставим пакеты](#%D0%A1%D1%82%D0%B0%D0%B2%D0%B8%D0%BC-%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D1%8B)
  - [Пользователи](#%D0%9F%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D0%B8)
  - [Установка grub](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-grub)
  - [Ставим Gnome](#%D0%A1%D1%82%D0%B0%D0%B2%D0%B8%D0%BC-Gnome)
  - [Завершение установки](#%D0%97%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%B8%D0%B5-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8)
- [man & help](#man--help)
- [Типы файлов в выводе ls и других стандартных команд](#%D0%A2%D0%B8%D0%BF%D1%8B-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2-%D0%B2-%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B5-ls-%D0%B8-%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D1%85-%D1%81%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D1%8B%D1%85-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4)
- [Пакетные менеджеры](#%D0%9F%D0%B0%D0%BA%D0%B5%D1%82%D0%BD%D1%8B%D0%B5-%D0%BC%D0%B5%D0%BD%D0%B5%D0%B4%D0%B6%D0%B5%D1%80%D1%8B)
- [Нужные пакеты](#%D0%9D%D1%83%D0%B6%D0%BD%D1%8B%D0%B5-%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D1%8B)
- [Заменяем ядро на стабильное](#%D0%97%D0%B0%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC-%D1%8F%D0%B4%D1%80%D0%BE-%D0%BD%D0%B0-%D1%81%D1%82%D0%B0%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5)
- [Масштабировавние 150% как в Windows](#%D0%9C%D0%B0%D1%81%D1%88%D1%82%D0%B0%D0%B1%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%B2%D0%BD%D0%B8%D0%B5-150-%D0%BA%D0%B0%D0%BA-%D0%B2-Windows)
- [Расширения для Gnome](#%D0%A0%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B4%D0%BB%D1%8F-Gnome)
- [Пользовательские сочетания клавиш](#%D0%9F%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D1%81%D0%BA%D0%B8%D0%B5-%D1%81%D0%BE%D1%87%D0%B5%D1%82%D0%B0%D0%BD%D0%B8%D1%8F-%D0%BA%D0%BB%D0%B0%D0%B2%D0%B8%D1%88)
- [Запуск исполняемых файлов по двойному клику в Nautilus](#%D0%97%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D0%BD%D1%8F%D0%B5%D0%BC%D1%8B%D1%85-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2-%D0%BF%D0%BE-%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%BC%D1%83-%D0%BA%D0%BB%D0%B8%D0%BA%D1%83-%D0%B2-Nautilus)
- [Добавляем новые действия в контекстное Nautilus](#%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC-%D0%BD%D0%BE%D0%B2%D1%8B%D0%B5-%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D1%8F-%D0%B2-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%BA%D1%81%D1%82%D0%BD%D0%BE%D0%B5-Nautilus)
- [Шаблоны файлов](#%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD%D1%8B-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2)
- [Гибернация](#%D0%93%D0%B8%D0%B1%D0%B5%D1%80%D0%BD%D0%B0%D1%86%D0%B8%D1%8F)
- [RAID](#RAID)
- [Права](#%D0%9F%D1%80%D0%B0%D0%B2%D0%B0)
- [Монтирование](#%D0%9C%D0%BE%D0%BD%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)
- [Добавляем путь в PATH](#%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC-%D0%BF%D1%83%D1%82%D1%8C-%D0%B2-PATH)
- [bin в домашнем каталоге](#bin-%D0%B2-%D0%B4%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B5%D0%BC-%D0%BA%D0%B0%D1%82%D0%B0%D0%BB%D0%BE%D0%B3%D0%B5)
- [Монтируем Windows разделы](#%D0%9C%D0%BE%D0%BD%D1%82%D0%B8%D1%80%D1%83%D0%B5%D0%BC-Windows-%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D1%8B)
- [Шрифты](#%D0%A8%D1%80%D0%B8%D1%84%D1%82%D1%8B)
- [Emoji](#Emoji)
- [Спецсимволы](#%D0%A1%D0%BF%D0%B5%D1%86%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D1%8B)
- [Сетевые интерфесы](#%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D1%8B%D0%B5-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D1%81%D1%8B)
- [Блокируем сайты с рекламой через hosts](#%D0%91%D0%BB%D0%BE%D0%BA%D0%B8%D1%80%D1%83%D0%B5%D0%BC-%D1%81%D0%B0%D0%B9%D1%82%D1%8B-%D1%81-%D1%80%D0%B5%D0%BA%D0%BB%D0%B0%D0%BC%D0%BE%D0%B9-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-hosts)
- [Информация о железе](#%D0%98%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D1%8F-%D0%BE-%D0%B6%D0%B5%D0%BB%D0%B5%D0%B7%D0%B5)
- [Редактирование DConf](#%D0%A0%D0%B5%D0%B4%D0%B0%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-DConf)
- [ZSH](#ZSH)
  - [Установка ZSH](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-ZSH)
  - [Oh My Zsh](#Oh-My-Zsh)
  - [Темы Oh My Zsh!](#%D0%A2%D0%B5%D0%BC%D1%8B-Oh-My-Zsh)
    - [Bullet Train for oh-my-zsh](#Bullet-Train-for-oh-my-zsh)
    - [Jovial](#Jovial)
    - [Powerlevel10k](#Powerlevel10k)
  - [Подробнее про ZSH](#%D0%9F%D0%BE%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%B5%D0%B5-%D0%BF%D1%80%D0%BE-ZSH)
- [Разноцветный cat](#%D0%A0%D0%B0%D0%B7%D0%BD%D0%BE%D1%86%D0%B2%D0%B5%D1%82%D0%BD%D1%8B%D0%B9-cat)
- [Цветовые схемы для терминала](#%D0%A6%D0%B2%D0%B5%D1%82%D0%BE%D0%B2%D1%8B%D0%B5-%D1%81%D1%85%D0%B5%D0%BC%D1%8B-%D0%B4%D0%BB%D1%8F-%D1%82%D0%B5%D1%80%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B0)
- [Бекап системы](#%D0%91%D0%B5%D0%BA%D0%B0%D0%BF-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B)
- [asdf-vm](#asdf-vm)
- [NVM](#NVM)
- [Настройка Docker](#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-Docker)
- [Настройка Visual Code](#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-Visual-Code)
- [LVM](#LVM)
- [Btrfs](#Btrfs)
- [Snapper](#Snapper)
- [Timeshift](#Timeshift)
- [Логи](#%D0%9B%D0%BE%D0%B3%D0%B8)
- [Установка и настройка Postgres](#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-Postgres)
- [Мониторинг процессов](#%D0%9C%D0%BE%D0%BD%D0%B8%D1%82%D0%BE%D1%80%D0%B8%D0%BD%D0%B3-%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81%D0%BE%D0%B2)
- [systemd](#systemd)
- [Git](#Git)
- [Работаем с github через ssh](#%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D0%B5%D0%BC-%D1%81-github-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-ssh)
- [Tor Service](#Tor-Service)
- [Менеджер паролей pass](#%D0%9C%D0%B5%D0%BD%D0%B5%D0%B4%D0%B6%D0%B5%D1%80-%D0%BF%D0%B0%D1%80%D0%BE%D0%BB%D0%B5%D0%B9-pass)
- [Частые проблемы](#%D0%A7%D0%B0%D1%81%D1%82%D1%8B%D0%B5-%D0%BF%D1%80%D0%BE%D0%B1%D0%BB%D0%B5%D0%BC%D1%8B)
  - [Система не грузится дальше rootfs](#%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0-%D0%BD%D0%B5-%D0%B3%D1%80%D1%83%D0%B7%D0%B8%D1%82%D1%81%D1%8F-%D0%B4%D0%B0%D0%BB%D1%8C%D1%88%D0%B5-rootfs)
  - [Grub Rescue](#Grub-Rescue)
  - [Случайно нажали Ctrl + Alt + F* и экран стал темным](#%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D0%BE-%D0%BD%D0%B0%D0%B6%D0%B0%D0%BB%D0%B8-Ctrl--Alt--F-%D0%B8-%D1%8D%D0%BA%D1%80%D0%B0%D0%BD-%D1%81%D1%82%D0%B0%D0%BB-%D1%82%D0%B5%D0%BC%D0%BD%D1%8B%D0%BC)
  - [Что делать, если каталоги открываются в VSCode?](#%D0%A7%D1%82%D0%BE-%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C-%D0%B5%D1%81%D0%BB%D0%B8-%D0%BA%D0%B0%D1%82%D0%B0%D0%BB%D0%BE%D0%B3%D0%B8-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D0%B2%D0%B0%D1%8E%D1%82%D1%81%D1%8F-%D0%B2-VSCode)
  - [Enter password to unlock your login keyring](#Enter-password-to-unlock-your-login-keyring)
- [Справка по командам и т.д.](#%D0%A1%D0%BF%D1%80%D0%B0%D0%B2%D0%BA%D0%B0-%D0%BF%D0%BE-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%B0%D0%BC-%D0%B8-%D1%82%D0%B4)
  - [Cheat.sh](#Cheatsh)
  - [Marker](#Marker)
  - [TLDR](#TLDR)
- [Шпаргалка по командам Shell](#%D0%A8%D0%BF%D0%B0%D1%80%D0%B3%D0%B0%D0%BB%D0%BA%D0%B0-%D0%BF%D0%BE-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%B0%D0%BC-Shell)
- [i3: Введение](#i3-%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5)
- [i3: Установка и настройка](#i3-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)
- [XTerm](#XTerm)
- [Termite: горячие клавиши](#Termite-%D0%B3%D0%BE%D1%80%D1%8F%D1%87%D0%B8%D0%B5-%D0%BA%D0%BB%D0%B0%D0%B2%D0%B8%D1%88%D0%B8)
- [Termite: цветовые схемы](#Termite-%D1%86%D0%B2%D0%B5%D1%82%D0%BE%D0%B2%D1%8B%D0%B5-%D1%81%D1%85%D0%B5%D0%BC%D1%8B)
- [i3: заставка lockscreen](#i3-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0-lockscreen)
- [i3: сохранение/восстановление рабочего пространства](#i3-%D1%81%D0%BE%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%D0%B2%D0%BE%D1%81%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D1%80%D0%B0%D0%B1%D0%BE%D1%87%D0%B5%D0%B3%D0%BE-%D0%BF%D1%80%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D1%81%D1%82%D0%B2%D0%B0)
<!-- /nav -->

# Установка Arch Linux

## Arch Linux

***Arch Linux*** ‒ это один из немногих дистрибутивов Linux, использующих модель роллинг-релизов. Это означает, что в нем доступны самые последние версии пакетов. Это одновременно является его как преимуществом так и недостатком. Пересесть на него меня заставила необходимость: мое компьютерное железо (процессор ryzen 5 2600 и видеоадаптер rx 590) оказались не совместимы с версией Linux Kernel младше 4.20.

![image](https://user-images.githubusercontent.com/12753171/61165815-cbe19b80-a514-11e9-9a11-6f854a50b93a.png)

На самом деле все не так плохо, но неприятные инциденты имеют место хотя и очень редко.

## Создание образа

Качаем [образ](https://www.archlinux.org/download/) и записываем его с помощью команды:

```bash
$ sudo dd if=/path/to/iso of=/dev/sdX bs=8M status=progress; sync
```

Где `sdX` &ndash; имя нашего USB устройства. Перегружаемся после удачного завершения операции.

В Windows для создания загрузочной флешки можно использовать [Rufus](https://rufus.ie/).

![image](https://user-images.githubusercontent.com/41215002/53678080-21867b80-3ccb-11e9-87a8-a4d028153a53.png)

## Изменяем приоритет загрузки в BIOS/UEFI

При загрузке системы нажимаем F2 или Del (зависит от производителя материнской платы). Во вкладке BIOS в приоритете загрузки делаем первым наше USB-устройство. Нажимаем F10 и сохраняем настройки.

## Начало установки

Инструкцию по установке Arch Linux можно посмотреть так:

```bash
less ~/install.txt
```

Небольшой лайфхак: во время установки можно переключаться между терминалами с помощью `Ctrl+Alt+F1..6`. Если мы нажмем `Ctrl+Alt+F2` откроется второй терминал (по-умолчанию мы работаем в первом) и потребуется ввести пароль `root`, во втором терминале мы можем открыть инструкцию и периодически подсматривать ее, переключаясь между терминалами.

## Настройка сети

При подключении от кабеля ничего настраивать не надо. Настройка wifi требует ввода пары команд:

```bash
rfkill unblock wifi
wifi-menu
```

Следует отметить, что не все usb wifi адаптеры гараниторованно поддерживаются. Например, у меня не захотел работать dexp wfa 301, а вот с tp-link все ок.

Проверить соединение можно с помощью команды ping:

```bash
$ ping -c 3 ya.ru
PING ya.ru (87.250.250.242) 56(84) bytes of data.
64 bytes from ya.ru (87.250.250.242): icmp_seq=1 ttl=53 time=12.1 ms
64 bytes from ya.ru (87.250.250.242): icmp_seq=2 ttl=53 time=12.1 ms
64 bytes from ya.ru (87.250.250.242): icmp_seq=3 ttl=53 time=12.1 ms

--- ya.ru ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 5ms
rtt min/avg/max/mdev = 12.137/12.139/12.141/0.127 ms
```

## Выбор файловой системы

Файловая система Btrfs может размещаться на одном и более устройствах/разделах. В Btrfs есть подтома с динамическим размером (по-сути ‒ обычные каталоги) и группы с помощью которых можно ограничивать размер подтомов. Главная фишка Btrfs ‒ это легковесные снапшоты и на диске хранятся только различия между оригиналом и накопленные изменения. Мы можем периодически делать снапшоты подтомов, а потом в случае необходимости восстанавливать состояние системы, причем делать это налету.

Касательно LVM: единственное удобство в нем для меня – это возможность динамически менять размер разделов. Самая частая проблема, которая у меня была раньше – это то, что я не угадывал размер для корня. Мы можем добавлять в группу другие разделы (не обязательно на одном устройстве) и устройства. Нет ограничений как для обычных разделов, когда невозможно расширить раздел за счет предыдущего, нам вообще об этом не нужно заботиться. В LVM есть группы разделов и логические разделы. У логических разделов свои файловые системы. Увеличение размера логического раздела в отличии от уменьшения размонтирования не требует. resize2fs в LVM работает заметно быстрее. В LVM так же есть снапшоты, но они по-сути представляют полный бекап раздела.

И как вариант: можно использовать Btrfs под LVM, но это сопряжено с увеличением накладных расходов на работу с файловой системой.

## Размечаем диск

Для начала посмотрим все доступные устройства:

```bash
fdisk -l
```

Создадим новый раздел:

```bash
# fdisk /dev/nvme0n1
# Более удобная утилита чем fdisk, в ней можно выбирать все стрелочками
cfdisk /dev/nvme0n1
# При разметке swap размещайте после home, т.е. самым последним на случай, если потребуется увеличить его размер
```

Если есть раздел с Windows сделайте от него отступ 1-2 MB, т.к. Windows выходит за установленные лимиты и портит соседние разделы.

Если не установлен Windows:

Создаем раздел в FAT-32 размером, а затем форматируем его:

```bash
mkfs.fat -F32 -n ESP /dev/nvme0n1p1
```

Для FAT32 [https://en.wikipedia.org/wiki/File_Allocation_Table#Size_limits](лимит) на минимальный размер раздела составляет от 32 до 260 мегабайт в зависимости от размера логического сектора.

Немного про swap: в Linux есть компонент ядра OOM-killer (Out-of-Memory), который запускается когда кончается доступная память, тогда он убивает наименее приоритетные процессы, например, может убить IDE с несохраненным прогрессом. Такие ситуации могут возникнуть, например, при компиляции из исходников, утечках. Так же swap используется при гибернации, когда содержимое оперативной памяти сохраняется на диск и при следующем запуске вы сможете полностью восстановить состояние.

В дальнейших примерах предполагается, что у нас установлена Windows, которая занимает 4 раздела: recovery, efi, reserved, Windows. Поэтому в примерах новый раздел nvme0n1p**5**.

## Создание файловой системы и монтирование

### Вариант №1: Btrfs

```bash
# Сначала монтируем раздел
mount /dev/nvme0n1p5 /mnt

# Потом создаем на нем подтома
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@swap

# Теперь мы демонтируем устройство
umount /mnt

mkdir -p /mnt/boot/efi /mnt/var/swap /mnt/home

# Монтируемся

# ZStandard ‒ это самый оптимальный метод сжатия. Если компьютер слабый, то лучше использовать lzo.
mount -o rw,noatime,compress=zstd:3,ssd,space_cache,subvol=@ /dev/nvme0n1p5 /mnt
mount /dev/nvme0n1p2 /mnt/boot/efi
mount -o noatime,compress=zstd:3,space_cache,subvol=@home /dev/nvme0n1p5 /mnt/home
mount -o rw,noatime,compress=no,ssd,space_cache,subvol=@swap /dev/nvme0n1p5 /mnt/var/swap

# Создаем файл подкачки
touch /mnt/var/swap/swapfile
# chattr +C должна быть применена к пустому файлу!
# Тут я перестраховываюсь, так как для подтома сжатие отключено
chattr +C /mnt/var/swap/swapfile
# С 16GB оперативной памяти нужно иметь файл подкачки минимум 4GB, 8 ‒ еще лучше (для гибернации нужно не менее 1/3 размера от RAM), а 32GB ‒ идеально
fallocate -l 4G /mnt/var/swap/swapfile
chmod 600 /mnt/var/swap/swapfile
mkswap /mnt/var/swap/swapfile
swapon /mnt/vra/swap/swapfile
```

### Вариант №2: LVM

```bash
# Создадим группу на разделе без файловой системы
vgcreate linux /dev/nvme0n1p5
# Теперь создадим в ней логические разделы:
lvcreate -L 30G linux -n root
lvcreate -L 20G linux -n home
# Можно для раздела отдать все оставшееся место
lvcreate -L +100%FREE linux -n home
mkfs.ext4 /dev/linux/root
mkfs.ext4 /dev/linux/home
mount /dev/linux/root /mnt
mkdir /mnt/home
mount /dev/linux/home /mnt/home
# Создаем файл подкачки. Не нужно верить дурачкам: он нужен всегда. Без него система будет лагать
fallocate -l 2G /mnt/swapfile
# Если хотим использовать гибернацию, то размер файла подкачки должен составлять около 2/5 от размера оперативной памяти на современном компьютере, в идеале он должен быть ему равен либо даже больше
# fallocate -l `awk '/Mem:/ {print $2}' <(free -m)`M /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p2 /mnt/boot/efi
```

## Установка пакетов

```bash
pacstrap /mnt base base-devel linux linux-firmware linux-headers btrfs-progs efibootmgr ntfs-3g exfat-utils os-prober grub iw dialog wpa_supplicant nano vim wget zsh gnome gnome-extra
```

base-devel содержит набор утилит для компиляции, позже пригодится

## Генерируем fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## arch-chroot

```bash
arch-chroot /mnt
```

При использовании LVM нужно выполнить чуть больше действий:

```bash
# Предотвращаем ошибки lvm:
#   WARNING: Failed to connect lvmetad...
#   WARNING: Device /dev/nvme0n1 not initialized in udev database...
mkdir /mnt/hostlvm
mount --bind /run/lvm /mnt/hostlvm
arch-chroot /mnt
ln -s /run/lvm /hostlvm
```

## Настраиваем дату и локаль

```bash
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
```

Далее:

```bash
nano /etc/locale.gen
```

Раскоментируем:

```bash
en_US.UTF-8 UTF-8
...
ru_RU.UTF-8 UTF-8
```

Генерируем локали:

```bash
locale-gen
```

Задаем язык системы:

```zsh
localectl set-locale LANG=en_US.UTF-8
```

Так же нужно настроить Linux Console (в нее мы можем попасть, нажав случайно Ctrl+Alt+F3):

```zsh
# Список всех доступных русских раскладок клавиатуры
ls /usr/share/kbd/keymaps/i386/qwerty/ru*

# Русская раскладка с переключением по Alt+Shift
echo 'KEYMAP="ruwin_alt_sh-UTF-8"' > /etc/vconsole.conf

# Шрифт с поддержкой кирилицы
echo 'FONT="cyr-sun16"' >> /etc/vconsole.conf
```

## Прописываем хосты

```bash
echo "sergey-pc" > /etc/hostname
```

```bash
nano /etc/hosts
```

Добавляем в файл такие строки:

```
127.0.0.1 localhost
::1 localhost
127.0.1.1 sergey-pc.localdomain sergey-pc
```

## Initramfs

> mkinitcpio это Bash скрипт используемый для создания начального загрузочного диска системы. Из mkinitcpio man page:

> ⚠ Это обязательный шаг даже, если не используется LVM, а так же при изменение пути до корня

При использовании LVM нужно отредактировать `/etc/mkinitcpio.conf` и модифицировать список HOOKS, добавив `lvm2` **ДО ЗНАЧЕНИЯ** `filesystems`:

```
HOOKS=(base udev autodetect modconf block lvm2 filesystems keyboard fsck)
```

Генерация:

```bash
mkinitcpio -p linux
```

## Пользователи

```zsh
# Создаем нового пользователя
useradd -m -g users -G wheel -s /bin/zsh serg

# Устанавливаем для него пароль
passwd sergey

# Лочим пользователя root, чтобы из под него нельзя было авторизоваться
passwd -l root
```

Теперь в файле `/etc/sudoers` нужно  раскоментировать строку:

```
%wheel ALL=(ALL:ALL) ALL
```

## Установка grub

```zsh
grub-install --target=x86_64-efi --efi-directory=/boot/efi
```

Чтобы отключить автоматическую загрузку Linux, редактируем дефолтный конфиг груба:

```zsh
nano /etc/default/grub
```

Меняем **GRUB_TIMEOUT**:

```
GRUB_TIMEOUT=-1
```

Затем генерируем grub:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```


## Завершение

```zsh
systemctl enable gdm
systemctl enable NetworkManager
exit
reboot
```

## Дополнительно

### Swappines

```bash
$ cat /proc/sys/vm/swappiness
60
```

При 60% свободной памяти, система начнет активно использовать своп.

Изменяем это поведение:

```zsh
$ sudo sysctl -w vm.swappiness=1
```

Чтобы сделать значение постоянным, создаем `/etc/sysctl.d/99-swappiness.conf` со следующим содержимым:

```conf
vm.swappiness=1
```

```zsh
$ sudo sysctl --system
```

---

# man & help

```bash
$ man [ <section> ] <page>

# Section	Description
# 1	General Commands
# 2	System Calls
# 3	Library functions, covering in particular the C standard library
# 4	Special files (usually devices, those found in /dev) and drivers
# 5	File formats and conventions
# 6	Games and screensavers
# 7	Miscellanea
# 8	System administration commands and daemons

# Узнать где хранятся страницы манулов можно так
$ manpath
/usr/local/man:/usr/local/share/man:/usr/share/man

$ man -w printf
/usr/share/man/man1/printf.1.gz

# Поиск страниц по ключевому слову
$ man -k printf

# Смотрим все страницы
$ man -f printf
printf (1)           - format and print data
printf (1p)          - write formatted output
printf (3)           - formatted output conversion
printf (3p)          - print formatted output

# Выбираем конкретную
$ man 1p printf

# Краткая справка по функции
$ command -h
$ command --help
```

# Типы файлов в выводе ls и других стандартных команд

There is only 1 command you need to know, which will help you to identify and categorize all the seven different file types found on the Linux system.

```bash
$ ls -ld <file name>
```

Here is an example output of the above command.

```bash
 $ ls -ld /etc/services
-rw-r--r-- 1 root root 19281 Feb 14  2012 /etc/services
```

ls command will show the file type as an encoded symbol found as the first character of the file permission part. In this case it is "-", which means "regular file". It is important to point out that Linux file types are not to be mistaken with file extensions. Let us have a look at a short summary of all the seven different types of Linux file types and ls command identifiers:

```
- : regular file
d : directory
c : character device file
b : block device file
s : local socket file
p : named pipe
l : symbolic link
```

# Пакетные менеджеры

Пакетным менеджером по-умолчанию для Arch Linux является pacman. Для подсветки вывода pacman в `/etc/pacman.conf` нужно раскомментировать `Color`. Пользовательским репозиторием является [AUR](https://aur.archlinux.org/). Пакеты из него можно использовать только на свой страх и риск, но использовать все же придется ведь в официальных репозиториях много нету. Чтобы не собирать пакеты вручную можно поставить yay:
 
```bash
sudo pacman -S git
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

Пакеты всегда нужно ставить из репозиториев. Смысла собирать их из исходников нет, так как в AUR и так самые последние версии. Так будет меньше хлама оставаться в системе после их удаления.

Синтаксис команды Yay аналогичен pacman. Так что будет полезным почитать справку по [pacman](https://wiki.archlinux.org/index.php/Pacman_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)).

Ссылки:

* [Сравнеие пакетных менеджеров](https://wiki.archlinux.org/index.php/AUR_helpers_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)).

# Нужные пакеты

Это список необходимых для меня пакетов:

```bash
yay -Sy linux-headers \ # нужны для компиляции некоторых программ
  wget \ # позволяет выполнять HTTP-запросы, скачивать файлы
  curl \ # делает то же самое, что и предыдущий
  adobe-source-code-pro-fonts \ # шрифт для терминала, нужен для темы Oh My Zsh! agnoster
  ttf-droid \ # шрифт по-умолчанию для VScode
  \ # шрифты по-умолчанию для Chrome
  \ # consolas-font \
  \ # ttf-ms-fonts \
  arc-gtk-theme-git \ # тема для интерфейса
  apache \ # самый популярный веб-сервер
  apache-tools \ # содержит ab, нагрузочный клиент
  \ # blender \ # самый простой 3D-редактор
  dconf-editor \ # все настройки gnome в одном месте
  dmraid \ # утилита для работы с raid-массивами дисков
  docker-compose \ # содержит docker и docker compose
  exfat-utils \ # добавляет поддержку файловой системы exfat
  firefox \ # один из лучших браузеров, единственный конкурент Chrome и единственный популярный non-chromium браузер
  flat-remix-git \ # тема с иконками
  \ # gimp \ # скромненький аналог Photoshop
  gnome-panel \ # я ставил только чтобы ярлыки из GUI создавать
  google-chrome \ # лучший браузер, противники проприетарщины предпочитают chromium
  chrome-gnome-shell \ # позволяет устанавливать расширения для Gnome
  gparted \ # графическая оболочка для разметки дисков
  htop \ # показывает запущенные процессы, загрузку cpu и потребление памяти
  \ # inkscape \ # векторный графический редактор
  \ # mariadb \ # свободная реализация самой популярной СУБД MySQL
  mc \ # аналог виндового Far + mcedit, замена nano
  \ # mongodb-bin \ # лучшая NoSQL база данных
  net-tools \ # содержит netstat
  neofetch \ # выводит в консоль информацию о системе
  nginx \ # самый быстрый веб-сервер
  ntfs-3g \ # добавляет поддержку файловой системы ntfs
  \ # nvm \ # менеджер версий для Node.js
  \ # postgresql \ # лучшая SQL база данных
  \ # phpenv \ # менеджер версий для PHP
  \ # pyenv \ # менеджер версий для Python
  asdf-vm \ # Заменяет собой все выше перечисленные менеджеры версий
  \ # pgadmin4 \ # админка для Postgres
  \ # pgmodeler \ # визуальный редактор для моделирования в Postgres
  \ # redis \ # СУБД в оперативной памяти, используемая для межпроцессового взаимодействия
  smartmontools \ # утилита для проверки состояния SSD
  telegram-desktop-bin \ # лучший мессенджер
  texmaker \ # редактор LaTex, генерирует PDF
  tor \ # сервис, который можно использовать для подключения к сети Tor
  torsocks \ # утилита torify, которая заставляет другие программы работать через Tor
  transmission-qt \ # торрент-клиент
  thunderbird \ # email-клиент
  virtualbox \ # виртуальная машина, позволяет запускать Windows и Linux
  visual-studio-code-bin \ # лучший бесплатный текстовый редактор
  vlc \ # видеоплеер
  websocat-bin \ # утилита для тестированя вебсокетов
  woeusb \ # создание загрузочных флешек с Windows
  xclip \ # копирование файла в буффер обмена из консоли
  seahorse \ # Приложение для управления паролями, а так же PGP и SSH ключами
  baobab \ # Приложения для мониторинга дисков
  jq \ # Утилита для работы с JSON
  pv \ # получает на вход поток и перенаправляет его, показывая статистику
  httpie \ # лучшая замена curl с подсветкой вывода
  tor-browser \ # Tor браузер
  
```

# Заменяем ядро на стабильное

Если надоело, что что-то ломается почти после каждого обновления ядра, запускаем терминал и выполняем:

```bash
yay -S linux-lts linux-headers-lts
yay -R linux linux-headers
mkinitcpio -p linux
```

# Масштабировавние 150% как в Windows

По-умолчанию в Gnome масштабирование кратно 100. Чтобы добавить варианты масштабирования 125% и 150% нужно выполнить в терминале:

```bash
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
```

Отключение:

```
gsettings reset org.gnome.mutter experimental-features
```

# Расширения для Gnome

Устанавливаем [расширение](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=ru) для Chrome.

![image](https://user-images.githubusercontent.com/41215002/53135292-b979bc00-358b-11e9-95df-7a540bc7b6f0.png)

Управление расширениями осуществляется через Tweaks.

![image](https://user-images.githubusercontent.com/41215002/53135669-25a8ef80-358d-11e9-9d5b-5024729dc550.png)

Расширения для установки:

| Название <img width="450"> | Описание <img width="450"> |
| -- | -- |
| [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/). | Выезжающий Dash - панель с избранными приложениями |
| [Desktop Icons](https://extensions.gnome.org/extension/1465/desktop-icons/) | Иконки на рабочем столе |
| [ShellTile](https://extensions.gnome.org/extension/657/shelltile/) | Тайловый менеджер |
| [Log Out Button](https://extensions.gnome.org/extension/1143/logout-button/) | Добавляет кнопку, которая выполняет выход из системы |

# Пользовательские сочетания клавиш

В Settings → Devices → Keyboard добавляем сочетания клавиш:
* `Ctrl + Alt + T` для запуска терминала (`gnome-terminal`);
* `Ctrl + Alt + V`  для запуска Visual Code (`code`).

![image](https://user-images.githubusercontent.com/41215002/53122203-1adb6400-3567-11e9-919c-a031dce832e5.png)

# Запуск исполняемых файлов по двойному клику в Nautilus

Заставляем Nautilus выполнять исполняемые файлы вместо открытия их в текстовом редакторе. Нужно нажать на три точки, а потом выбрать Preferences:

![image](https://user-images.githubusercontent.com/41215002/53286773-8bab9780-3784-11e9-8e41-44edba435356.png)

# Добавляем новые действия в контекстное Nautilus

```bash
$ yay -S filemanager-actions
```

У программы есть интерфейс, который позволяет добавлять свои команды. Существуют два плейсхолдера: %d для текущего каталога и %f для файла.

To install nautilus-action on Ubuntu, run simply this command via the Terminal:

sudo apt-get install nautilus-actions
(or equivalant packet manager as yum or pacman)

After the installation is complete, let's now see a quick example of how to add an extra action to the right-click menu with nautilus-actions.

The example consists of adding to the right-click menu the "Edit With Gimp" action to edit, for example, image files using The Gimp (Image Editor).

_Using the dash search "nautilus-actions" and click Nautilus-Actions Configuration.

_Under the Action tab, fill the following fields:

Context label: The text that will be displayed in the right-click menu, in our example, it's "Edit With Gimp"
Icon: This option allows to select an icon for your action (optional)
_Open now the Command tab and fill in the following fields:

Label: Enter any label of your choice for your action.
Path: Enter the path to the program you want to use using the Browse button. For our example, we will simply type "gimp".
Parameters: Click the Legend button to get suggested parameters. In our example, we will use the %f parameter to be able to edit image files with The Gimp.
_Log out the current session and log on again, or simply restart Nautilus with these commands from the Terminal:

nautilus -q
nautilus

[Страница проекта](https://github.com/GNOME/filemanager-actions).

# Шаблоны файлов

Чтобы в Nautilus в контекстном меню отображался пункт `New Document`, нужно в `~/Templaytes` создать шаблоны файлов:

```bash
touch ~/Templates/{Empty\ Document,Text\ Document.txt,README.md,pyfile.py}
```

# Гибернация

Режим гибернациии от режима сна отличается тем, что в первом случае содержимое оперативной памяти сохраняется на жесткий диск и питание полностью отключается, во втором - питание подается только на оперативку. Чем хороша гибернация? - Например, мы работаем в Linux, вошли в режим гибернации, а затем загрузились в Windows и играем. Когда мы в следующий раз загрузимся в Linux, то увидим все то, что было перед выключением. Прекрасно?! Но часто ли такое нужно?

При переходе в режим гибернации делается дамп используемой оперативной памяти на диск. Размер файла/раздела подкачки для этих целей советуют делать не менее 2/5 от объема RAM на современных компьютерах. Так же можно применять сжатие при дампе. Про гибернацию лучше почитать [здесь](https://help.ubuntu.ru/wiki/%D1%81%D0%BF%D1%8F%D1%89%D0%B8%D0%B9_%D1%80%D0%B5%D0%B6%D0%B8%D0%BC).

Режим гибернации по-умолчанию отключен. Чтобы его включить для начала нужно узнать UUID раздела, где расположен своп:


```zsh
$ lsblk `df /swapfile | awk '/^\/dev/ {print $1}'` -no UUID
217df373-d154-4f2e-9497-fcac21709729
```

А затем сектор диска с которого начинается файл:

```bash
$ sudo filefrag -v /swapfile | awk 'NR == 4 {print $5}' | cut -d ':' -f 1
1423360
```

Если swapfile размещен на Btrfs, то описанный выше способ работать не будет.

```zsh
# Для начала нужно скачать специальную утилиту для определения физического расположения файла
$ cd /tmp
$ wget https://raw.githubusercontent.com/osandov/osandov-linux/master/scripts/btrfs_map_physical.c
$ gcc -O2 -o btrfs_map_physical btrfs_map_physical.c  
# переместим исполняемый файл
$ sudo mv btrfs_map_physical /usr/local/bin
$ sudo chmod +x /usr/local/bin/btrfs_map_physical

# Использование
$ sudo btrfs_map_physical /swap/swapfile
FILE OFFSET	FILE SIZE	EXTENT OFFSET	EXTENT TYPE	LOGICAL SIZE	LOGICAL OFFSET	PHYSICAL SIZE	DEVID	PHYSICAL OFFSET
0	4096	0	regular	268435456	91029504	268435456	191029504
...

# Нас интересует последняя цифра. Ее нужно поделить на 4096 (размер блока) и результат указать в resume_offset
$ echo $((`sudo btrfs_map_physical /swap/swapfile | head -n 2 | tail -n 1 | cut -f9` / 4096))
22224
```

![screenshot from 2019-02-23 02-12-34](https://user-images.githubusercontent.com/41215002/53276552-8f053b80-3710-11e9-9770-5dd5e733f70a.png)

В `/etc/default/grub` прописать:

```config
GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=UUID=217df373-d154-4f2e-9497-fcac21709729 resume_offset=1423360"
```

`resume_offset` нужен только для файла. Для дисков и разделов вместо UUID можно указывать /dev/sda3 или /dev/mapper/linux-swap.

Теперь нужно изменить /etc/mkinitcpio.conf:

```conf
# resume должен следовать после filesystems
HOOKS=(...filesystems resume...)
```

Обновляем grub и генерируем initramfs:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo mkinitcpio -p linux
```

Сам переход в режим гибернации выглядит так:

```bash
systemctl hibernate
```

Чтобы появилась кнопка для перехода в режим гибернации ставим [расширение](https://extensions.gnome.org/extension/755/hibernate-status-button/).

![image](https://user-images.githubusercontent.com/41215002/53138121-3f9b0000-3596-11e9-84c9-5e1277f80b31.png)
![image](https://user-images.githubusercontent.com/41215002/53138158-622d1900-3596-11e9-8a53-515e39382b03.png)

# RAID

## Аппаратный RAID

В Linux RAID на аппаратном уровне называют FakeRAID. Для работы с FakeRAID  используется пакет dmraid.

Редактируем конфиг mkinitcpio:

```bash
sudo nano /etc/mkinitcpio.conf
```

В хуки добавляем dmraid:

```conf
HOOKS=(base udev autodetect modconf block lvm2 dmraid filesystems keyboard fsck)
```

И генерируем mkinitcpio:

```bash
sudo mkinitcpio -p linux
```

На моей материнке с чипсетом b450 с апаратным RAID из Linux работать нельзя: нет драйвера.

## Программный Windows RAID

Этот раздел можно было бы озаглавит как RAID, доступный в Windows и в Linux. В Windows, в [Disk Management](https://www.lifewire.com/how-to-open-disk-management-2626080) нужно создать Striped Volume, аналог RAID 0 (правой кнопкой мыши по нужному диску). Это когда данные пишутся параллельно на разные устройства без дублирования. Одтн блок пишется на один диск, другой на второй, причем одновременно. Чтение происходит также. Таким образом при использовании 2 дисков мы получаем двойную скорость чтения/записи.

```bash
$ yay -S ldmtool

$ sudo ldmtool scan                                                
[
  "8d0cc1a7-b10c-11e9-80d3-b42e9916909d"
]

$ sudo ldmtool show diskgroup 8d0cc1a7-b10c-11e9-80d3-b42e9916909d 
{
  "name" : "DESKTOP-VR9KKHM-Dg0",
  "guid" : "8d0cc1a7-b10c-11e9-80d3-b42e9916909d",
  "volumes" : [
    "Volume1"
  ],
  "disks" : [
    "Disk1",
    "Disk2"
  ]
}

$ sudo ldmtool create all                                          
[
  "ldm_vol_DESKTOP-VR9KKHM-Dg0_Volume1"
]
```

Теперь можно монтировать устройство `/dev/mapper/ldm_vol_DESKTOP-VR9KKHM-Dg0_Volume1`.

Но нам нужно чтобы устройство автоматически создавалось. Для этого нужно создать сервис `/etc/systemd/system/ldmtool.service`:

```bash
[Unit]
Description=Windows Dynamic Disk Mount
Before=local-fs-pre.target
DefaultDependencies=no
[Service]
Type=simple
User=root
ExecStart=/usr/bin/ldmtool create all
[Install]
WantedBy=local-fs-pre.target
```

Включим его:

```bash
$ sudo systemctl enable ldmtool.service
```

Редактируем `/etc/fstab`:

```config
/dev/mapper/ldm_vol_DESKTOP-VR9KKHM-Dg0_Volume1 /mnt/d ntfs-3g rw,user,fmask=0111,dmask=0000 0 0
```

В Windows есть так же технология Storage Spaces, но ее поддержка в Linux не реализована.

# Права

4 - Чтение (r)
2 - Запись (w)
1 - Выполнение (x)

Сумма этих чисел дает разные сочетания типа:
1 + 2 + 4 = 7 или 1 + 4 = 5

Права задаются тремя числами, например, 755, где первое число – права владельца, далее: группа и остальные пользователи. Владелец может делать все  (1 + 2 + 4 = 7), другие пользователи – только читать и исполнять файлы (1 + 4 = 5).

Для работы с правами на файлы используется команда chroot:

```bash
chroot --help
```

В Python права можно записывать так:

```bash
0o755
```

```bash
$ ll
total 20K
drwxr-xr-x 3 sergey sergey 4,0K июн 20 17:22 backend
...

d         | rwx      | r-x    | r-x
тип файла | владелец | группа | остальные
```

Ссылки:

* [Права доступа к файлам и каталогам](https://www.linuxcenter.ru/lib/books/kostromin/gl_04_05.phtml)

# Монтирование

```bash
$ sudo mount [ -t <fs> ] <device> <path> [ -o <options> ]

# Можно монтировать образы, созданные через dd
mount -t fstype -o loop,ro image.dd /mntpoint
```

Опции:

```
ro     Mount the filesystem read-only.

rw     Mount the filesystem read-write.

sync   All I/O to the filesystem should be done synchronously.  In  the
	case  of  media with a limited number of write cycles (e.g. some
	flash drives), sync may cause life-cycle shortening.

user   Allow an ordinary user to mount the filesystem.  The name of the
	mounting  user  is  written  to the mtab file (or to the private
	libmount file in /run/mount on systems without a  regular  mtab)
	so  that  this same user can unmount the filesystem again.  This
	option implies the options noexec,  nosuid,  and  nodev  (unless
	overridden   by  subsequent  options,  as  in  the  option  line
	user,exec,dev,suid).

noexec ‒ запретить выполнение файлов
noatime ‒ не обновлять время домступа к файлу
defaults = rw,suid,dev,exec,auto,nouser,async
uid ‒ 1000 для первого пользователя
gid ‒ см. далее

$ id
uid=1000(sergey) gid=985(users) groups=985(users),969(docker),998(wheel)

users  Allow any user to mount and to unmount the filesystem, even when
	some other ordinary user mounted it.  This  option  implies  the
	options  noexec,  nosuid, and nodev (unless overridden by subse‐
	quent options, as in the option line users,exec,dev,suid).

umask=value
	Set the umask (the bitmask  of  the  permissions  that  are  not
	present).  The default is the umask of the current process.  The
	value is given in octal.

dmask=value
	Set the umask applied to directories only.  The default  is  the
	umask of the current process.  The value is given in octal.

fmask=value
	Set the umask applied to regular files only.  The default is the
	umask of the current process.  The value is given in octal.

Указываются права не в виде восьмиричного числа!

    0   1   2   3   4   5   6   7
r   +   +   +   +   -   -   -   -
w   +   +   -   -   +   +   -   -
x   +   -   +   -   +   -   +   -

Например, 0755 = 0022
```

* [mount](https://www.opennet.ru/man.shtml?topic=mount&category=8).

# Добавляем путь в PATH

* Bash Shell: `~.bash_profile`, `~/.bashrc` or `~/.profile`
* Korn Shell: `~/.kshrc` or `~/.profile`
* Z Shell: `~/.zshrc` or `~/.zprofile`

```bash
export PATH=/path/to/bin:$PATH
```

# bin в домашнем каталоге

```bash
mkdir ~/.local/bin
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zprofile
# or
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc
```

Теперь самописные скрипты можно кидать в `~/.local/bin`, так они будут доступны только для текущего пользователя.

`~/.local/bin/hello`:

```bash
#!/usr/bin/env bash

echo "Hello World!"
```

Сделаем скрпит исполняемым:

```bash
$ chmod +x ~/.local/bin/hello
```

Проверка:

```bash
# Если не перелогинивались после добавления пути в ~/.zprofile, то сначала выполняем
$ source ~/.zprofile
$ hello
Hello World!
```

# Монтируем Windows разделы

```bash
$ sudo mkdir /mnt/c
```

Редактируем `/etc/fstab`:

```conf
/dev/nvme0n1p4 /mnt/c ntfs-3g rw,user,fmask=0111,dmask=0000 0 0
```

# Шрифты

Шрифты надо кидать в `/usr/share/fonts` либо в `~/.fonts` или в `~/.local/share/fonts`.

```bash
# Обновить шрифты
$ fc-cache -f -v

# Чтобы проверить установлен ли шрифт
$ fc-list | grep "<name-of-font>"
```

Шарим Windows шрифты:

```bash
$ sudo ln -sf /mnt/c/Windows/Fonts /usr/share/fonts/WindowsFonts
```

![screenshot from 2019-02-20 23-17-46](https://user-images.githubusercontent.com/41215002/53122109-da7be600-3566-11e9-9de7-06582f3d6a53.png)

Наборы шрифтов:

* [Powrline Fonts](https://github.com/powerline/fonts);
* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

# Emoji

```yay
# Вариант 1
yay -S ttf-joypixels
# Добавим конфиг с фолбэками (убедитесь, что он там есть)
sudo ln -s /etc/fonts/conf.avail/75-joypixels.conf  /etc/fonts/conf.d
# Обновим кэш шрифтов
fc-cache -f

# Вариант 2
yay -S noto-fonts-emoji
# mkdir -p ~/.config/fontconfig
# можно локально задать в ~/.config/fontconfig/fonts.conf
sudo tee /etc/fonts/conf.avail/75-noto-color-emoji.conf << __EOF__ > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

    <!-- Add generic family. -->
    <match target="pattern">
        <test qual="any" name="family"><string>emoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <!-- This adds Noto Color Emoji as a final fallback font for the default font families. -->
    <match target="pattern">
        <test name="family"><string>sans</string></test>
        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test name="family"><string>serif</string></test>
        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test name="family"><string>sans-serif</string></test>
        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test name="family"><string>monospace</string></test>
        <edit name="family" mode="append"><string>Noto Color Emoji</string></edit>
    </match>

    <!-- Block Symbola from the list of fallback fonts. -->
    <selectfont>
        <rejectfont>
            <pattern>
                <patelt name="family">
                    <string>Symbola</string>
                </patelt>
            </pattern>
        </rejectfont>
    </selectfont>

    <!-- Use Noto Color Emoji when other popular fonts are being specifically requested. -->
    <match target="pattern">
        <test qual="any" name="family"><string>Apple Color Emoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Segoe UI Emoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Segoe UI Symbol</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Android Emoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Twitter Color Emoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Twemoji</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Twemoji Mozilla</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>TwemojiMozilla</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>EmojiTwo</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Emoji Two</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>EmojiSymbols</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

    <match target="pattern">
        <test qual="any" name="family"><string>Symbola</string></test>
        <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
    </match>

</fontconfig>
__EOF__
sudo ln -sf /etc/fonts/conf.avail/75-noto-color-emoji.conf /etc/fonts/conf.d/
fc-cache -f -v
```

Теперь глифы эмодзи, если они отсутствуют у шрифта будут браться из JoyPixels. 

# Спецсимволы

Для вставки специальных символов в Gnome применяется сочетание клавиш `Ctrl+Shift+U`, далее вводим 4-х значный код символа.

| Символ | Unicode  |
| -- | -- |
| « | 00ab |
| » | 00bb |
| © | 00a9 |
| ™ | 2122 |
| § | 00a7 |
| – | 2013 |
| € | 20ac |
| ₽ | 20bd |
| → | 2192 |
| λ | 03bb |

# Сетевые интерфесы

```bash
$ ifconfig -a
...
enp5s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.106  netmask 255.255.255.0  broadcast 192.168.0.255
...

# inet 192.168.0.106 ‒ это наш адрес в локальной сети, если запустить на локальной машине nginx, то перейдя по ссылке http://192.168.0.106 мы увидим приветствие Nginx
```

Расшифрорвка имен:

```
Two character prefixes based on the type of interface:
 *   en -- ethernet
 *   sl -- serial line IP (slip)
 *   wl -- wlan
 *   ww -- wwan
```

Так же можно менять свой локальный ip.

Ссылки:

(Linux ifconfig command)[https://www.computerhope.com/unix/uifconfi.htm].

# Блокируем сайты с рекламой через hosts

```bash
# Сохраняем копию оригинального файла
$ cp /etc/hosts ~/Documents/hosts.bak
$ wget -qO- https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | sudo tee --append /etc/hosts
```

# Информация о железе

```bash
$ lspci
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset Family USB xHCI Host Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series/C216 Chipset Family MEI Controller #1 (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Express Root Port 1 (rev c4)
00:1c.4 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 5 (rev c4)
00:1c.5 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 6 (rev c4)
00:1c.6 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 7 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation H77 Express Chipset LPC Controller (rev 04)
00:1f.2 IDE interface: Intel Corporation 7 Series/C210 Series Chipset Family 4-port SATA Controller [IDE mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series/C216 Chipset Family SMBus Controller (rev 04)
00:1f.5 IDE interface: Intel Corporation 7 Series/C210 Series Chipset Family 2-port SATA Controller [IDE mode] (rev 04)
03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 09)
04:00.0 Network controller: Qualcomm Atheros AR9485 Wireless Network Adapter (rev 01)
05:00.0 IDE interface: Marvell Technology Group Ltd. 88SE9172 SATA III 6Gb/s RAID Controller (rev 11)

# Видеоадаптер(ы)
$ lspci -v | grep "VGA" -A 12

# SATA-устройства
$ lsscsi

# Список USB-устройств
$ lsusb

# Очень подробная информация о всех устройствах
$ inxi -Fx

$ hwinfo --short
cpu:
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3500 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3480 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3500 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3491 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3550 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3484 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3492 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3496 MHz
keyboard:
  /dev/input/event2    Logitech Keyboard K120
mouse:
  /dev/input/mice      Logitech M-U0004 810-001317 [B110 Optical USB Mouse]
monitor:
                       SAMSUNG SMS24A650
                       SAMSUNG SMB2340
graphics card:
                       Intel 2nd Generation Core Processor Family Integrated Graphics Controller
sound:
                       Intel 7 Series/C216 Chipset Family High Definition Audio Controller
storage:
                       Intel 7 Series/C210 Series Chipset Family 4-port SATA Controller [IDE mode]
                       Intel 7 Series/C210 Series Chipset Family 2-port SATA Controller [IDE mode]
                       Marvell 88SE9172 SATA III 6Gb/s RAID Controller
network:
  enp3s0               Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
  wlp4s0               Qualcomm Atheros AR9485 Wireless Network Adapter
network interface:
  docker0              Ethernet network interface
  enp3s0               Ethernet network interface
  lo                   Loopback network interface
  wlp4s0               Ethernet network interface
  br-1d7c88a3dc61      Ethernet network interface
disk:
  /dev/sdb             WDC WD5000AZLX-0
  /dev/sda             INTEL SSDSC2CW24
partition:
  /dev/sdb1            Partition
  /dev/sda1            Partition
  /dev/sda2            Partition
  /dev/sda3            Partition
usb controller:
                       Intel 7 Series/C216 Chipset Family USB Enhanced Host Controller #2
                       Intel 7 Series/C216 Chipset Family USB Enhanced Host Controller #1
                       Intel 7 Series/C210 Series Chipset Family USB xHCI Host Controller
bios:
                       BIOS
bridge:
                       Intel 7 Series/C216 Chipset Family PCI Express Root Port 1
                       Intel H77 Express Chipset LPC Controller
                       Intel Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 6
                       Intel 2nd Generation Core Processor Family DRAM Controller
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 7
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 5
hub:
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
                       Linux Foundation 3.0 root hub
                       Linux Foundation 2.0 root hub
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
memory:
                       Main Memory
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
  /dev/lp0             Parallel controller
                       Intel 7 Series/C216 Chipset Family MEI Controller #1
                       Intel 7 Series/C216 Chipset Family SMBus Controller
                       Serial controller
  /dev/input/event3    Logitech Keyboard K120

# Список блочных устройств
$ lsblk

# Покажет разделы и занимаемое ими место
$ df -h

# Fdisk is a utility to modify partitions on hard drives, and can be used to list out the partition information as well.

$ sudo fdisk -l

Disk /dev/sda: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x30093008

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *          63   146801969    73400953+   7  HPFS/NTFS/exFAT
/dev/sda2       146802031   976771071   414984520+   f  W95 Ext'd (LBA)
/dev/sda5       146802033   351614654   102406311    7  HPFS/NTFS/exFAT
/dev/sda6       351614718   556427339   102406311   83  Linux
/dev/sda7       556429312   560427007     1998848   82  Linux swap / Solaris
/dev/sda8       560429056   976771071   208171008   83  Linux

# The mount is used to mount/unmount and view mounted file systems.

$ mount | column -t
/dev/sda6    on  /                                            type  ext4             (rw,errors=remount-ro)
proc         on  /proc                                        type  proc             (rw,noexec,nosuid,nodev)
sysfs        on  /sys                                         type  sysfs            (rw,noexec,nosuid,nodev)
none         on  /sys/fs/cgroup                               type  tmpfs            (rw)
none         on  /sys/fs/fuse/connections                     type  fusectl          (rw)
none         on  /sys/kernel/debug                            type  debugfs          (rw)
none         on  /sys/kernel/security                         type  securityfs       (rw)
udev         on  /dev                                         type  devtmpfs         (rw,mode=0755)
devpts       on  /dev/pts                                     type  devpts           (rw,noexec,nosuid,gid=5,mode=0620)
tmpfs        on  /run                                         type  tmpfs            (rw,noexec,nosuid,size=10%,mode=0755)
none         on  /run/lock                                    type  tmpfs            (rw,noexec,nosuid,nodev,size=5242880)
none         on  /run/shm                                     type  tmpfs            (rw,nosuid,nodev)
none         on  /run/user                                    type  tmpfs            (rw,noexec,nosuid,nodev,size=104857600,mode=0755)
none         on  /sys/fs/pstore                               type  pstore           (rw)
/dev/sda8    on  /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1  type  ext4             (rw,nosuid,nodev,errors=remount-ro)
/dev/sda5    on  /media/4668484A68483B47                      type  fuseblk          (rw,nosuid,nodev,allow_other,blksize=4096)
binfmt_misc  on  /proc/sys/fs/binfmt_misc                     type  binfmt_misc      (rw,noexec,nosuid,nodev)
systemd      on  /sys/fs/cgroup/systemd                       type  cgroup           (rw,noexec,nosuid,nodev,none,name=systemd)
gvfsd-fuse   on  /run/user/1000/gvfs                          type  fuse.gvfsd-fuse  (rw,nosuid,nodev,user=enlightened)

# Again, use grep to filter out only those file systems that you want to see

$ mount | column -t | grep ext

# The dmidecode command is different from all other commands. It extracts hardware information by reading data from the SMBOIS data structures (also called DMI tables).

# display information about the processor/cpu
$ sudo dmidecode -t processor

# memory/ram information
$ sudo dmidecode -t memory

# bios details
$ sudo dmidecode -t bios

# cpu information
$ cat /proc/cpuinfo

# memory information
$ cat /proc/meminfo

$ cat /proc/version
Linux version 3.11.0-12-generic (buildd@allspice) (gcc version 4.8.1 (Ubuntu/Linaro 4.8.1-10ubuntu7) ) #19-Ubuntu SMP Wed Oct 9 16:20:46 UTC 2013

# SCSI/Sata devices

$ cat /proc/scsi/scsi
Attached devices:
Host: scsi3 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: ST3500418AS      Rev: CC38
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi4 Channel: 00 Id: 00 Lun: 00
  Vendor: SONY     Model: DVD RW DRU-190A  Rev: 1.63
  Type:   CD-ROM                           ANSI  SCSI revision: 05
Partitions

$ cat /proc/partitions
major minor  #blocks  name

   8        0  488386584 sda
   8        1   73400953 sda1
   8        2          1 sda2
   8        5  102406311 sda5
   8        6  102406311 sda6
   8        7    1998848 sda7
   8        8  208171008 sda8
  11        0    1048575 sr0

# The hdparm command gets information about sata devices like hard disks.

$ sudo hdparm -i /dev/sda

/dev/sda:

 Model=ST3500418AS, FwRev=CC38, SerialNo=9VMJXV1N
 Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs RotSpdTol>.5% }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=4
 BuffType=unknown, BuffSize=16384kB, MaxMultSect=16, MultSect=16
 CurCHS=16383/16/63, CurSects=16514064, LBA=yes, LBAsects=976773168
 IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4
 DMA modes:  mdma0 mdma1 mdma2
 UDMA modes: udma0 udma1 udma2 udma3 udma4 udma5 *udma6
 AdvancedPM=no WriteCache=enabled
 Drive conforms to: unknown:  ATA/ATAPI-4,5,6,7

 * signifies the current active mode
```

# Редактирование DConf

DConf хранит профили терминала в `~/.config/dconf/user`, в формате GVDB [пруф](https://en.wikipedia.org/wiki/Dconf).

![image](https://user-images.githubusercontent.com/12753171/60671500-ba3c2c00-9e62-11e9-9f70-79b1bd9aed19.png)

```bash
# Делаем дамп
$ dconf dump / > /tmp/dconf
# Редактируем и загружаем
$ dconf load / < /tmp/dconf
```

# ZSH

## Установка ZSH

```bash
$ yay -S zsh
```

Меняем shell на `/bin/zsh`:

```bash
$ chsh -s $(which zsh)
```

Чтобы изменения вступили в силу нужно залогиниться по-новой.

<s>
## [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

Установка:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Пакет из репозитория ставится вне домашнего каталога, а потому требует root права при установке плагинов, что не удобно.

Так же для некоторых тем Oh My Zsh нужны шрифты наподобие Powerline:

```bash
yay -S powerline-fonts
```

Ставим must-have плагины:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Изменяем `.zshrc`:

```bash
ZSH_THEME="agnoster"
...
plugins=(
  command-not-found
  extract
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh
```

Для темы Agnoster настройках терминала выбираем шрифт `Source Code Pro Regular`, чтобы отображались стрелочки.

* [Встроенные темы](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes);
* [Сторонние темы](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes);
* [Так же можно поискать на Github'е](https://github.com/search?o=desc&q=oh+my+zsh+theme&s=stars&type=Repositories).
</s>

## Oh My ZSH/Command Not Found

Чтобы этот плагин работал нужно выполняить [ряд действий](https://wiki.archlinux.org/index.php/Zsh#The_%22command_not_found%22_handler):

```zsh
# Устанавливаем пакет
$ yay -S pkgfile

# Инициализируем базу данных, где будет храниться информация о доступных пакетах
$ sudo pkgfile --update

# Включаем сервис для автообновления базы
$ sudo systemctl start pkgfile-update.timer
$ sudo systemctl enable pkgfile-update.timer

# Результат
$ ruby
ruby may be found in the following packages:
  extra/ruby 2.6.5-1            /usr/bin/ruby
  community/gitlab 12.3.5-1     /usr/share/webapps/gitlab/vendor/bundle/ruby/2.5.0/gems/hamlit-2.8.8/bin/ruby
  community/logstash 7.4.0-1    /usr/share/logstash/bin/ruby
  community/ruby2.5 2.5.7-1     /opt/ruby2.5/bin/ruby
```

## [ZPlug](https://github.com/b4b4r07/zplug)

Упрощает управление плагинами, позволяя все их прописать в одном месте. Лучше zgen тем, недостающие плагины сами ставятся.

```zsh
$ yay -S zplug
```

Пример `~/.zshrc`:

```zsh
#!/usr/bin/env zsh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# Шарим историю между сессиями
setopt SHARE_HISTORY
# Не сохраняем команды с пробелами в начале
setopt HIST_IGNORE_SPACE

fpath+=~/.zfunc

# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/b4b4r07/zplug ~/.zplug
# fi

source /usr/share/zsh/scripts/zplug/init.zsh

zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview
zplug  "plugins/archlinux",                 from:oh-my-zsh
zplug  "plugins/colored-man-pages",         from:oh-my-zsh
zplug  "plugins/colorize",                  from:oh-my-zsh
zplug  "plugins/compleat",                  from:oh-my-zsh
zplug  "plugins/command-not-found",         from:oh-my-zsh
zplug  "plugins/common-aliases",            from:oh-my-zsh
zplug  "plugins/copydir",                   from:oh-my-zsh
zplug  "plugins/copyfile",                  from:oh-my-zsh
zplug  "plugins/extract",                   from:oh-my-zsh
zplug  "plugins/git",                       from:oh-my-zsh
zplug  "plugins/history",                   from:oh-my-zsh
zplug  "plugins/history-substring-search",  from:oh-my-zsh
zplug  "plugins/man",                       from:oh-my-zsh
zplug  "plugins/sudo",                      from:oh-my-zsh
zplug  "plugins/themes",                    from:oh-my-zsh
zplug  "plugins/urltools",                  from:oh-my-zsh
zplug  "plugins/vscode",                    from:oh-my-zsh
zplug  "plugins/web-search",                from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Флаг --verbose служит для вывода отладочной информации
zplug load # --verbose
```

## [ZGen](https://github.com/tarjoilija/zgen)

Устарел.

Позволяет избавиться от мусора в `~/.zshrc`.

```bash
$ yay -S zgen-git
```

Пример файла `~/.zshrc`:

```bash
# load zgen
source /usr/share/zsh/share/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/archlinux
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-flow-avh
  zgen oh-my-zsh plugins/history
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/pass
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/systemd
  zgen oh-my-zsh plugins/vscode
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # generate the init script from plugins above
  zgen save
fi
```

После изменения `~/.zshrc` нужно перешрузить Shell:

```zsh
$ exec "$SHELL"
```

Все необходимые плагины будут скачены.

Новые плагины можно добавлять из терминала:

```zsh
$ zgen load <plugin>
$ zgen oh-my-zsh <plugin>
```

А можно прописать в секцию для установки, а потом выполнить:

```zsh
$ zgen reset
$ exec "$SHELL"
```

Я не уверен, что последнее правильно.

См. справку:

```bash
$ zgen --help
```

Новый плагины 

## Темы Oh My Zsh!

### [Bullet Train for oh-my-zsh](https://github.com/caiogondim/bullet-train.zsh)

```bash
$ wget -P $ZSH_CUSTOM/themes https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
```

### [Jovial](https://github.com/zthxxx/jovial)

```bash
# Сначала сохраняем копию zhsrc, потому как jovial изменить оригинальеный файл
$ cp ~/.zshrc ~/.zshrc.bak
$ curl -sSL git.io/jovial | sudo bash -s $USER
```

У меня эта тема упорно устанавливается в `/root/.oh-my-zsh`.

### [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

Это красивая тема для ZSH.

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

`~/.zshrc`:

```bash
ZSH_THEME=powerlevel10k/powerlevel10k
```

Изменим prompt:

```bash
cd && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
echo 'source ~/.purepower' >>! ~/.zshrc
```

![image](https://user-images.githubusercontent.com/12753171/60625968-d72c1d00-9dd8-11e9-902a-a0ecbe2279b1.png)

## Подробнее про ZSH

* [Приемы при работе с ZSH](http://zzapper.co.uk/zshtips.html).

# Разноцветный cat

* [ccat](https://github.com/jingweno/ccat);
* [lolcat](https://github.com/busyloop/lolcat).

# [Цветовые схемы для терминала](https://github.com/Mayccoll/Gogh)

```bash
# Интерактивная установка
# Падает с ошибкой, если нет профиля по-умолчаниюю для терминала
# Для всех созданных профилей будет использовавться шрифт профиля по-умолчанию
bash -c  "$(wget -qO- https://git.io/vQgMr)"
# Удаление всех профилей
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

Ссылки:

* [Обзор тем](https://mayccoll.github.io/Gogh/).

# Бекап системы

Предполагается, что бекап мы будем делать с установочной флешки.

```bash
mkdir /mnt/{backup,root}
mount /path/to/backup /mnt/backup
mount /path/to/root /mnt/root

# Делаем бекап
cd /mnt/root
tar -cvpzf /mnt/backup/root.tar.gz .

# Извлекаем бекапа
tar -xzpvf /mnt/backup/root.tar.gz -C /mnt/root
```

Ссылки:

* [Делаем бекап системы с помощью tar](https://help.ubuntu.com/community/BackupYourSystem/TAR).

# [asdf-vm](https://github.com/asdf-vm/asdf)

Установка asdf через Git:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
```

Установка asdf через AUR:

```bash
yay -S asdf-vm
```

В `~/.zshrc` (после compinit) добавляем строки:

```bash
. /opt/asdf-vm/asdf.sh
. /opt/asdf-vm/completions/asdf.bash
```

Устанавливаем переменную ASDF_DIR (нужна для плагина asdf oh-my-zsh) и добавляем в PATH путь до исполняемого файлаЖ.

```zsh
sudo tee /etc/profile.d/asdf.sh << EOF > /dev/null
export ASDF_DIR="/opt/asdf-vm"
export PATH="$ASDF_DIR/bin:$PATH"
EOF
```

Удаление:

```bash
yay -Rns asdf-vm
rm -rf ~/.asdf/ ~/.tool-versions
```

Примеры:

```bash
$ asdf plugin-add python
$ asdf install python 3.7.3
$ asdf install python 2.7.15
$ asdf list python
  2.7.15
  3.7.3
$ asdf uninstall python 2.7.15
$ asdf global python 3.7.3
# Сделать системную версию Python глобальной
$ asdf global python system
$ which python
/home/sergey/.asdf/shims/python

$ asdf plugin-add nodejs
# see: <https://github.com/asdf-vm/asdf-nodejs#install>
$ bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
$ asdf install nodejs 10.16.0
$ asdf global nodejs 10.16.0
$ which node
/home/sergey/.asdf/shims/node
$ which npm
/home/sergey/.asdf/shims/npm
$ asdf list
golang
  1.12
nodejs
  10.16.0
postgres
  11.4
python
  2.7.15
  3.7.3
sqlite
  3.29.0
```

[Все доступные плагины](https://asdf-vm.com/#/plugins-all). При установке, использовании плагинов могут возникать проблемы. Например, плагин для Python работает поверх [pyenv](https://github.com/pyenv/pyenv) и при возникновении проблем, следует изучить страницу [«Common build problems»](https://github.com/pyenv/pyenv/wiki/common-build-problems).

> If you use pip to install a module like ipython that has a binaries. You will need to run asdf reshim python for the binary to be in your path.

После установки через pip пакетов, которые добавляют команды, чтобы те были доступны, нужно всегда выполнять `asdf reshim python`.

Ссылки:

* [Документация](https://asdf-vm.com/#/core-manage-asdf-vm).

# [NVM](https://github.com/nvm-sh/nvm)

> ⚠️ Использование [asdf-vm](#asdf-vm) предпочительнее.

Устанавливаем последнюю версию Node.js:

```bash
nvm install node
```

# Настройка Docker

```bash
$ yay -S docker
$ sudo systemctl start docker
$ sudo systemctl enable docker
# sudo groupadd docker
# groupadd: group 'docker' already exists
sudo usermod -aG docker $USER
```

Нужно выйти и войти в систему, а потом проверить:

```bash
$ docker run hello-world
```

[Ссылка](https://docs.docker.com/install/linux/linux-postinstall/).

# Настройка Visual Code

```json
{
  "editor.fontSize": 16,
  "editor.rulers": [
    72,
    80,
    100,
    120
  ],
  "editor.tabSize": 2,
  "editor.wordWrap": "bounded",
  "editor.wordWrapColumn": 120,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "terminal.integrated.fontFamily": "Source Code Pro"
}
```

# LVM

Список логических разделов LVM:

```bash
$ sudo lvscan
  ACTIVE            '/dev/linux/root' [40.00 GiB] inherit
  ACTIVE            '/dev/linux/home' [20.00 GiB] inherit
```

Изменение размера логического раздела:

```bash
# Ключ -r выполняет resizefs
$ lvresize -r -L +10G /dev/linux/home

# Аналогично двум командам:

# Увеличиваем размер логического раздела
$ sudo lvresize -L +10GB /dev/mapper/linux-home

# После lvresize нужно обязательно изменить размер файловой системы
$ sudo resize2fs /dev/mapper/linux-home

# Делает то же самое, что и две команды выше
$ sudo lvresize -r -L +10GB /dev/mapper/linux-root
```

Переименование логического раздела:

```bash
$ sudo lvrename <oldname> <newname>
```

После нужно отредактировать `/etc/fstab`, изменив пути до разделов, а затем выполнить:

```bash
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# Btrfs

Про снапшоты. В Btrfs есть механизм, аналогичный git, который позволяет фиксировать изменения снимками. Снапшоты хранят в себе только изменения между снимками, поэтому занимают мало места и по этой же причине не могут быть созданы вне текущей файловой системы. Они содержат только диффы. Как только мы создали снапшот, состояние системы зафиксировалось. Например у нас есть три файла: foo, bar, baz. Мы сделали снапшот, а потом удалили foo и baz, но пока существует снапшот эти файлы продолжат занимать место + если мы изменим bar, то и его первоначальная копия продолжит свое существование. Так что чтобы освободить место придется периодически удалять ненужные снапшоты.

Обнаружил баг: из-за своп-файла не делались снапшоты корня.

```bash
# Создать subvolume
$ sudo btrfs sub create /path/to/@name

# Создание снапшота
# Снапшоты являются разновидностью полдазделов, потому с ними можно выполнять те же операции
$ sudo mkdir /.snapshots
$ sudo chmod 750 /.snapshots

# Этой командой не получится создать снапшот на другой Btrfs (на флешке)
$ sudo btrfs sub snap -r /home /.snapshots/@home_`date +%F-%s`
Create a readonly snapshot of '/home' in '/.snapshots/@home_2019-07-15-1563181292'

$ sudo btrfs sub li -a /
ID 257 gen 1457 top level 5 path <FS_TREE>/@
ID 258 gen 1458 top level 5 path <FS_TREE>/@home
ID 281 gen 1458 top level 5 path <FS_TREE>/@var
ID 283 gen 1458 top level 257 path <FS_TREE>/@/.snapshots/@home_2019-07-15-1563181292

# Удаление снапшота аналогично удалению подраздела
$ sudo btrfs sub del /.snapshots/@home_2019-07-15-1563181292
Delete subvolume (no-commit): '/.snapshots/@home_2019-07-15-1563181292'

# Смонтировать subvolume/снапшот по указанному пути
$ sudo btrfs sub set-default <ID> /

# Восстановление данных

# С сохранением снапшота
$ cp -aR --reflink /.snapshots/@home_YYYY-MM-DD-ssssssssss /@home

# С удалением снапшота
# Таким же способом можно переименовывать подразделы/снапшоты
$ mv /.snapshots/@home_YYYY-MM-DD-ssssssssss /@home

$ btrfs filesystem df /
Data, single: total=15.01GiB, used=12.42GiB
System, single: total=4.00MiB, used=16.00KiB
Metadata, single: total=1.01GiB, used=772.20MiB
GlobalReserve, single: total=44.47MiB, used=0.00B

# Как сделать бекап и восстановить его в другой ФС
$ btrfs send /source/subvolume >/another/filesystem/subvolume-image   # just a file
# (or you can gzip it and/or send with nc on the fly, whatever)
# then later
$ </another/filesystem/subvolume-image btrfs receive /some/btrfs/directory

# Можно так же добавлять новые разделы и устройства в уже существующую ФС
# Можно так же сделатиь ограничения на размер подраздела, добавив его в группу и включив для него квоту
$ man btrfs
```

```
бтрфс ничего не жмет.
наилучший вариант сделать ридонли снапшот системы, потом из снапшота сделать образ через send и уж его можно жать и в хвост и в гриву
к примеру

sudo btrfs filesystem sync /
sudo btrfs subvolume snapshot -r / /mnt/backup/root_base
sudo btrfs send /mnt/b11/root_base | gzip > root_`date '+%F'`.gz

но почему бы не воспользоваться обыденным tar ??
так-то формат упаковки btrfs-stream (формат выхода btrfs send) не фундаментально отличается от формата tar. выполнить на сервере

sudo tar -czpf %backup%/srv4full-`date "+%F"`.tgz -X /etc/backupfull_exclude /

в файл /etc/backupfull_exclude пишешь список того что не нужно упаковывать в архив с системой (кроме классических /dev /proc /run /sys и прочих еще докинуть саму директорию куда архивишься  и плюс рабочие директории сервисов, к примеру база данных такую архивацию не всегда переживет)
а далее восстановление из tar архива

если свободного места на сервере будет меньше трети всего объема то такой бекап может не прокатить, либо жать сильнее к примеру через lzma (жрет памяти и проц очень хорошо) либо писать напрямую по интернету к себе (если будет разрыв то передача обломится)
```

Типы файловых систем:

```
Flat:

toplevel         (volume root directory, not to be mounted by default)
  +-- root       (subvolume root directory, to be mounted at /)
  +-- home       (subvolume root directory, to be mounted at /home)
  +-- var        (directory)
  |   \-- www    (subvolume root directory, to be mounted at /var/www)
  \-- postgres   (subvolume root directory, to be mounted at /var/lib/postgresql)

Nested:

toplevel                  (volume root directory, to be mounted at /)
+-- home                  (subvolume root directory)
+-- var                   (subvolume root directory)
    +-- www               (subvolume root directory)
    +-- lib               (directory)
         \-- postgresql   (subvolume root directory)
```

# [Snapper](https://github.com/openSUSE/snapper)

Snapper ‒ это утилита для управления снапшотами для LVM и Btrfs.

```bash
# Установка
$ yay -S snapper

# Глобальные настройки
$ sudoedit /etc/conf.d/snapper

$ cd /etc/snapper/config-templates
$ sudo cp default custom

# Снапшоты делаются через промежуток времени, заданный в юните systemd
$ sudo systemctl cat snapper-timeline.timer
# /usr/lib/systemd/system/snapper-timeline.timer

[Unit]
Description=Timeline of Snapper Snapshots
Documentation=man:snapper(8) man:snapper-configs(5)

[Timer]
OnCalendar=hourly

[Install]
WantedBy=timers.target

# при необходимости меняем значение таймера
$ sudo systemctl edit snapper-timeline.timer

[Timer]
OnCalendar=<новое значение>

# По-умолчанию snapper хранит снапшоты слишклм долго
$ sudoedit custom

# Храним удаленные файлы неделю, после чего их восстановить уже не получится
...
TIMELINE_LIMIT_HOURLY="24" 
TIMELINE_LIMIT_DAILY="7"
TIMELINE_LIMIT_WEEKLY="0" 
TIMELINE_LIMIT_MONTHLY="0"
TIMELINE_LIMIT_YEARLY="0"
...

# Помощь по настройкам
man snapper-configs

# Создаем конфиги для каждого подраздела отдельно, используя конфиг custom
$ sudo snapper -c root create-config -t custom /
$ sudo snapper -c home create-config -t custom /home

# Сгенерированные шаблоны находятся в /etc/snapper/configs

# Список конфигов
$ sudo snapper list-configs
Config | Subvolume
-------+----------
home   | /home
root   | /

# Созданные конфиги меют такой адрес: /etc/snapper/configs/<config>

# Список снапшотов для конфига
$ snapper -c CONFIG list

# Удаление конфига
$ sudo snapper -c CONFIG delete-config

# Создать новый снапшот
$ sudo snapper -c CONFIG snapshot

# Удалить снапшот
$ sudo snapper -c CONFIG delete N

# Удалить диапазон снапшотов
$ sudo snapper -c CONFIG delete X-Y

# Список созданных/измененных/удаленных файлов
# 0 ‒ это текущий подтом (снапшоты тоже подтома)
$ sudo snapper -c <config> status N..0

# Изменение в файле
$ sudo snapper -c <config> diff N..0 <filename>

# Восстановить файл
$ sudo snapper -c <config> undochanges N..0 <filename>

# Откатиться к снапшоту
$ sudo snapper -c <config> undochanges N..0

# Добавляем .snapshots в исключения для mlocate
$ sudo nano /etc/updatedb.conf
...
PRUNENAMES = ".git .hg .svn .snapshots"
...

# Для KDE
$ vim ~/.config/baloofilerc
...
exclude filters=...,.snaphots
...

# Включаем автоматическое создания снапшотов
$ sudo systemctl enable snapper-timeline.timer && sudo systemctl start snapper-timeline.timer

# Можно так же периодичность очистки снапшотов изменить:

$ sudo systemctl edit snapper-cleanup.timer

# /etc/systemd/system/snapper-cleanup.timer.d/override.conf
# [Timer]
# OnUnitActiveSec=1h

# Автоматически  удаляет снапшоты при превышении квот
$ sudo systemctl enable snapper-cleanup.timer && sudo systemctl start snapper-cleanup.timer

# Просмотр логов
$ tail -f /var/log/snapper.log
```

Ссылки:

* [Snapper](https://wiki.archlinux.org/index.php/Snapper);
* [Systemd/Timers](https://wiki.archlinux.org/index.php/Systemd/Timers).

# Timeshift

Программа для управления бекапами. Работает с Btrfs и в rsync-режиме (полный дамп).

```bash
$ yay -S timeshift
```

# Логи

```bash
# Как посмотреть логи?
$ less /var/log/messages
$ more -f /var/log/messages
$ cat /var/log/messages
$ tail -f /var/log/messages
$ grep -i error /var/log/messages

# Сообщения ядра Linux
$ dmesg | less
```
| Файл | Описание |
| -- | -- |
| `/var/log/messages ` |  General message and system related stuff |
| `/var/log/auth.log ` |  Authenication logs |
| `/var/log/kern.log ` |  Kernel logs |
| `/var/log/cron.log ` |  Crond logs (cron job) |
| `/var/log/maillog ` |  Mail server logs |
| `/var/log/qmail/ ` |  Qmail log directory (more files inside this directory) |
| `/var/log/httpd/ ` |  Apache access and error logs directory |
| `/var/log/lighttpd/ ` |  Lighttpd access and error logs directory |
| `/var/log/boot.log ` |  System boot log |
| `/var/log/mysqld.log ` |  MySQL database server log file |
| `/var/log/secure` or `/var/log/auth.log ` |  Authentication log |
| `/var/log/utmp or /var/log/wtmp ` |  Login records file |
| `/var/log/yum.log ` |  Yum command log file. |

# Установка и настройка Postgres

```bash
[sergey@sergey-pc ~]$ sudo pacman -S postgresql
[sergey@sergey-pc ~]$ sudo chown postgres /var/lib/postgres/data
[sergey@sergey-pc ~]$ sudo -i -u postgres
[postgres@sergey-pc ~]$ initdb  -D '/var/lib/postgres/data'
[postgres@sergey-pc ~]$ logout
[sergey@sergey-pc ~]$ sudo systemctl start postgresql
[sergey@sergey-pc ~]$ sudo systemctl enable postgresql
[sergey@sergey-pc ~]$ sudo -u postgres -i initdb --locale $LANG -E UTF8 -D /var/lib/postgres/data
[sergey@sergey-pc ~]$
[postgres@sergey-pc ~]$ createuser --interactive -P
Enter name of role to add: sergey
Enter password for new role:
Enter it again:
Shall the new role be a superuser? (y/n)
Please answer "y" or "n".
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) y
[postgres@sergey-pc ~]$ createdb -O sergey sergey # создаем пользователя и БД с именами совпадающими с пользователем системы, чтобы psql запускать без параметров
[postgres@sergey-pc ~]$ logout
[sergey@sergey-pc ~]$ psql
psql (11.1)
Type "help" for help.

sergey=>

# Дамп базы схемы БД
$ pg_dump -d db -f /tmp/dump.sql
# Загрузка дампа
$ psql db < /tmp/dump.sql
```

# Мониторинг процессов

```bash
# Замена стандартному top
$ yay -S htop
$ htop
```

# systemd

```bash
# Все сервисы

# Покажут только включенные
$ systemctl
$ systemctl list-units --type service

# + выключенные
$ systemctl list-unit-files --type service

$ sudo systemctl enable docker

$ sudo systemctl disable docker

$ sudo systemctl restart nginx.service

$ sudo systemctl start application.service

$ sudo systemctl start application.service

$ systemctl status nginx.service

$ sudo systemctl is-enabled service
```

Создание своего сервиса:

`/etc/systemd/system/rot13.service`:
```config
[Unit]
Description=ROT13 demo service
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=centos
ExecStart=/usr/bin/env php /path/to/server.php

[Install]
WantedBy=multi-user.target
```

Ссылки:

* [Timers](https://wiki.archlinux.org/index.php/Systemd/Timers).

# Git

```bash
# Установка
$ yay -S git

# Глобальные настройки
$ git config --global user.name <yourname>
$ git config --global user.email <email>

# Цветной вывод
$ git config --global color.ui true

# Сменить ветку
$ git checkout <branchname>

# Создать ветку и переключится на нее
$ git checkout -b <branchname>

# Объединить текущую ветку с branchname
$ git merge <branchname>

# Добавить изменения (все файлы в каталоге и вложеннхы)
$ git add .

# Закоммитить изменения (сделать описание)
$ git commit -m "Тест"

# Если не были добавлены новые файлы, а лишь производились изменения в уже добавленных, то можно использовать только одну команду
$ git commit -am "Тест"

# Обновить репозиторий на сервере
$ git push

# Выгрузить изменения с сервера (тоже самое, что git fetch + git merge)
$ git pull

# Копировать репозиторий
$ git clone https://github.com/someuser/repo.git [<assigneddirectory>]

# Посмотреть историю
$ git log --graph --oneline --decorate --all

# Посмотреть отличия по сравнения с предыдущей версией
$ git diff 871d36b [<filename>]

# Сохранить изменения
$ git stash [save "my stash message here"]

# Удалить stach и применить его
$ git stash pop [stash@{1}]

# Список stash
$ git stash list

# Посмотреть что там лежит
$ git stash show stash@{0}

$ git stash apply
$ git stash drop stash@{2}
$ git stash clear

# List all the tags:

$ git tag

# Search tags for a particular pattern:

$ git tag -l <tag-pattern>

# Show a tag data:

$ git show <tag-name>

# Create a Lightweight Tag:

$ git tag <tag-name>

# Create an Annotated Tag:

$ git tag -a <tag-name> -m <tag-message>

# Create a tag for a specific commit:

$ git tag -a <tag-name> <commit-checksome>

# Push a specific tag to remote:

$ git push origin <tag-name>

# Push all the tags to remote:

$ git push origin --tags

# Checkout a specific to local:

$ git checkout -b <branch-name> <tag-name>
```

# Работаем с github через ssh

Генерация нового ключа:

```bash
$ ssh-keygen -t rsa -b 4096 -C "<email>"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/sergey/.ssh/id_rsa): /home/sergey/.ssh/github_rsa
Created directory '/home/sergey/.ssh'.
...
```

В [настройках](https://github.com/settings/keys) нужно добавить сгенерированный ключ, скопировав содержимое pub-файла (для примера - github_rsa.pub), который лежит в `~/.ssh`.

Если уже есть проекты, которые были ранее склонированы по https, то нужно изменить `.git/config` проекта. :

```
...
[remote "origin"]
url = git@github.com:<username>/<project>.git
...
```

Правильный адрес проекта можно посмотреть на странице репозитория:

![image](https://user-images.githubusercontent.com/41215002/52008762-665b9e80-24e2-11e9-8ada-e6777df2a0ab.png)

Для проекта можно указать локальные email и имя:

```bash
git config user.email <email>
git config user.name <name>
```

# Tor Service

Включаем Tor:

```bash
sudo systemctl start tor
sudo systemctl enable tor
```

Проверка:

```bash
$ torify curl http://httpbin.org/ip
{
  "origin": "173.244.209.5, 173.244.209.5"
}
```

# Менеджер паролей pass

```bash
$ yay -S pass
# Далее нужно сгенерировать PGP ключ. Сгенерированный ключ можно удалить через seahorse
$ gpg2 --gen-key
gpg (GnuPG) 2.2.16; Copyright (C) 2019 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Note: Use "gpg --full-generate-key" for a full featured key generation dialog.

GnuPG needs to construct a user ID to identify your key.

Real name: Sergey M
Email address: tz4678@gmail.com
You selected this USER-ID:
    "Sergey M <tz4678@gmail.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: key 82AD537DDC8DD344 marked as ultimately trusted
gpg: revocation certificate stored as '/home/sergey/.gnupg/openpgp-revocs.d/<gpg_id>.rev'
public and secret key created and signed.

pub   rsa2048 2019-07-13 [SC] [expires: 2021-07-12]
      <gpg_id>
uid                      Sergey M <tz4678@gmail.com>
sub   rsa2048 2019-07-13 [E] [expires: 2021-07-12]

# Теперь инициализируем хранилище
$ pass init gpg_id

# Можем сгенерировать пароль (будет автоматически сохранен)
$ pass generate example.com 15
The generated password for example.com is:
'.kXKEs<lx4dcKM

# Посмотреть пароль (потребует passphrase)
$ pass example.com
'.kXKEs<lx4dcKM

# Копировать пароль в буфер обмена
$ pass -c example.com
Copied example.com to clipboard. Will clear in 45 seconds.

# Удалить пароль
$ pass rm example.com
Are you sure you would like to delete example.com? [y/N] y
removed '/home/sergey/.password-store/example.com.gpg'
```

Базу паролей можно разместить на Google Диск.

Ссылки:

* [Pass — утилита для хранения паролей в Linux](http://www.spy-soft.net/linux-xranenie-parolej/);
* [Приложение для Android](https://github.com/zeapo/Android-Password-Store);
* [Устаревшее расширение для Chrome](https://github.com/browserpass/browserpass-legacy).

# Частые проблемы

## Система не грузится дальше rootfs

Нужно пофиксить разделы:

```bash
fsck -y <device>
```

Пример: у нас на диске есть два ntfs раздела раздела, а за ними идет раздел Linux, мы в Windows удаляем ntfs-2, а размер ntfs-1 увеличиваем на все освободившееся пространство, в итоге Windows выходит за свои границы и портит раздел Linux. Вывод: нужно между разделами Windows и Linux оставлять пару мегабайт свободного места.

## Grub Rescue

Чаще всего эта ошибка происходит после переименования логических разделов LVM, подразделов Btrfs, переноса системы на новый раздел (когда не совпадают GUID'ы).

```bash
error: ... not found.
Entering rescue mode...

# Для начала нужно посмотреть все устройства и разделы
grub rescue> ls
(hd0) (hd1) (hd1,gpt1) (hd2) (hd2,gpt5) (hd2,gpt4) (hd2,gpt3) (hd2,gpt2) (hd2,gpt1) (hd3,gpt2) (hd3,gpt1) (hd4) (hd5)

# Мы помним, что наша система находится на 5 разделе, так что тут гадать не нужно
grub rescue> set prefix=(hd2,gpt5)/@/boot/grub
# «@» ‒ это имя подраздела Btrfs. Для обычного Ext4 раздела, команда будет выглядеть так:
#
#   set prefix=(hd2,gpt5)/boot/grub
#
# А для LVM:
#
#  set prefix=(lvm/arch-root)/boot/grub
grub rescue> set root=(hd2,gpt5)

# Проверим
grub rescue> ls /
@/ @home

# Да, это наш корневой раздел Linux
# Теперь можно загрузиться в систему
grub rescue> insmod normal
grub rescue> normal
```

После загрузки системы нужно переустановить grub:

```bash
$ sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Arch Linux"
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Случайно нажали Ctrl + Alt + F* и экран стал темным

Это переключение между виртуальными терминалами. с 1-6 текстовые, остальные ‒ графические. В gdm `Ctrl+Alt+F1` ‒ логин в систему, `Ctrl+Alt+F2` ‒ рабочий стол. В lightdm переключиться на рабочий стол можно нажатием `Ctrl+Alt+F7`.

## Что делать, если каталоги открываются в VSCode?

Существует файл /usr/share/applications/mimeinfo.cache. В нем хранятся ассоциации между mime-типами и приложениями. Его редактирование исправляет проблему, НО такое решение является временным, так как этот файл генерируется при каждом обновлении системы из *.desktop файлов.

Нужно отредактировать MimeType (я его просто закомментировал) в /usr/share/applications/visual-studio-code.desktop и обновить mimeinfo.cache:

```bash
$ sudo nano /usr/share/applications/visual-studio-code.desktop
...
# MimeType=text/plain;inode/directory;
...
$ sudo update-desktop-database /usr/share/applications
```

## Enter password to unlock your login keyring

<s>
В один прекрасный день Chrome выдаст такое предупреждение, после чего перестанут сохраняться пароли и не будет работать автозаполнение форм для логина.

Решение:

```bash
# можно нажать `Super+A` и поискать приложение `passwords and keys`
$ seahorse &

# Если пакет не установлен
$ yay -S seahorse
```

![image](https://user-images.githubusercontent.com/12753171/61012059-723e6d00-a36c-11e9-8fbb-8e0b8ca26e5e.png)

Удаляем вкладку Login:

![image](https://user-images.githubusercontent.com/12753171/61012086-88e4c400-a36c-11e9-84c6-f8d17c0acc6c.png)

Другой вариант удалить все кейринги вручную:

```bash
$ rm -rf ~/.local/share/keyrings
```

Далее удаляем настройки Chrome:

```bash
$ rm -rf ~/.config/google-chrome
```

Теперь остается только перезапустить Chrome.
</s>

Это окошко появляется, в случае если пароль от keyring не совпадает с паролем пользователя.

Ставим менеджер паролей:

```zsh
$ yay -S seahorse
```

Запускаем его и меняем пароль для keyring на пароль пользователя.

# Справка по командам и т.д.

## [Cheat.sh](https://github.com/chubin/cheat.sh)

Ищет на stackoverflow и других ресурсах справку по командам и языкам программирования.

Установка:

```bash
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh

# Так же требуются пакеты xsel и rlwrap
yay -S xsel rlwrap
```

Использование:

```bash
# Интерактивный режим
$ cht.sh --shell <language>
$ cht.sh --shell bash
type 'help' for the cht.sh shell help
cht.sh/bash> for
# shell - Bash 'for' loop syntax?
#
# Replace

for (($i=0...

# with

for ((i=0;i<10;i++))

# [jman] [so/q/6854118] [cc by-sa 3.0]
cht.sh/bash>

$ cht.sh go create file
/*
 * go - Create an empty text file
 *
 * Don't try to check the existence first, since you then have a race if
 * the file is created at the same time. You can open the file with the
 * O_CREATE flag to create it if it doesn't exist:
 */

os.OpenFile(name, os.O_RDONLY|os.O_CREATE, 0666)

// [JimB] [so/q/35558787] [cc by-sa 3.0]

# Небольшой туториал по языку
$ cht.sh python :learn
```

## [Marker](https://github.com/pindexis/marker)

Установка:

```bash
$ git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py
```

* Ctrl-space: search for commands that match the current written string in the command-line.
* Ctrl-k (or marker mark): Bookmark a command.
* Ctrl-t: place the cursor at the next placeholder, identified by '{{anything}}'
* marker remove: remove a bookmark

![image](https://user-images.githubusercontent.com/12753171/61332778-a3a7b480-a814-11e9-88cb-cdbff8cf5734.png)

Пользовательские команды хранятся в `~/.local/share/marker/user_commands.txt`.

Пример:

```
yay -S {{package}}##install package
yay -S --noconfirm {{package}}##install package without confirmations
yay -Ss {{search}}##search packages
yay -Si {{package}}##package information
yay -Sc##clean
yay -Syu##update all packages
yay -Ps##print system stats
yay -Pu##print list of packages that needs to be updated
yay -Rns {{package}}##remove package
exec "$SHELL"##reload shell
```

"Встроенные" в `/home/sergey/.marker/tldr/`.

## [TLDR](https://github.com/tldr-pages/tldr)

Этим я пользовался до cht.sh.

```bash
$ npm i tldr -g
```

Получаем краткую справку по команде:

```bash
$ tldr nvm
✔ Page not found. Updating cache...
✔ Creating index...

  nvm

  Install, uninstall or switch between Node.js versions.
  Supports version numbers like "0.12" or "v4.2", and labels like "stable", "system", etc.
  Homepage: https://github.com/creationix/nvm.

  - Install a specific version of Node.js:
    nvm install node_version

  - Use a specific version of Node.js in the current shell:
    nvm use node_version

  - Set the default Node.js version:
    nvm alias default node_version

  - List all available Node.js versions and highlight the default one:
    nvm list

  - Uninstall a given Node.js version:
    nvm uninstall node_version

  - Launch the REPL of a specific version of Node.js:
    nvm run node_version --version

  - Execute a script in a specific version of Node.js:
    nvm exec node_version node app.js


```

# Шпаргалка по командам Shell

```bash
# ==============================================================================
#
# Основы синтаксиса
#
# ==============================================================================

# $1, $2, $3, ... are the positional parameters.
# "$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
# "$*" is the IFS expansion of all positional parameters, $1 $2 $3 ....
# $# is the number of positional parameters.
# $- current options set for the shell.
# $$ pid of the current shell (not subshell).
# $_ most recent parameter (or the abs path of the command to start the current shell immediately after startup).
# $IFS is the (input) field separator.
# $? is the most recent foreground pipeline exit status.
# $! is the PID of the most recent background command.
# $0 is the name of the shell or shell script.

# присвоить значение переменной
x=42

# Для вывода используем echo и printf
echo "x=$x"
echo "x=${x}"
printf "x=%s\n" x

# Если переменная не задана, то присваиваем ей дефолтное значение
x=${x:-default}

# $ { varname :- word }
# If varname exists and isn’t null, return its value; otherwise return word.

# Purpose:
# Returning a default value if the variable is undefined.

# Example:
# ${count:-0} evaluates to 0 if count is undefined.

# $ { varname := word}
# If varname exists and isn’t null, return its value; otherwise set it to word and then return its value. Positional and special parameters cannot be assigned this way.

# Purpose:
# Setting a variable to a default value if it is undefined.

# Example:
# $ {count := 0} sets count to 0 if it is undefined.

# $ { varname :? message }
# If varname exists and isn’t null, return its value; otherwise print varname : followed by message, and abort the current command or script (non-interactive shells only). Omitting message produces the default message parameter null or not set.

# Purpose:
# Catching errors that result from variables being undefined.

# Example:
# {count :?” undefined! " } prints “count: undefined!” and exits if count is undefined.

# $ { varname :+word }
# If varname exists and isn’t null, return word; otherwise return null.

# Purpose:
# Testing for the existence of a variable.

# Example:
# $ {count :+ 1} returns 1 (which could mean “true”) if count is defined.


# $ { varname : offset }
# $ { varname : offset:length }

# Purpose:
# Returning parts of a string (substrings or slices).

# Example:
# If count is set to frogfootman, $ {count :4} returns footman. $ {count :4:4} returns foot.

# Экспорт глобальной переменной
export VAR=42

# Генерация строк с помощью Brace expansion
$ echo a{d,c,b}e
ade ace abe

# Массивы

arr=(Hello World)

echo ${arr[0]} ${arr[1]}

${arr[*]} # Все записи в массиве
${!arr[*]} # Все индексы в массиве
${#arr[*]} # Количество записей в массиве
${#arr[0]} # Длина первой записи (нумерация с нуля)

array=(one two three four [5]=five)

echo "Array size: ${#array[*]}"  # Выводим размер массива

echo "Array items:" # Выводим записи массива
for item in ${array[*]}
do
  printf "   %s\n" $item
done

echo "Array indexes:" # Выводим индексы массива
for index in ${!array[*]}
do
  printf "   %d\n" $index
done

echo "Array items and indexes:" # Выводим записи массива с их индексами
for index in ${!array[*]}
do
  printf "%4d: %s\n" $index ${array[$index]}
done

# Следующий пример покажет, как кавычки и конструкции без кавычек возвращают строки (особенно важно, когда в этих строках есть пробелы):

array=("first item" "second item" "third" "item")

echo "Number of items in original array: ${#array[*]}"
for ix in ${!array[*]}
do
  printf "   %s\n" "${array[$ix]}"
done
echo

arr=(${array[*]})
echo "After unquoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "   %s\n" "${arr[$ix]}"
done
echo

arr=("${array[*]}")
echo "After * quoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "   %s\n" "${arr[$ix]}"
done
echo

arr=("${array[@]}")
echo "After @ quoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "   %s\n" "${arr[$ix]}"
done

# Циклы

for i in $(seq 1 10);
do
  echo $i
done

for ((i = 0 ; i < max ; i++ ))
do
  echo $i
done

for i in {0..10}
do
  echo $i
done

for w in word1 word2 word3
do
  doSomething($w)
done

# А вот это zsh не умеет!
for filename in *.sh
  echo "$filename"
end

i=0
while (( ++i <= num )); do
  printf 'counter is at %d\n' "$i"
done

i=1
while [ "$i" -le "$num" ]; do
  printf 'counter is at %d\n' "$i"
  i=$(( i + 1 ))
done

# Условия

if [ "$seconds" -eq 0 ]; then
  timezone_string="Z"
elif [ "$seconds" -gt 0 ]; then
  timezone_string=$(printf "%02d:%02d" $((seconds/3600)) $(((seconds / 60) % 60)))
else
  echo "Unknown parameter"
fi

# В условиях нужно использовать двойные скобки

# [ is just a regular command with a weird name.
# ] is just an argument of [ that prevents further arguments from being used.

# [[ a = a && b = b ]]: true, logical and
# [ a = a && b = b ]: syntax error, && parsed as an AND command separator cmd1 && cmd2just an argument of [ that prevents further arguments from being used.

# x='a b'; [[ $x = 'a b' ]]: true, quotes not needed
# x='a b'; [ $x = 'a b' ]: syntax error, expands to [ a b = 'a b' ]

# Подробнее тут:
#   <https://stackoverflow.com/a/47576482>

# -eq
# is equal to

[ "$a" -eq "$b" ]

# -ne
# is not equal to

[ "$a" -ne "$b" ]

# -gt
# is greater than

[ "$a" -gt "$b" ]

# -ge
# is greater than or equal to

[ "$a" -ge "$b" ]

# -lt
# is less than

[ "$a" -lt "$b" ]

# -le
# is less than or equal to

[ "$a" -le "$b" ]

# <
# is less than (within double parentheses)

(("$a" < "$b"))

# <=
# is less than or equal to (within double parentheses)

(("$a" <= "$b"))

# >
# is greater than (within double parentheses)

(("$a" > "$b"))

# >=
# is greater than or equal to (within double parentheses)

(("$a" >= "$b"))

# <http://tldp.org/LDP/abs/html/comparison-ops.html>

# [ ‒ это всего лишь команда, последним аргументом которой всегда должна быть "]"! Все операторы описаны в man'е:
man [

# Это вполне себе валидное выражение
"[" 1 -eq 0 "]" || echo fail

# Строка слева всегда имя переменной
x=42; [[ "x" -eq "42" ]] || echo fail

# выражение слева всегда переменная

case $VAR in
  foo) ... ;;
  bar) ... ;;
  # Все остальные значения
  *) ... ;;
esac

# Объявление функции
foo() {
  # Аргументы функции
  $1..$N
  # Локальная переменная
  local x=42
  ...
  # Теперь в $1 будет $2, в $2 ‒ $3 и т.д.
  shift
}

# Экспорт функции
export -f foo

die() { echo "$*" 1>&2 ; exit 1; }
...
die "Kaboom"

[ "$#" -eq 2] || die "Needs 2 arguments, input and output"

# The syntax is token-level, so the meaning of the dollar sign depends on the token it's in. The expression $(command) is a modern synonym for `command` which stands for command substitution; it means, run command and put its output here. So

echo "Today is $(date). A fine day."

# Управление выводом

# Направить stdout одной программы в stdin другой
command1 | command2

# Перенаправление stdout и stderr
command1 |& command2

# Создать либо перезаписать файл, добавив строку
command > out

# Создать файл, если его не существует и дописать строку в конец
command >> out

# Направить stderr команды в файл
command 2>&1 out

# stdout 2-ой команды, является stdin для первой
command1 <<< command2

# Вывод многострочного текста
cat <<EOF
хуй
пизда
джигурда
EOF

cat >> /path/to/file <<EOL
хуй
пизда
джигурда
EOL

# ==============================================================================
#
# Написание скриптов
#
# ==============================================================================

# Первой строкой скрипта идет Shebang, торый указывает какой интерпретатор использовать

#!/usr/bin/env bash

# При наличии ошибок прекратит выполнение сценария
set -e

# Так же часто делают каталог скрипта рабочим (по-умолчанию рабочим является тот откуда запустили скрипт)
cd "$(dirname "$0")"

# ==============================================================================
#
# Выполнение скриптов
#
# ==============================================================================

# Сделать файл исполняемым
$ chmod +x /path/to/file

# Выполнит скрипт в текущем процессе (переменные и функции, объявленные внутри скрипта станут доступны в терминале)
$ source /path/to/file

# ==============================================================================
#
# Запуск команд
#
# ==============================================================================

# Запустить процесс и вернуть его дескриптор (при закрытии терминала будет остановлена)
$ command &

# То же самое за исключением того, что процесс не будет остановлен при закрытии терминала
$ nohup command &

# ==============================================================================
#
# Пакеты
#
# ==============================================================================

# Установить пакет
$ yay -S <package>

# Удалить пакет
$ yay -Rns <package>

# Обновить все установленные пакеты
$ yay -Syu

# Обновить в т.ч. с пакетами для разработчика
$ yay -Syu --devel --timeupdate

# Очистить кеш
$ yay -Sc

# Удалить все ненужные зависимости
$ yay -Yc

# Статистика по пакетами
$ yay -Ps

# Generates development package DB used for devel updates
$ yay -Y --gendb

# Ошибки с удалением зависимостей

$ yay -Rns gnome-extra
checking dependencies...
error: failed to prepare transaction (could not satisfy dependencies)
:: nautilus: removing nautilus-sendto breaks dependency 'nautilus-sendto'
$ yay -Rdd nautilus-sendto

# Теперь можно снести gnome-extra

# ==============================================================================
#
# Текст
#
# ==============================================================================

# Замена в тексте
$ echo "This is a test" | sed 's/test/another test/'

# Ключ -e позволяет выполнить несколько команд:
#   sed -e 's/This/That/; s/test/another test/'

# Перевод регистра
$ echo lowercase | tr '[:lower:]' '[:upper:]'
LOWERCASE

# ==============================================================================
#
# Файловая система
#
# ==============================================================================

# Список разделов
$ sudo fdisk -l

$ sudo mkdir /mnt/usb1
# Монтировать устройство
$ sudo mount /dev/sdb1 /mnt/usb1

# Размонтируем устройство
$ sudo umount /dev/sdb1
# или
$ sudo umount /mnt/usb1

# Сменить владельца и группу для файла
$ sudo chown $USER:$USER /path/to/file

# В Linux все файлы. Регулярные файлы ‒ обычные файлы, каталоги ‒ это файлы содержащие список файлов и т.д.

# Перемещение/переименование файла
$ mv <src> <dst>

# Копирование файлов
$ cp <src> <dst>

# Копировать каталог и все вложенные файлы
$ cp -r <src> <dst>

# Полный путь до файла
$ realpath example.txt
/home/username/example.txt

# Листинг каталога
$ ls
$ tldr ls

# Вывести информацию о владельце и группе файла
$ ls -ld /path/to/file
$ stat /path/to/file

# Вывести все вложенные файлы
$ ls -R <path>
$ find <path> -print

# Покажет имя и размер
$ du -a <path>

# Размер всех файлов с расширеним .txt
$ du -chs *.txt

# Создание каталога
$ mkdir <target>

# Создание каталога вместе с родительскими каталогами, если тех не существует
$ mkdir -p <target>

# Создать каталог с определенными правами
$ mkdir -m 0750 <directory>

# Создание множества каталогов
$ mkdir foo bar baz
# или
$ mkdir prefix-{foo,bar,baz}

# Такой же трюк работает при создании файлов
$ touch {foo,bar,baz}.txt

# Создать мягкую ссылку на файл либо заменить ее новой
$ ln -sf path/to/new_file path/to/symlink

# Мягкая ссылка содержит путь до файла. Жесткая ссылается на inode, искомый
# файл при перемещении остается доступен по ссылке и невозможно ссылаться на
# файл на другом устройстве

# Слияние файлов в один
$ paste file1.txt file2.txt > fileresults.txt

# Удалить файлы старше 5 дней
$ find /path/to/files* -mtime +5 -exec rm {} \;

# Удалить все шрифты соответствущие шаблону *powerline* без учета регистра
# «{} \;» rm будет вызван множество раз
# «{} +» добавляет агрументы к rm
$ sudo find /usr/share/fonts -iname "*powerline*" -exec rm {} +

# Поиск фала по имени в специальной базе
$ locate -e login.keyring
/home/sergey/.local/share/keyrings/login.keyring

# Установка
$ yay -S mlocate

# Перед первым запуском следует выполнить
$ sudo updatedb

# После установки будет доступен сервис updatedb.timer, который будет ежедневно обновлять базу

# Стастика
$ locate -S
Database /var/lib/mlocate/mlocate.db:
	157 512 directories
	1 384 522 files
	119 423 666 bytes in file names
	38 722 751 bytes used to store database

# Поиск исполняемых файлов, исходников и страниц манула
$ whereis <q>

# Покажет что куда смонтировано (можно свободное место узнать)
$ df -h --total

# Узнать на каком разделе смонтирован каталог
$ df -h /tmp

# Просмотр числа inode
$ df -i

# Просмотр содержимого фйала с навигацией
$ less /path/to/file

# или более короткая версия в ZSH
$ < /path/to/file

# Просмотр логов в реальном времени
$ tail -f /var/log/syslog | less

# Вывести строки не соответствующие шаблону
$ grep -Pv <exclude_pattern> <filename>

# Создать файл, забитый null-байтами
$ dd if=/dev/zero of=/tmp/nullbytes bs=1M count=1

# Конфертировать .md в .rst
$ pip install m2r
$ m2r --help

# Конвертировать .webp в .png
$ yay -S libwebp
$ dwebp file.webp -o file.png

# Вывод содержимого файла с подсветкой синтаксиса
$ yay -S ccat
$ ccat ./file

# Вывести файлы в каталоге, отсортировав их по времени до доступа
$ ls -ltu <path>

# Изменить размер каталога /tmp
$ mount -o remount,size=4G /tmp/

# Подробная информация о диске
$ sudo smartctl -a /dev/nvme0

# ==============================================================================
#
# Работа с архивами
#
# ==============================================================================

# Заархивировать каталог
$ tar -czvf filename.tar.gz directory

# Для извлечения файлов проще всего пользоваться плагином Oh My ZSH extract

# Извлечь архив и удалить его (ключ -r)
$ extract -r <filename>

# Извлечь .tar.gz
$ tar zxvf <yourfile>.tar.gz -C /usr/src/

# Скачать и Распаковать Архив с помощью WGET
$ wget http://example.com/archive.tar -O - | tar -x
$ wget http://example.com/archive.tar.gz -O - | tar -xz
$ wget http://example.com/archive.tar.bz2 -O - | tar -xj

# Скачать и Распаковать Архив с помощью CURL
$ curl http://example.com/archive.tar | tar -x
$ curl http://example.com/archive.tar.gz | tar -xz
$ curl http://example.com/archive.tar.bz2 | tar -xj

# ==============================================================================
#
# Сеть
#
# ==============================================================================

# Показать все прослушиваемые и установленные порты TCP и UDP вместе с PID
# связанного процесса
$ netstat -plantu

# Все запущенные сервера на хосте
$ netstat -lnt

# Скачать файл в каталог
$ wget -P $ZSH_CUSTOM/themes https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# ==============================================================================
#
# Шрифты
#
# ==============================================================================

# Список установленных шрифтов
$ fc-list

# Обновить базу шрифтов после добавления/удаления их в/из `/usr/share/fonts`
# либо `~/.local/share/fonts`
$ fc-cache -f -v

# ==============================================================================
#
# Буфер обмена
#
# ==============================================================================

$ yay -S xclip

# Скопировать текст в буфер обмена
$ echo 123 | xclip -sel clip

# Копировать содержимое файла в буфер обмена
$ xclip -sel clip < ~/.ssh/github_rsa.pub

# Вывести содержимое буфера обмена
$ xclip -o -sel clip

# Конвертировать файл в base64 и скопировать в буфер обмена
$ file="test.docx"
$ base64 -w 0 $file  | xclip -selection clipboard


# ==============================================================================
#
# Языковые настройки
#
# ==============================================================================

# Список влюченных локалей
$ locale -a

# Добавление локалей

# В этом файле находится список всех поддерживаемых локалей
# Раскомментируем нужную
$ sudo nano /etc/locale.gen

# Генерируем локали
$ sudo locale-gen

# Можно так же локали так добавлять
$ sudo locale-gen de_DE.UTF-8

# Меняем язык системы (нужно перегрузиться)
echo "LANG=de_DE.UTF-8" > /etc/locale.conf

# ==============================================================================
#
# Генерация паролей
#
# ==============================================================================

$ yay -S pwgen
$ pwgen -cnsy 10 1
1u_dr<ZLH;

$ pip install xkcdpass
$ xkcdpass -n 3 -d -
backdrop-unruly-yodel
$ xkcdpass -n 3 -d - --min 2 --max 6
shrank-trio-thong

# ==============================================================================
#
# Прочее
#
# ==============================================================================

# Перегрузить Shell
$ exec "$SHELL"

# Список всех доступных команд
$ compgen -c

# Ищем Chrome
$ compgen -c | grep chrome
google-chrome-stable
chrome-gnome-shell
google-chrome

# Просмотр логов в реальном времени
$ journalctl -f

# Изменить размер терминала
$ gnome-terminal --geometry 135x45

# Документация по командам
$ tldr cat
$ tldr --search create file

```

Ссылки:

* [Цвет и форматирование текста в консоли](https://misc.flogisoft.com/bash/tip_colors_and_formatting);
* [Поиск файлов на Сервере](https://www.8host.com/blog/ispolzovanie-find-i-locate-dlya-poiska-fajlov-na-servere-linux/);
* [Файловая система Linux](https://opencentr.ru/article/fajlovaya-sistema-linux/);
* [Inode](https://ru.wikipedia.org/wiki/Inode);
* [Управление разделами LVM](https://web.mit.edu/rhel-doc/5/RHEL-5-manual/Deployment_Guide-en-US/s1-disk-storage-lvm.html);
* [Часто используемые команды Git](https://carolinegabriel.com/used-git-commands-copy-paste-format/);
* [Использование регулярных выражений](https://www.tutorialspoint.com/unix/unix-regular-expressions)

---

# i3: Введение

***i3*** &ndash; это тайловый оконный менеджер для Linux. Тут настройки под меня.

# i3: Установка и настройка

```bash
$ yay -S awesome-terminal-fonts bumblebee-status compton fonts-powerline dmenu i3-gaps i3lock-fancy-git lxappearance nitrogen rofi scrot termite xclip
$ sudo nano /usr/share/xsessions/i3-custom.desktop
[Desktop Entry]
Name=i3 custom
Exec=/usr/local/bin/i3-custom
Type=Application
$ sudo nano /usr/local/bin/i3-custom
#!/bin/bash
mkdir -p ~/.config/i3/logs
export TERMINAL=termite
exec i3 -V >> ~/.config/i3/logs/$(date +'%F-%T').log 2>&1
$ sudo chmod +x /usr/local/bin/i3-custom
$ i3-config-wizard
$ cp /etc/xdg/termite/config ~/.config/termite/config
$ nano ~/.config/termite/config
[options]
# ...
font pango:Inconsolata, Font Awesome 10
# ...
[colors]
# ...
# 20% background transparency (requires a compositor)
background = rgba(63, 63, 63, 0.8)
$ cp /etc/xdg/compton.conf ~/.config
$ nano ~/.config/i3/config
# ...
font pango:Droid Sans 10
# ...
# Заменяем все Mod1 на $m и создаем переменную выше вызовов bindsym
set $m Mod1

# lockscreen
bindsym Ctrl+$m+l exec i3lock

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Touchpad controls
bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# rofi
bindsym $m+t exec "rofi -combi-modi window,drun -show combi"

# захватывает весь экран и копирует в буфер обмена
bindsym --release Print exec "scrot /tmp/%F_%T_$wx$h.png -e 'xclip -selection c -t image/png < $f && rm $f'"
# захватывает область экрана и копирует в буфер обмена
bindsym --release Shift+Print exec "scrot -s /tmp/%F_%T_$wx$h.png -e 'xclip -selection c -t image/png < $f && rm $f'"
# ...
bar {
  set $disk_format "{path}: {used}/{size}"
  status_command bumblebee-status -m nic disk:root disk:home cpu memory sensors pulseaudio datetime layout pacman -p root.left-click="nautilus /" root.format=$disk_format home.path=/home home.left-click="nautilus /home" home.format=$disk_format -t solarized-powerline
  position top
}
# ...
# отступы между окнами
gaps outer -10
gaps inner 20

floating_minimum_size 75 x 50
floating_maximum_size -1 x -1
# Убрать рамки у окон:
# 1)
# new_window pixel 0
# 2)
# for_window [class="^.*"] border none
# force floating for all new windows
# for_window [class=".*"] floating enable
for_window [class="Nautilus" instance="file_progress"] floating enable
for_window [class="^Telegram"] floating enable, resize set 800 600
# Всплывающие окна браузера
for_window [window_role="pop-up"] floating enable
# no_focus [window_role="pop-up"]
# прозрачность терминала
exec --no-startup-id compton --config ~/.config/compton.conf
# смена расскладки
exec --no-startup-id setxkbmap -model pc105 -layout us,ru -option grp:ctrl_shift_toggle
# восстановление заставки рабочего стола
exec --no-startup-id nitrogen --restore
```

Нужно выйти из сессии и выбрать в Display Manager сессию `i3 custom`.

**LXAppearance**  используется для изменения значков, шрифта по-умолчанию в приложениях.

**Nitrogen**  позволяет менять обои.

Для изменения оформления i3 &ndash; служит [i3-style](https://github.com/acrisci/i3-style):

```bash
$ yay -S i3-style
$ i3-style archlinux -o ~/.config/i3/config --reload
```

# XTerm

Вместо `Ctrl+Shift+V`  нужно использовать `Shift+Ins`, а вместо `Ctrl+Shift+C` &ndash; `Ctrl+C`. Права кнопка мыши копировать, клик по колесику &ndash; вставить.

# Termite: горячие клавиши

| Сочетание <img width=450> | Значение <img width=450> |
| -- | -- |
| `ctrl-shift-x` | activate url hints mode |
| `ctrl-shift-r` | reload configuration file |
| `ctrl-shift-c` | copy to CLIPBOARD |
| `ctrl-shift-v` | paste from CLIPBOARD |
| `ctrl-shift-u` | unicode input (standard GTK binding) |
| `ctrl-shift-e` | emoji (standard GTK binding) |
| `ctrl-tab` | start scrollback completion |
| `ctrl-shift-space` | start selection mode |
| `ctrl-shift-t` | open terminal in the current directory [1]_ |
| `ctrl-shift-up` | scroll up a line |
| `ctrl-shift-down` | scroll down a line |
| `shift-pageup` | scroll up a page |
| `shift-pagedown` | scroll down a page |
| `ctrl-shift-l` | reset and clear |
| `ctrl-+` | increase font size |
| `ctrl--` | decrease font size |
| `ctrl-=` | reset font size to default |

[Отсюда](https://github.com/thestinger/termite#keybindings).

# Termite: цветовые схемы

```bash
$ curl https://raw.githubusercontent.com/khamer/base16-termite/master/themes/base16-nord.config >> ~/.config/termite/config
$ nano ~/.config/termite/config
# 4-ое значение отвечает за прозрачность (1 - непрозрачно, 0 - абсолютная прозрачность)
background          = rgba(40, 44, 52, 0.8)
```

# i3: заставка lockscreen

```bash
$ yay -S i3lock-fancy-git
$ nano ~/.config/i3/config
# параметр -B делает фоном lockscreen скриншот экрана с размытием
bindsym Ctrl+$m+l exec i3lock-fancy -gpf Ubuntu -- scrot -z
```

[Репозиторий](https://github.com/khamer/base16-termite).

# i3: сохранение/восстановление рабочего пространства

```bash
# Сохранение
i3-save-tree --workspace 1 > ~/.i3/workspace-1.json
# Восстановление
i3-msg "workspace 1; append_layout ~/.i3/workspace-1.json"
```

Требует установки зависимостей.

[Документация](https://i3wm.org/docs/layout-saving.html).

--

# Анимированные обои

```bash
$ yay -S komorebi
```

[Видео-инструкция](https://www.youtube.com/watch?v=Q7O8Aadz31c).

# Ошибки при установке расширений для Gnome

Посмотрить их можно так:

```bash
$ journalctl /usr/bin/gnome-shell -f
```

Либо можно нажать `Alt+F2` и ввести `lg` и поебаться с консолечкой. Закрыть ее можно с помощью клавиши `Esc`.
