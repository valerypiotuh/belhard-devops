#!/bin/bash

#Linux ubuntu 5.15.0-39-generic #42-Ubuntu
# Читаемость скрипта херня, как и сам скрипт xD

#Делаем том для dump баз
echo -e "\033[37;1;41m Creating volume for dump \033[0m"
docker volume create fordump

echo -e "\033[37;1;41m Pulling and(or) run PGAdmin \033[0m"
docker run -d --name testbd -p 1111:80 -e PGADMIN_DEFAULT_EMAIL=admin@admin.co -e PGADMIN_DEFAULT_PASSWORD=test123 dpage/pgadmin4
echo -e "\033[37;1;41m Pulling and(or) run postgres: testbd1 \033[0m"
docker run -d --name testbd1 -e POSTGRES_HOST_AUTH_METHOD=trust -v fordump:/home postgres:alpine
echo -e "\033[37;1;41m Pulling and(or) run postgres: testbd2 \033[0m"
docker run -d --name testbd2 -e POSTGRES_HOST_AUTH_METHOD=trust -v fordump:/home postgres:alpine

database=belhard
#создаем переменную для заполнением таблицы
k="INSERT INTO devops (FirstName, LastName, Email, Age) VALUES "
for ((i=0; i < 10; i++));
do
k+="('Name$i','SecName$i','Name$i@domain.com',3$i),"
done
#обрезаем последнюю запятую и добавляем в конце ;
s=$(echo "$k" | sed 's/.$//')
s+=";"

sleep 3 #не успел посмотреть как отслеживать о запуске сокетов, без sleep не может приконектиться к сокету psql
# вывод ip для подключения серверов БД и порт для проброса pgadmin
echo -n -e "\033[37;1;41m IP for pgadmin connect testbd1: \033[0m"
docker inspect testbd1 | grep -w IPAddress | awk 'BEGIN{FS="\""}{print $4}' | tail -1
echo -n -e "\033[37;1;41m IP for pgadmin connect testbd2: \033[0m"
docker inspect testbd2 | grep -w IPAddress | awk 'BEGIN{FS="\""}{print $4}' | tail -1
echo -e "\033[37;1;41m Port for pgadmin is: \033[0m1111 Login: admin@admin.co Password: test123"

echo -e "\033[37;1;41m Create bd... \033[0m"
cat /dev/null > ./asd
docker exec -it testbd1 psql -U postgres -c "CREATE DATABASE $database;" > ./asd
#ждем пока не появиться что нить в файле либо CREATE DATABASE либо
#ошибка что уже созданна ERROR:  database "belhard" already exists
while  [ "$(cat ./asd)" = "" ] ;
do
echo "wait"
sleep 1
done

echo -e "\033[37;1;41m Create table devops... \033[0m"
cat /dev/null > ./asd
docker exec -it testbd1 psql -U postgres -d $database -c "CREATE TABLE devops ( Id SERIAL PRIMARY KEY, FirstName CHARACTER VARYING(30), LastName CHARACTER VARYING(30), Email CHARACTER VARYING(30), Age INTEGER );" > ./asd
#жде создания или ошибку что созданна
while  [ "$(cat ./asd)" = "" ] ;
do
echo "wait"
sleep 1
done

echo -e "\033[37;1;41m Fill base... \033[0m"
cat /dev/null > ./asd
docker exec -it testbd1 psql -U postgres -d $database -c "$s" > ./asd
# ждем заполнеия к примеру INSERT 0 10
while  [ "$(cat ./asd)" = "" ] ;
do
echo "wait"
sleep 1
done

echo -e "\033[37;1;41m Create dump... \033[0m"
docker exec -it testbd1 /bin/bash -c "pg_dumpall -U postgres > /home/dump_all"

#Ждем пока dump не сделается
a="$(docker exec -it testbd1 /bin/bash -c "cat /home/dump_all | grep 'PostgreSQL database cluster dump complete' | wc \-l")"
while [[ "$a" != *"1"* ]]; #еба..ну..я команда wc, хрен поймёшь что возвращает - не число ни строку -, поэтому так
do
a="$(docker exec -it testbd1 /bin/bash -c "cat /home/dump_all | grep 'PostgreSQL database cluster dump complete' | wc \-l")"
echo "wait"
sleep 1
done

echo -e "\033[37;1;41m Pulling dump into ./dump \033[0m"
docker exec -it testbd2 /bin/bash -c "cat /home/dump_all" > dump

echo -e "\033[37;1;41m Exec dump... \033[0m"
docker exec -it testbd2 /bin/bash -c "psql -U postgres -f /home/dump_all" > /dev/null

echo ""
echo -e "\033[37;1;41m Data testbd1 \033[0m"
docker exec -it testbd1 psql -U postgres -d $database -c "select * FROM devops;"

sleep 1
echo -e "\033[37;1;41m Data testbd2 \033[0m"
docker exec -it testbd2 psql -U postgres -d $database -c "select * FROM devops;"
