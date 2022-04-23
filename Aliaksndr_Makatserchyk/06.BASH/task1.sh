#!/bin/bash
rm task1_log.log
echo -n "kernel linux include word fuck=" >> task1_log.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "fuck" | wc -l >> task1_log.log
echo -n "kernel linux include word crap=" >> task1_log.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "crap" | wc -l >> task1_log.log
echo -n "kernel linux include word shit=" >> task1_log.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "shit" | wc -l >> task1_log.log
echo -n "kernel linux include word bastard=" >> task1_log.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "bastard" | wc -l >> task1_log.log
echo -n "kernel linux include word penguin=" >> task1_log.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "penguin" | wc -l >> task1_log.log
clear
cat task1_log.log