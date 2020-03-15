---
title: После установки
category: Установка
order: 2
post_video: 
post_photo_path: 
comments: true
edit: true
---
> Всегда помните о **Arch Wiki**, все необходимые ответы уже присутствуют, не ленитесь читать. [https://wiki.archlinux.org/index.php/Main_page)](https://wiki.archlinux.org/index.php/Main_page_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) "Arch Wiki"){:target="_blank"} Более актуальная информация на англ. языке.
{: .warning}

#### Информация о вашей системе.
`neofetch`

#### Скорость интернета.
`speedtest-cli`

#### Изменить облочку bash на **zsh**.
`chsh -s /bin/zsh`

Или на bash
`chsh -s /bin/bash`

Перезайдите в систему.

После запуска браузера **Chromium**, он может потребовать ввести пароль. Игнорируйте (оставьте пустым).  
Данная проблема возникает, если установлен **gnome-keyring**, он нужен для хранения паролей, например wi-fi.  
Или установите **seahorse**.  
`sudo pacman -S seahorse`

Измените в Меню - Инструменты - Пароли и ключи(seahorse).  
Слева. Связка ключей - Правый клик - Изменить пароль - Создаете пустой пароль.

#### Обновить ключи.
```bash
sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys && sudo pacman -Syy
```
Если ошибка.
```bash
sudo pacman -S geoip-database
```
И повторить первую команду.

#### Оптимизирование зеркал **Reflector**.

В Ctlos установлен скрипт `~/.bin/mirrors`  
Отредактируйте его под ближайшие страны, а затем запустите от обычного пользователя `mirrors`.

Либо напрямую командой.
```bash
sudo reflector -c "Russia" -c "Belarus" -c "Ukraine" -c "Poland" -f 20 -l 20 -p https -p http -n 20 --save /etc/pacman.d/mirrorlist --sort rate
```

Или по одной.
```bash
sudo reflector -c 'Russia' -f 20 -l 20 -p http -n 20 --verbose --save /etc/pacman.d/mirrorlist --sort rate
```

Проверим.
`cat /etc/pacman.d/mirrorlist`

Для поддержки 32-битных библиотек раскомментируйте репозиторий multilib.
`sudo nano /etc/pacman.conf`

Убрать **#**
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Синхронизируем.
`sudo pacman -Sy`

Обновление всей системы.
`sudo pacman -Syu`

#### Используйте алиасы.

Алиасы в `~/.alias_zsh`

В связи с тем, что **Yaourt** больше не поддерживается он был заменен на **yay**.  
**Yay** работает, как **pacman**, т.е. выполняет теже функции, поэтому я в основном использую команды yay для манипуляции с пакетами. Вот данный набор из файла.

`alias y="yay -S"` установка.  
`alias yn="yay -S --noconfirm"` установка без подтверждения.  
`alias ygpg="--mflags '--nocheck --skippgpcheck --noconfirm'"` установка и игнорирование проверки gpg ключа.  
`alias ys="yay"` поиск с дальнейшим выбором по цифре.  
`alias ysn="yay --noconfirm"` поиск с дальнейшим выбором по цифре, без подтверждения.  
`alias yc="yay -Sc"` частичная очистка кэша.  
`alias yy="yay -Syy"` синхронизация баз зеркал.  
`alias yu="yay -Syu"` обновление.  
`alias yun="yay -Syu --noconfirm"` обновление без подтверждения.  
`alias yr="yay -R"` удаление пакет(а,ов).  
`alias yrn="yay -R --noconfirm"` удаление пакет(а,ов) без подтверждения.

Пример удаления.  
`yrn htop`

И команда `cache`, для очистки кэша пакетов и оптимизация базы pacman.  
Все мои исполняемые скрипты лежат в **\~/.bin**