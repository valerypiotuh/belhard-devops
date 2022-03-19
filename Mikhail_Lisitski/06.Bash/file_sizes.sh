#!/bin/bash

read -p "Write route of directory:" d
find $d -type f > ~/allfiles.txt
> file_sizes.txt	
for file in $(cat ~/allfiles.txt)
do	   
  du -sh $file >> file_sizes.txt
done
cat file_sizes.txt | sort -n -r | head -n 10 



