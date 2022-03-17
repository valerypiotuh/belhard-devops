Result:
=============
fuck = 14 pcs.
shit = 76 pcs.
crap = 182 pcs.
bastard = 14 pcs.
penguin = 42 pcs.
=============

#!/bin/bash

find ~/linux-5.16.11/ -type f > ~/allfiles.txt

for word in fuck shit crap bastard penguin
do
  count=0
  for file in $(cat ~/allfiles.txt)
  do
    if grep -i -q $word $file
    then
    count=$(($count+1))
    fi
  done
echo $word = $count pcs.
done
