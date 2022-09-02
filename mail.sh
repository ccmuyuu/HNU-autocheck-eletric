#!/bin/sh
. ./.config
. ./data.config
if [ "$balance" != "null" ]
then
  if [ "$daily_post" = "false" ] && [ `echo "$remind_threshold >= ${balance%???}" | bc` -eq 1 ]
  then 
      echo "$park$building$RoomNo电量仅剩$balance，请及时充值" | mail -s "title" $mail_add
  elif [ "$daily_post" = "true" ]
  then
    echo "$park$building$RoomNo今日剩余电量为$balance" | mail -s "title" $mail_add
  else
    echo 0
  fi
else 
  echo null
fi
