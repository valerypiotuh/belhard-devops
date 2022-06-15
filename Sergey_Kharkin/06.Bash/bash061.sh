#!/bin/bash

read -rp 'Какое слово ищем? : ' world

START=$(date +%s)

file_counter=0
world_counter=0


for file in `find $1 -type f`
do
	world_counter_temp=$(cat $file | grep -iwc $world) 
        world_counter=$(( $world_counter + $world_counter_temp ))
        let "file_counter=file_counter+1"
done

END=$(date +%s)
DIFF=$(( $END - $START ))

echo "Обработано " $file_counter "файлов, и в них слово " \"$world\" "содержится " $world_counter "раз"
echo "На поиск ушло " $DIFF "секунд"
