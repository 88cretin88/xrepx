---
title: Ctlos iso
category: Прочее
order: 6
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

Создание iso образа Ctlos Linux для 64-bit(x86_64).

Установить пакеты для сборки.
```bash
sudo pacman -S git archiso arch-install-scripts
```

Отредактировать файл.
```bash
sudo leafpad /usr/bin/mkarchiso
```

Не обязательно, добавляет подтверждение pacman. В строки ниже добавить ключ -i перед -с, ищите pacstrap, две строки. Сохранить и выйти.
```bash
if [[ "${quiet}" = "y" ]]; then
    pacstrap -C "${pacman_conf}" -i -c -d -G -M "${work_dir}/airootfs" $* &> /dev/null
else
    pacstrap -C "${pacman_conf}" -i -c -d -G -M "${work_dir}/airootfs" $*
fi
```

```bash
mkdir ~/ctlos
cd ~/ctlos
git clone https://github.com/ctlos/ctlos_repo
```

Или ssh.
```bash
git clone git@github.com:ctlos/ctlo_repo.git
```

Сборка aur пакетов.

Найти нужный пакет на сайте аур aur.archlinux.org и загрузить snapshot вида `*.tar.gz`.

Собираем пакеты в `build`.
```bash
mkdir ~/ctlos/ctlos_repo/build
cd ~/ctlos/ctlos_repo/build
wget https://aur.archlinux.org/cgit/aur.git/snapshot/gtk3-mushrooms.tar.gz
```

Распаковываем и собираем пакет.
```bash
tar -xvzf gtk3-mushrooms.tar.gz
cd gtk3-mushrooms
makepkg -s
```

Копируем собраные пакеты в `~/ctlos/ctlos_repo/x86_64`, инициализируем репозиторий. Пакеты в формате `*.pkg.tar.xz`.
```bash
cd ~/ctlos/ctlos_repo/x86_64
repo-add ctlos_repo.db.tar.gz *.tar.xz
```

Или.
```bash
./update.sh
```

После добавления новых пакетов из aur необходимо переинициализировать репозиторий.(Удалить файлы баз данных) или запустить скрипт update.sh он сам все пересоздаст.
```bash
repo-add ctlos_repo.db.tar.gz *.tar.xz
```

Или.
```bash
./update.sh
```

Клонируем репозиторий.
```bash
cd ~/ctlos
git clone https://github.com/ctlos/ctlosiso
```
Или ssh.
```bash
git clone git@github.com:ctlos/ctlosiso.git
```
Добавляем пользовательский репозиторий для aur пакетов. В `/ctlos/ctlosiso/pacman.conf`.
```bash
[mainrepo]
SigLevel = Optional TrustAll
Server = file:///home/st/ctlos/ctlos_repo/$arch
```

Закоментировать репозиторий ctlos, если нужно.
```bash
#[ctlos_repo]
#SigLevel = Never
#Server = https://raw.github.com/ctlos/ctlos_repo/master/repo/$arch
```

Сделать скрипты исполняемыми.
```bash
cd ctlosiso
chmod a+x autobuild.sh
chmod a+x build.sh
```

Файл пакетов `~/ctlos/ctlosiso/packages.both`. Сюда прописать все пакеты и те которые собрали сами.

Для создания образа запустить.
```bash
sudo ./autobuild.sh
```

Или.
```bash
sudo ./build.sh -v
```

Готовый образ и хэши создаются в данной директории `~/ctlos/ctlosiso/out`.

Пересборка. Удалить каталоги и запустить скрипт сначала.
```bash
sudo rm -rf {out,work}
```

Или отредактировать.
```bash
nano /bin/pacstrap
```
Изменить строку, для пропуска установленных пакетов.
```bash
if ! pacman -r "$newroot" -Sy "${pacman_args[@]}"; then
```
На.
```bash
if ! pacman -r "$newroot" -Sy --needed "${pacman_args[@]}"; then
```

Удалить файлы блокировки.
```bash
sudo rm -v work/build.make_*
```

Список установленных пакетов в системе. Подробно.
```bash
LANG=C pacman -Sl | awk '/\[installed\]$/ {print $1 "/" $2 "-" $3}' > ~/pkglist.txt
```

Кратко.
```bash
pacman -Qqe > ~/pkglist.txt
```