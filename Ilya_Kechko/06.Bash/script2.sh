#!/bin/bash

read -rp "Directory for search " directory
for var in $(find $directory -mount -type f 2>/dev/null | sort -n | head -n 10)
do
echo $var 
done
