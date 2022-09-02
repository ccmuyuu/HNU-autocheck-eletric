#!/bin/sh
. ./.config
. ./data.config
if [ "$balance" != "null" ]
then
  if [ "$daily_post" = "false" ] && [ `echo "$remind_threshold >= ${balance%???}" | bc` -eq 1 ]
  then 
    curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" -d chat_id=${chat_id} -d text="$park$building$RoomNo电量仅剩$balance，请及时充值"
  elif [ "$daily_post" = "true" ]
  then
    curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" -d chat_id=${chat_id} -d text="$park$building$RoomNo今日剩余电量为$balance"
  else
    echo 0
  fi
else
  echo null
fi
