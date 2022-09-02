#!/bin/sh
. ./.config
. ./data.config
if [ "$balance" != "null" ]
then
#若私聊请将send_group_msg改成send_private_msg,group_id改成user_id
  if [ "$daily_post" = "false" ] && [ `echo "$remind_threshold >= ${balance%???}" | bc` -eq 1 ] 
  then 
    curl "http://127.0.0.1:7654/send_group_msg" --data-urlencode 'group_id=12345678' --data-urlencode 'message='$park$building$RoomNo'电量仅剩'$balance'，请及时充值' 
  elif [ "$daily_post" = "true" ]
  then
    curl "http://127.0.0.1:7654/send_group_msg" --data-urlencode 'group_id=12345678' --data-urlencode 'message='$park$building$RoomNo'今日剩余电量为'$balance
  else
    echo 0
  fi
else
  echo null
fi
