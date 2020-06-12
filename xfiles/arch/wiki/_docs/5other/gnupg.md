---
title: GnuPG
category: Прочее
order: 2
permalink:
post_video: 
post_photo_path: 
comments: true
edit: true
---

### Цифровые подписи.

[wiki.archlinux.org](https://wiki.archlinux.org/index.php/GnuPG_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)){:target="_blank"}

Генерация, создание пары ключей.
```bash
gpg --full-gen-key
```

Просмотр списка ключей.
```bash
gpg --list-keys
gpg --list-secret-keys
gpg --list-public-keys
```

Удалить ключ.
```bash
gpg --delete-secret-keys 812549
gpg --delete-keys 812259
```

Редактировать ключ.
```bash
gpg --edit-key mail@example.com
```

Экспорт открытого ключа в текстовом виде.
```bash
gpg --armor --output pubkey.txt --export 812549
```

Экспорт закрытого ключа в текстовом виде.
```bash
gpg --armor --output privkey.txt --export-secret-keys 812549
```

Экспорт открытого ключа на keyserver.
```bash
gpg --keyserver keys.gnupg.net --send-keys 8123459
```

Импорт открытого ключа из файла.
```bash
gpg --import key.txt
```
Или по номеру.
```bash
gpg --recv keys 98F76D97B786E6A3
```

Импорт закрытого ключа.
```bash
gpg --allow-secret-key-import --import privkey.txt
```

Импорт открытого ключа с keyserver.
```bash
gpg --keyserver keys.gnupg.net --recv-keys 98F76D97B786E6A3
```

Поиск.
```bash
gpg --keyserver keys.gnupg.net --search-keys mail@example.com
```

Обновление.
```bash
gpg --keyserver keys.gnupg.net --refresh-keys
```

Пример подписи и проверки подписи.
```bash
gpg --detach-sign --no-armor ctlos.iso
gpg --verify ctlos.iso.sig ctlos.iso
```

Зашифровать файл.
```bash
gpg --encrypt-files -r A24F76A41D635F7A secret.tar
```

Расшифровать файл.
```bash
gpg --decrypt-files secret.tar.gpg
```