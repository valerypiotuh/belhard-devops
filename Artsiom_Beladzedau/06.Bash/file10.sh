#1/bin/bash
clear
count=0
while [ $count -le 4 ]
do read -p "Enter a valid directory name (5) attempts:" dir
count=$(($count+1))
if [ -d $dir ]; then echo  "Yes right directory! calculate size, plz wait"
du -ah $dir | sort -rh | head -10 > top10.log
cat top10.log
break
fi
echo 'Attempt #' $count

done
