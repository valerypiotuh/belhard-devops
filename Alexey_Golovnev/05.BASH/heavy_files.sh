#!/bin/bash

source ./helpers.sh

### Read user input search directory path
info 'Enter search dir path:' && read -r search_dir
if [ ! -d $search_dir ]
then
  error '`'$search_dir'` is not a dir.' && exit
fi

### Read user input number of files
info 'Enter number of files:' && read -a files_count
if [[ $files_count =~ '^[0-9]+$' ]] || [ $files_count -lt 1 ]
then
  error 'Number of files should be integer and greater then 0.' && exit
fi

### Search
info 'Search loop started...'
files=$(find $search_dir -type f -printf "%s %p\n" | sort -rn | head -n $files_count | awk '{print $2}')

### Print and log result
info 'Search result:'
for file in ${files[@]}
do
  file_size=$(ls -lah $file | awk '{print $5}')
  result_info="$file_size $file"
  echo $result_info
  result_log+="\n$result_info"
done
log 'Search dir:' $search_dir'; Number of files:' $files_count'; Result:' $result_log
