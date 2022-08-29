#!/bin/sh
. ./.config
. ./data.config
if [ "$daily_post" = "false" ] && [ `expr $remind_threshold \>= ${balance%???}` -eq 0 ] #我也不知道这里为什么长这样...
then 
  curl "http://127.0.0.1:7654/send_group_msg" --data-urlencode 'group_id=12345678' --data-urlencode 'message='$park$building$RoomNo'电量仅剩$balance，请及时充值' 
elif [ "$daily_post" = "true" ]
then
  curl "http://127.0.0.1:7654/send_group_msg" --data-urlencode 'group_id=12345678' --data-urlencode 'message='$park$building$RoomNo'今日剩余电量为'$balance
else
  echo 0
fi
