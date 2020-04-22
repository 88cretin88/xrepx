<p align="center">
    <img src="https://i.postimg.cc/85JD0dGD/external-content-duckduckgo-com.png" alt="logo" width="260" height="120">
</p>

<h2 align="center">Wazzup WEB</h2>

<p align="center">
     Universal server monitoring script + Telegram bot notification
</p>

[![https://t.me/xruin](https://img.shields.io/badge/sponsors-0-brightgreen)](https://t.me/xruin)
[![Privatium](https://img.shields.io/github/license/xbaysal11/privatium)](https://github.com/xbaysal11/wazzup-web)
[![Github](https://img.shields.io/github/followers/xbaysal11?style=social)](https://github.com/xbaysal11)
[![Privatium](https://img.shields.io/github/stars/xbaysal11/wazzup-web?style=social)](https://github.com/xbaysal11/wazzup-web)
[![https://t.me/xruin](https://img.shields.io/badge/%F0%9F%92%AC%20Telegram-xruin-blue.svg)](https://t.me/xruin)

---

<p align="center">
    <img src="https://media.giphy.com/media/g1n3pswjr0ouc/giphy.gif" alt="wazzup-web-gif">
</p>

---

# Installation

## 1. Clone Repository
```sh
git clone https://github.com/xbaysal11/wazzup-web.git
cd wazzup-web/
chmod +x wazzup-web.sh
```

## 2. Get TOKEN and CHAT_ID

 - 1. Create bot with `@BotFather` and copy bot TOKEN
 - 2. Open your bot and type `/start`
 - 3. Get chat id here:  `https://api.telegram.org/bot<TOKEN>/getUpdates`

## 3. Configure script

Open `wazzup-web.sh` file and configure

```sh
TOKEN=<bot_token>
CHAT_ID=<chat_id>
API=https://api.telegram.org/bot$TOKEN/sendMessage

SERVER=<web_url>
LOG_FILE=<path_to_log_file>
LOG_LINES=10
MESSAGE_HEAD='SERVER IS DOWN!'
AVAILABLE_STATUS_CODE='200|301'
```

## 4. Cron
 
#### 1. Open terminal and write: 
```sh
sudo crontab -u <USERNAME> -e
```

#### 2. Add new cron tab in the cron file 
```
* * * * * bash /path/to/script/wazzup-web.sh
```

NOTE: generate time here : [crontab.guru](https://crontab.guru/#*_*_*_*_*)

---

### SPONSORS [[Become a sponsor](https://t.me/xruin)]

[![https://t.me/xruin](https://img.shields.io/badge/sponsors-0-brightgreen)](https://t.me/xruin)

---

### LICENSE

Wazzup WEB is [MIT licensed.](https://github.com/xbaysal11/wazzup-web/blob/master/LICENSE)
