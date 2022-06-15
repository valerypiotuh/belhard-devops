#!/bin/bash

source ./helpers.sh

### Read user input search directory path
info 'Enter search dir path:' && read -r search_dir
if [ ! -d $search_dir ]
then
  error '`'$search_dir'` is not a dir.' && exit
fi

### Read user input of search words
info 'Enter search words:' && read -a words
if [ ${#words[*]} -eq 0 ]
then
  error 'Words were not entered.' && exit
fi

### Prepare search loop
declare -a files=($(find $search_dir -type f))
declare -A result=()
for word in ${words[@]}
do
  result[$word]=0
done

### Ask to continue
info 'Found' ${#files[*]} 'files. Continue (y/n)?' && read answer
if [ $answer != 'y' ]
then
  info 'Good bye!' && exit
fi

### Search loop
info 'Search loop started...'
for word in ${words[@]}
do
  result[$word]=$(grep -airo $word $search_dir | wc -l)
done

### Print and log result
info 'Search result:'
for word in ${words[@]}
do
  result_info="\`${word}\` used ${result[${word}]} times."
  echo $result_info
  result_log+="\n$result_info"
done
log 'Search dir:' $search_dir'; Search words:' ${words[@]}'; Result:' $result_log
