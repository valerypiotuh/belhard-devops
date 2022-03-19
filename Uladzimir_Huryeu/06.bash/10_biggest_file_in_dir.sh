#!/bin/bash
echo
echo "Enter the absolute path to directory"
read P
echo
cd $P
exec 6>&1
exec > /home/student/belhard_class/06.bash/10_biggest_files.txt
echo "10 biggest files in directory"
pwd
ls -alhS | grep '^-' | head -10
echo
echo "All resuls saved to 10_biggest_files.txt"
echo
exec 1>&6 6>&-
cat /home/student/belhard_class/06.bash/10_biggest_files.txt
