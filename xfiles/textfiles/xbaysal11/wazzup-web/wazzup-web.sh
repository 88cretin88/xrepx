#!/bin/bash

TOKEN=<bot_token>
CHAT_ID=<chat_id>
API=https://api.telegram.org/bot$TOKEN/sendMessage

SERVER=<web_url>
LOG_FILE=<path_to_log_file>
LOG_LINES=10
MESSAGE_HEAD='SERVER IS DOWN!'
AVAILABLE_STATUS_CODE='200|301'

DATE=`date +"%m.%d.%Y"`
TIME=`date +"%H:%M:%S"`
STATUS=`wget --spider -S $SERVER 2>&1 | grep "HTTP/" | awk '{print $2,$3,$4}'`
LOG=`tail -n $LOG_LINES $LOG_FILE`

MESSAGE="${MESSAGE_HEAD}
----------------------------------------------------
Date   :    ${DATE}
Time   :    ${TIME}
----------------------------------------------------
Server :    ${SERVER}
Status :    ${STATUS}
----------------------------------------------------

Log :

${LOG}

----------------------------------------------------"


if curl -s --head --request GET $SERVER | grep -E $AVAILABLE_STATUS_CODE > /dev/null; then 
     echo "Server is UP"
else 
     curl -s -X POST $API -d chat_id=$CHAT_ID -d text="$MESSAGE"
     echo "Server is DOWN"
fi