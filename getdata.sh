#!/bin/sh
. ./.config
printjson=` curl "http://wxpay.hnu.edu.cn/api/appElectricCharge/checkRoomNo?parkNo=${ParkNo}&buildingNo=${BuildingNo}&rechargeType=2&roomNo=${RoomNo}"  -H 'Host: wxpay.hnu.edu.cn'  -H 'Accept-Encoding: gzip, deflate'  -H 'Connection: keep-alive'  -H 'Accept: */*'  -H 'User-Agent: Mozilla/5.0 (iPad; CPU OS 15_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 MicroMessenger/8.0.26(0x18001a30) NetType/WIFI Language/zh_CN'  -H 'Referer: http://wxpay.hnu.edu.cn/electricCharge/home/'  -H 'Accept-Language: zh-CN,zh-Hans;q=0.9'  -H 'X-Requested-With: XMLHttpRequest'`
rm -f $jsonfile
echo $printjson >> $jsonfile
cat $jsonfile
rm -f $datafile
echo "balance=`cat $jsonfile | jq ".data.Balance"`" >> $datafile
echo "park=`cat $jsonfile | jq ".data.ParkName"`" >> $datafile
echo "building=`cat $jsonfile | jq ".data.BuildingName"`" >> $datafile
cat $datefile
