#!/bin/bash
echo "The script may count 10 the biggest files in the directory and save result in file result.txt"
find $1 -type f -exec du -sh {} 2>/dev/null + | sort -rh | head -n 10 > result.txt 
