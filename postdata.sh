#!/bin/sh
. ./.config
. ./data.config
echo "-s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" -d chat_id=${chat_id} -d text="$park$building$RoomNo电量仅剩$balance，请及时充值""
if [ "$daily_post" = "false" ] && [ `expr $remind_threshold \>= ${balance%???}` -eq 0 ] #我也不知道这里为什么长这样,但是确实跑起来了...
then 
  case $post_type in
    1)
        curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" -d chat_id=${chat_id} -d text="$park$building$RoomNo电量仅剩$balance，请及时充值"
    ;;
    2)
        echo "$park$building$RoomNo电量仅剩$balance，请及时充值" | mail -s "title" $mail_add
    ;;
       
  esac
elif [ "$daily_post" = "true" ]
then
  case $post_type in
    1) 
        curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" -d chat_id=${chat_id} -d text="$park$building$RoomNo今日剩余电量为$balance"
    ;;
    2)
        echo "$park$building$RoomNo今日剩余电量为$balance" | mail -s "title" $mail_add
  esac
else
  echo 0
fi
