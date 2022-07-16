#!/bin/bash

count1=0;
count2=0;
count3=0;
count4=0;
count5=0;

for var in $(find ~/05.bash/linux-5.10.129/linux-5.10.129)
do
if [ -f $var ]
then
result1=$(grep -o -i fuck $var | wc -l)
if [ $result1 -ge 1 ]
then
count1=$(($count1+$result1))
fi
result2=$(grep -o -i shit $var | wc -l)
if [ $result2 -ge 1 ]
then
count2=$(($count2+$result2))
fi
result3=$(grep -o -i crap $var | wc -l)
if [ $result3 -ge 1 ]
then
count3=$(($count3+$result3))
fi
result4=$(grep -o -i bastard $var | wc -l)
if [ $result4 -ge 1 ]
then
count4=$(($count4+$result4))
fi
result5=$(grep -o -i penguin $var | wc -l)
if [ $result5 -ge 1 ]
then
count5=$(($count5+$result5))
fi
fi
done
echo fuck $count1
echo shit $count2
echo crap $count3
echo bastard $count4
echo penguin $coun5
