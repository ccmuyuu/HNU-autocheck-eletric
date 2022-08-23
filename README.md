# HNU电费自动查询
有天晚上打着打着机忽然断电所以写了这个，很丑

# 使用方法
1. fork本项目
2. 修改.config中信息
3. 在Settings的Secrets的action的右上角添加参数(自行谷歌一下):
   - telegrambot:<br>Name: BOT_TOKEN 和 Value: 你的telegrambot api<br>Name: CHAT_ID 和 Value: 你的chatid
   - email:<br>Name: MAIL_USERNAME 和 Vaule: 你的邮箱<br>Name: MAIL_PASSWORD 和 Value: 你的邮箱smtp授权码<br>(默认qq邮箱，其他邮箱自行修改smtpmail.sh中smtp地址)
   - 在加了喵
4. Actions添加workflows并运行(定时12点,自己在.github/workflow/blank.yml按utc+0改)<br>记得看眼输出的信息对不对，错了不背锅喵

# To do
各种发送方式(等一个大佬pr
<br>别急睡了喵
