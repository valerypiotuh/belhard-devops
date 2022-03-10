#!/bin/bash
echo "Enter the absolute path to directory"
read P
cd $P
ls -alhS | grep '^-' | head -10
ls -alhS | grep '^-' | head -10 > /home/student/belhard_class/06.bash/10_biggest_files.txt
echo "To see result view 10_biggest_files.txt"
