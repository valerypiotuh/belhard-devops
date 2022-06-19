#!/bin/bash

#Завершене скрипта в случае ошибок
#set -Eeuo pipefail
#set -x


#Ввод директории поиска
read -r -p "Введите директорию для поиска: " searchDir

if [ ! -d $searchDir ]; then
	echo '`'$searchDir'` это не директория' && exit 1
fi


#Ввод слов для поиска
echo "Введите слова для поиска: " && read -r -a searchwords
if [ ${#searchwords[*]} -eq 0 ]; then
	echo "Слова не введены" && exit 1
fi


read -r -p $'Выберите способ поиска (без учета регистра):\n 1 - Поиск точного совпадения слов(а) выделенного пробелами \n 2 - Поиск с оканчаниями, возможными знаками препинания\n' userchose

	case $userchose in

	1)
		for i in "${searchwords[@]}"; do
                echo "Количество слов "$i" = " $(grep -irow "$i" $searchDir 2>./logfind.txt | wc -l)
                done
		;;

	2)
		for i in "${searchwords[@]}"; do
		echo "Количество слов "$i" = " $(grep -iro "\<[[:punct:]]*"$i"" $searchDir 2>./logfind.txt | wc -l)
		done
		;;
	*)
		echo "Плохой выбор=)"
		exit 1
		;;
	esac
#Проверка на запись ошибок
if [ -s ./logfind.txt ]; then
	echo "Ошибки поиска (к примеру - ошибки доступа) помещены в файл logfile.txt"
	cat ./logfind.txt

else 	echo "Ошибок поиска вроде как нет"
	cat ./logfind.txt
fi
