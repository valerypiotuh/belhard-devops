# ДЗ 05.GIT
## Создане необходимой структуры файлов\коммитов для выполнения сценариев
### Ветка `master`
Использовались команды
```
git init
touch master1
git add master1
git commit -m "add master1 file"
touch master2
git add master2
git commit -m "add master2 file"
```
Результат
```
git checkout master
git log --oneline
	321d335 (HEAD -> master) add master2 file
	34f87b8 add master1 file
```
### Ветка `staging`
Использовались команды
```
git checkout -b staging
touch staging1
git add staging1
git commit -m "add staging1 file"
touch staging2
git add staging2
git commit -m "add staging2 file"
```
Результат
```
git checkout staging
git log --oneline
	663c446 (HEAD -> staging) add staging2 file
	bb44d6c add staging1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
### Ветка `test`
Использовались команды
```
git checkout -b test
touch test1
git add test1
git commit -m "add test1 file"
```
Результат
```
git checkout test
git log --oneline
	9cda287 (HEAD -> test) add test1 file
	663c446 (staging) add staging2 file
	bb44d6c add staging1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
### Ветка `create fix/prod_is_down`
Использовались команды
```
git checkout master
git checkout -b fix/prod_is_down
touch fix1
git add fix1
git commit -m "add fix1 file"
```
Результат
```
git checkout fix/prod_is_down
git log --oneline
	ad1e5b5 (HEAD -> fix/prod_is_down) add fix1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
## Сценарии
### Сценарий 1 `Релиз в production`
Все коммиты из веток `staging` и `test` должны быть перенесены в ветку `master`

Использовались команды
```
git rebase staging master
git rebase test master
```
Результат
```
git checkout master
git log --oneline
	9cda287 (HEAD -> master, test) add test1 file
	663c446 (staging) add staging2 file
	bb44d6c add staging1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
### Сценарий 2 `Развертывание fix`
Все коммиты из ветки `fix/prod_is_down` должны быть перенесены в ветки `master` `staging` `test`

Использовались команды
```
git rebase fix/prod_is_down master
git rebase fix/prod_is_down staging
git rebase fix/prod_is_down test
```
Результат
```
git checkout master
git log --oneline
	5a5f357 (HEAD -> master) add test1 file
	cc135e6 add staging2 file
	5f604ab add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
```
git checkout staging
git log --oneline
	7bcb0f6 (HEAD -> staging) add staging2 file
	5ead49a add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
```
git checkout test
git log --oneline
	68b1660 (HEAD -> test) add test1 file
	a25831b add staging2 file
	2894d07 add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```

# ДЗ 06.BASH
## 1. Посчитать количество странных слов в ядре Linux
Скрипт `word-count.sh`:
```
#!/bin/bash
count=$(grep -ioar $1 $2 | wc -l)
echo $(date +%F_%T) "| '$1' count: " $count >> word-count.log
```
Флаги `ioar` приводят вывод команды `grep` в вид: 
1. Все совпадающие слова с игнорированием регистра
2. Каждое уникальное вхождение на новой строке
3. Каждый файл обрабатывается как текстовый
4. Поиск происходит во всех файлах во всех подкаталогах
## 2. 10 самых больших файлов в директории
Скрипт `top10files.sh`:
```
#!/bin/bash
echo $(date +%F_%T) >> top10files.log
du -ah $1 | grep -v '\s/[^.]*$' | sort -rh | head -10 >> top10files.log
echo "" >> top10files.log
```
Флаги `ah` приводят вывод команды `du` в вид: 
1. Вывод всех файлов и каталогов
2. человеко читаемый размер файлов

Флаг `-v '\s/[^.]*$'` приводят вывод команды `dgrep` в вид: 
1. Убирает из вывода информацию по каталогам

Флаги `-rh` приводят вывод команды `sort` в вид: 
1. Сортировка от большего к меньшему
2. Сортировка человеко читаемого размера файлов

# ДЗ 07.DOCKER

Содержимое `Dockerfile`
```
FROM alpine:3.16.0
RUN mkdir /app
WORKDIR /app
COPY entrypoint-speedtest.sh /entrypoint-speedtest.sh
ENTRYPOINT ["/entrypoint-speedtest.sh"]
```
Содержимое `entrypoint-speedtest.sh`
```
#!/bin/sh
apk update
apk add --no-cache curl wget git bash speedtest-cli
speedtest-cli > $(hostname -s)-speedtest.log
```
Ссылка на образ  `shadejant/speedtest` 

# ДЗ 08.NGINX
## 1 контейнер
Комманда запуска `docker run -d -p 8001:80 nginx1`

`Dockerfile-nginx1`
```
ROM alpine:latest
RUN apk update && apk add --no-cache nginx
COPY ./docker-nginx1.html /var/www/docker-nginx/docker-nginx1.html
COPY docker-nginx1.conf /etc/nginx/http.d/docker-nginx1.conf
RUN rm /etc/nginx/http.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
`docker-nginx1.conf`
```
server {
        listen 80;
	root /var/www/docker-nginx;
	index docker-nginx1.html
        location / ;
}
```
`docker-nginx1.html`
```
<html>
 <head>
   <title>nginx-docker1</title>
 </head>
 <body>
  <p>nginx-docker1</p>
 </body>
</html>
```
## 2 контейнер
Комманда запуска `docker run -d -p 8002:80 nginx2`

`Dockerfile-nginx2`
```
ROM alpine:latest
RUN apk update && apk add --no-cache nginx
COPY ./docker-nginx2.html /var/www/docker-nginx/docker-nginx2.html
COPY docker-nginx2.conf /etc/nginx/http.d/docker-nginx2.conf
RUN rm /etc/nginx/http.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
`docker-nginx2.conf`
```
server {
        listen 80;
	root /var/www/docker-nginx;
	index docker-nginx2.html
        location / ;
}
```
`docker-nginx2.html`
```
<html>
 <head>
   <title>nginx-docker1</title>
 </head>
 <body>
  <p>nginx-docker2</p>
 </body>
</html>
```
## Локальный nginx
`default`
```
Too large. See 08.nginx/default file
```
`nginx1.conf`
```
server {
        listen 8100;
        location / {
		proxy_pass http://127.0.0.1:8001;
		}
}
```
`nginx2.conf`
```
server {
        listen 8200;
        location / {
		proxy_pass http://127.0.0.1:8002;
		}
}
```

При обращении на localhost:8001 отдается страница 1 контейнера

При обращении на localhost:8002 отдается страница 2 контейнера

При обращении на localhost:8000 отдается страница локального nginx

При обращении на localhost:8100 отдается страница 1 контейнера через локальный nginx

При обращении на localhost:8200 отдается страница 2 контейнера через локальный nginx
