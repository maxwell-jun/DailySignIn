#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
time=$(date "+%Y%m%d-%H%M%S")
if [[ ! -e `which cron` ]];then
    `apt install -y cron`
fi
if [[ ! -e `which git` ]];then
    `apt install -y git`
fi
if [[ ! -e "/etc/cron.d/github_daily.cron" ]];then
    `touch /etc/cron.d/github_daily.cron`
fi
if [[ ! -e "$basepath/daily" ]];then
    `touch $basepath/daily`
fi
echo 00 12 * * * echo "\`$time\`" >> "$basepath/daily" >> /etc/cron.d/github_daily.cron
`service crond restart`