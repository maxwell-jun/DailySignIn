echo `date +%Y%m%d-%H%M%S` >> /home/zdk/DailySignIn/daily && cd /home/zdk/DailySignIn && git add . && git commit -m `date +%Y%m%d-%H%M%S` && git push
