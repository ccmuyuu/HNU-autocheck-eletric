#!/bin/sh
cp ssmtp.conf.bak ssmtp.conf
echo "root=$mail_username" >> ssmtp.conf
echo "mailhub=smtp.qq.com:465" >> ssmtp.conf
echo "AuthUser=$mail_username" >> ssmtp.conf
echo "AuthPass=$mail_password" >> ssmtp.conf
echo "UseTls=Yes" >> ssmtp.conf
cp revaliases.bak revaliases
echo "${USER}:$mail_username:smtp.qq.com:465" >> revaliases

