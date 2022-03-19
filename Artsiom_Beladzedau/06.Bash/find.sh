#1/bin/bash
rm result.log
echo -n "kernel linux include word fuck=" >> result.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "fuck" | wc -l >> result.log
echo -n "kernel linux include word crap=" >> result.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "crap" | wc -l >> result.log
echo -n "kernel linux include word shit=" >> result.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "shit" | wc -l >> result.log
echo -n "kernel linux include word bastard=" >> result.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "bastard" | wc -l >> result.log
echo -n "kernel linux include word penguin=" >> result.log
find ~/linux-5.17-rc5/* | xargs grep -o -i -w "penguin" | wc -l >> result.log
clear
cat result.log
