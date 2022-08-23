#!/bin/sh
#不用qq邮箱自己将"smtp.qq.com:465"换成你用的邮箱的smtp域名及端口
cp ssmtp.conf.bak ssmtp.conf
echo "root=$mail_username" >> ssmtp.conf
echo "mailhub=smtp.qq.com:465" >> ssmtp.conf 
echo "AuthUser=$mail_username" >> ssmtp.conf
echo "AuthPass=$mail_password" >> ssmtp.conf
echo "UseTls=Yes" >> ssmtp.conf
cp revaliases.bak revaliases
echo "${USER}:$mail_username:smtp.qq.com:465" >> revaliases

