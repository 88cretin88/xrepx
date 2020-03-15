---
title: Screencast
category: Прочее
order: 4
permalink:
post_video: 
post_photo_path: 
comments: true
edit: false
---

Pavucontrol, discord 30% микрофон.

В audacity. Эффекты-Усиление сигнала. Новая пик. амплит. 3. Разрешить перегрузку канала.

Запись simplescreenrecorder: MKV, H.264, rate 20, superfast, vorbis 128.

Stream restream.io.
```
Live Stream (3000kbps)
rtmp://live.restream.io/live/key
flv, libx264, b/rate 3000, mp3 128
```

Скрипты `~/.bin`.

- stream - стриминг через restream.io.
- castm - запись.
- cast - запись без аудио.

Audacity.

- Выделить фрагмент без звука, Эффекты-подавление шума-создать модель шума.
- Двойной клик на дорожке(выделить всю), Эффекты-подавление шума-ок.

Изменяем голос).

- Двойной клик на дорожке(выделить всю), Эффекты-Смена высоты тона. -15, ок.
- Файл-экспорт-как mp3.
- Pavucontrol, discord 30% микрофон.
- В audacity. Эффекты-Усиление сигнала. Новая пик. амплит. 3.
- Разрешить перегрузку канала.

AvidemuxQT.

- Открыть видео.
- Аудио-Выбрать дорожку.
- Отключаем 1 дорожку по умолчанию.
- На 2 дорожку добавляем отредактированый в Audacity mp3 файл.

Kdenlive.

- Настроить-Параметры проекта по умолчанию-HD 1080i 30fps.

Или.

- Настроить-Параметры проекта по умолчанию-HD 1080p 60fps.
- Настроить-Окружение-Потоков обработки - 2.
- Сборка. Generic, MP4 (H264/AAC).

+Ускоряем сборку на MP4 (H264/AAC). `Сборка-создать сценарий`. Отредактировать скрипт. Изменить preset=faster на preset=ultrafast.

Проверить скорость работы скрипта до и после.
```bash
time ./script001.sh
```

Размер выходного файла.
```bash
du -h video.mp4
```

Результат теста. (исходник video.mkv 1:21 2,5Mb).

- HD 1080i 30fps MP4 (H264/AAC) - 7:46 4,2 Mb
- HD 1080p 60fps MP4 (H264/AAC) faster - 14:22 5,6Mb
- HD 1080p 30fps MP4 (H264/AAC) faster - 8:24 4,1Mb
- +HD 1080p 30fps MP4 (H264/AAC) ultrafast - 6:34 8.2Mb
- HD 1080p 30fps webm - 7:58 9.9Mb