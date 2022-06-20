#!/bin/bash


#set -x


# Проверка на наличие параметра
if [ ! -n "$1" ]; then
	echo "Не введен параметр" && exit 1
fi

#Ввод директории поиска

if [ ! -d $1 ]; then
        echo '`'$1'` это не директория' && exit 1
fi

read -r -p $' Выберите режим сортировки в директории: \n 1 - Без файлов поддиректорий \n 2 - С файлами в поддиректориях \n Ваш выбор: ' chose


case $chose in
	1)
		find $1 -maxdepth 1 \! -type d -exec ls -l {} \; | sort -nrk5 | head -10
	;;
	2)
		find $1 \! -type d -exec ls -l {} \; | sort -nrk5 | head -10
	;;

	*)
		echo "Плохой выбор" && exit 1
	;;
esac

