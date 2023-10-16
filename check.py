from pagermaid import bot
from pagermaid.enums import Message
from pagermaid.listener import listener
import requests, time
from apscheduler.schedulers.background import BackgroundScheduler


schedule=BackgroundScheduler(timezone='Asia/Shanghai')
id = None

@listener(command="check",
          description="check ele of your room",
          parameters="on/off/now")
async def check(message: Message):
    if message.arguments == 'on':
        await dingshi()
    elif message.arguments == 'off':
        await del_dingshi()
    elif message.arguments == 'now':
        list=getdata()
        await bot.send_message("your group", f"{list[1]}{list[2]}room今日剩余电量为{list[0]}")
    elif message.arguments == 'cron':
        await bot.send_message("your group", schedule.get_jobs())

async def post():
    list=getdata()
    if float(list[0][:-1])<20:
        await bot.send_message("your group", f"{list[1]}{list[2]}room今日剩余电量为{list[0]}")
    else:
        await bot.send_message("your group", f"{list[1]}{list[2]}room今日剩余电量为{list[0]}")

def getdata():
    header={'X-Requested-With': 'XMLHttpRequest'}
    url='http://wxpay.hnu.edu.cn/api/appElectricCharge/checkRoomNo?parkNo=park&buildingNo=build&rechargeType=2&roomNo=room'
    respond=requests.get(url,headers=header)
    while 1:
        try:
            balance=respond.json()['data']['Balance']
            park=respond.json()['data']['ParkName']
            building=respond.json()['data']['BuildingName']
            break
        except:
            time.sleep(10)
    return balance,park,building

async def dingshi():
    global id
    if schedule.get_job(id):
        await bot.send_message("your group", schedule.get_job(id))
    else:
        job = schedule.add_job(post, 'cron', hour=12)
        schedule.start()
        id = job.id

async def del_dingshi():
    global id
    if schedule.get_job(id):
        schedule.remove_job(id)
        id = None
    else:
        await bot.send_message("your group", "未启动定时")
