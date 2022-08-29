#!/bin/sh
. ./.config
printjson=` curl "http://wxpay.hnu.edu.cn/api/appElectricCharge/checkRoomNo?parkNo=${ParkNo}&buildingNo=${BuildingNo}&rechargeType=2&roomNo=${RoomNo}"  -H 'X-Requested-With: XMLHttpRequest'`
rm -f $jsonfile
echo $printjson >> $jsonfile
cat $jsonfile
rm -f $datafile
echo "balance=`cat $jsonfile | jq ".data.Balance"`" >> $datafile
echo "park=`cat $jsonfile | jq ".data.ParkName"`" >> $datafile
echo "building=`cat $jsonfile | jq ".data.BuildingName"`" >> $datafile
cat $datefile
