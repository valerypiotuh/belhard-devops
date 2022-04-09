#!/bin/bash
clear
count=0
while [ $count -le 4 ]
do read -p "Enter a valid directory name (5) attempts:" dir
count=$(($count+1))
if [ -d $dir ]; then echo  "Yes right directory! calculate size, plz wait"
du -ah $dir | sort -rh | head -10 > task2_log.log
cat task2_log.log
break
fi
echo 'Attempt #' $count

done