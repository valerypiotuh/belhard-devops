# Первое задание

Посчитать количество странных слов в ядре Linux.

---

Для выполнения задания был написан bash скрипт:
##### word_count.sh
```
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
```

---

Результаты выполнения скрипта логируются:
##### word_count.sh.log 
```
[2022-06-12 21:15:26] Search dir: /home/belhard/devops/linux-kernel/linux-5.18.3/; Search words: fuck shit crap bastard penguin dick; Result: 
`fuck` used 15 times.
`shit` used 141 times.
`crap` used 240 times.
`bastard` used 28 times.
`penguin` used 118 times.
`dick` used 70 times.
```

# Второе задание

Найти 10 самых больших файлов в директории.

---

Для выполнения задания был написан bash скрипт:
##### heavy_files.sh
```
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
```

---

Результаты выполнения скрипта логируются:
##### heavy_files.sh.log
```
[2022-06-12 20:46:26] Search dir: /home/belhard/devops/linux-kernel/linux-5.18.3/; Number of files: 10; Result: 
16M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_2_0_sh_mask.h
14M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h
14M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_6_1_sh_mask.h
13M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_2_3_sh_mask.h
13M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
11M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h
11M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h
7.3M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h
6.9M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h
6.6M /home/belhard/devops/linux-kernel/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dce/dce_12_0_sh_mask.h
```

---

Для дополнительной подсветки вывода и упрощения работы с логами были написаны функции-помощники:
##### helpers.sh
```
#!/bin/bash

### Colors
NOCOLOR='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'

function info() {
  echo -e ${GREEN}$@${NOCOLOR}
}

function error() {
  echo -e ${RED}'Error:' $@${NOCOLOR}
}

function warn() {
  echo -e ${ORANGE}'Warning:' $@${NOCOLOR}
}

function log() {
  echo -e '['$(date +'%Y-%m-%d %H:%M:%S')']' $@ >> $(basename $0)'.log'
}
```
