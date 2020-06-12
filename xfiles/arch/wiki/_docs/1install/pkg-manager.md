---
title: Менеджеры пакетов
category: Установка
order: 3
permalink:
post_video: 
post_photo_path:
comments: true
edit: true
---

Список некоторых программ Arch Wiki [List_of_applications](https://wiki.archlinux.org/index.php/List_of_applications_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)){:target="_blank"}.

## Пакетные менеджеры — Менеджеры программ.

В Arch принято использовать консольные пакетные менеджеры. Pacman главный и установлен по умолчанию, но существуют и графические менеджеры.

Для Aur репозитория существует множество пакетных менеджеров, я на текужий момент использую **yay** и он установлен во всех моих образах. Он берет на себя роль управления не только aur пакетами, но и pacman. У него те же флаги и немного своих [https://github.com/Jguer/yay](https://github.com/Jguer/yay){:target="_blank"}.

### Графические менеджеры пакетов.

Pamac manager. Установка: `yay -S pamac-aur`  
Навигация по категориям или поиск, в настройках включите поддержку aur.

Меннеджер пакетов Gnome, хорошо использовать в связке с flatpak.  
`yay -S gnome-software gnome-software-packagekit-plugin`

## Еще один из немногих менеджеров **flatpak**.

Flatpak – это современный, прогрессивный формат самодостаточных пакетов для GNU/Linux. Он поддерживает рантаймы, изоляцию внутри песочниц, установку без наличия прав суперпользователя и многое другое.

Установка.  
`sudo pacman -S flatpak`

Основной репозиторий flatpak [flathub.org/apps](https://flathub.org/apps){:target="_blank"}.

Добавление репозитория на примере flathub.  
`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`

Удаление репозитория на примере flathub.  
`flatpak remote-delete flathub`

Обновление flatpak.  
`flatpak update`

Поиск.  
`flatpak search libreoffice`

Список пакетов в репозитории flathub.  
`flatpak remote-ls flathub`

Установка пакета в домашнюю дерикторию.  
`flatpak --user install flathub com.valvesoftware.Steam`

Разрешаем доступ в домашнюю папку для Steam.  
`flatpak override com.valvesoftware.Steam --filesystem=$HOME`

Запуск.  
`flatpak run com.valvesoftware.Steam`

Список установленых пакетов.  
`flatpak list`

Обновление пакета.  
`flatpak update com.valvesoftware.Steam`

Обновление пакетов.  
`flatpak --user update`

Удаление пакета.
```
flatpak --user uninstall com.valvesoftware.Steam
flatpak uninstall com.valvesoftware.Steam
```

После удаления приложения могут оставаться неиспользуемые рантаймы, очистим и их.  
`flatpak --user uninstall --unused`

## Дополнительный репозиторий Winepak (игры, WoT и др.).

- [https://winepak.org](https://winepak.org/){:target="_blank"}.
- [https://github.com/winepak/applications](https://github.com/winepak/applications){:target="_blank"}.

Добавление репозитория.  
`flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo`