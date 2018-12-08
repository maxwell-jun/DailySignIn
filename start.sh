#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
if [ ! -e `which cron` ];then
    `apt install -y cron`
fi
if [ ! -e "/etc/cron.d/github_daily.cron" ];then
    `touch /etc/cron.d/github_daily.cron`
    echo '00 12 * * * echo `date +%Y%m%d-%H%M%S` >> '$basepath/daily' && cd '$basepath' && git add . && git commit -m `date +%Y%m%d-%H%M%S` && git push' >> /etc/cron.d/github_daily.cron
fi
if [[ ! -e "$basepath/daily" ]];then
    `touch $basepath/daily`
fi
`service cron restart`