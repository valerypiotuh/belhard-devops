# 04.Git
* Создал у себя на локальной машине Git репозиторий `test_rep`
* Поочередно создал два файла и закомитил, создалась ветка `master`
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 029a23dd4593809586da0e4c867f8deda5e0710c (HEAD -> master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
* Создал и перешел на ветку `staging`, также создал два файла и *сделал комиты
```
belhard@srv-ubuntu:~/test_rep$ git log
commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (HEAD -> staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
belhard@srv-ubuntu:~/test_rep$ git checkout -b test
Switched to a new branch 'test'
```
* Создал и перешел на ветку `test`, создал файл и сделал комит
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 55b83b7b463e51fb1d62166acca2f42482924462 (HEAD -> test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
* Перешел на ветку `master`
* Создал и перешел на ветку `fix/prod_is_down`, создал файл, закомитил.
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 00159038974a372fa784a84639596d49de8dcdf0 (HEAD -> fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```

## Сценарии

### 1. Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down)

Из ветки `master` смержил все остальные ветки кроме `fix/prod_is_down`

```
belhard@srv-ubuntu:~/test_rep$ git log
commit 55b83b7b463e51fb1d62166acca2f42482924462 (HEAD -> master, test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```

### 2. Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках

Из каждой ветки смержил ветку `fix/prod_is_down`

```
belhard@srv-ubuntu:~/test_rep$ git checkout master
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit e1026859dc5246957d0f694c45687246f6bc7b5c (HEAD -> master)
Merge: 55b83b7 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:45:49 2022 +0000

    Merge branch 'fix/prod_is_down'

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 55b83b7b463e51fb1d62166acca2f42482924462 (test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1


belhard@srv-ubuntu:~/test_rep$ git checkout staging
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit ec930280368205c9a6158ffac6c5bd11d90e580f (HEAD -> staging)
Merge: c158e9b 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:46:45 2022 +0000

    Merge branch 'fix/prod_is_down' into staging

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1


belhard@srv-ubuntu:~/test_rep$ git checkout test
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit 493a8bd9fb25c60825e6f49399ed8ff4c4a5e358 (HEAD -> test)
Merge: 55b83b7 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:47:39 2022 +0000

    Merge branch 'fix/prod_is_down' into test

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 55b83b7b463e51fb1d62166acca2f42482924462
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
# 05.Bash

## 1. Посчитать количество странных слов в ядре Linux:

Переменная `word` цикла принимает значения списка искомых слов `fuck shit crap bastard penguin`
Передаю переменную `word` в `echo`. `grep $word* -airo $for_search` рекурсивно ищет совпадения в указанной директории, `wc -l` выдает количесво найденых строк
```
#!/bin/bash
for_search=~/for_test/linux-5.18.3/
for word in fuck shit crap bastard penguin
do
echo "$word count:" $(grep $word* -airo $for_search | wc -l)
done
```
Вывод скрипта:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/05.Bash$ ./word_counter
fuck count: 1688
shit count: 1242897
crap count: 48186
bastard count: 34
penguin count: 118
```
## 2. 10 самых больших файлов в директории:

Ищу только файлы (-type f) в указанной директории $1 (первый параметр), и выводит размер и имя файла (-print f)
После строится таблица и сортировка по размеру, выводятся первые 10 файлов (head -n 10)

```
#!/bin/bash
find $1 -maxdepth 1 -type f -printf '%s %f \n' | column -t | sort -rn | head -n 10
```
Вывод скрипта:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/05.Bash$ ./first10 ~/for_test/linux-5.18.3/
657442  MAINTAINERS
101311  CREDITS
65151   Makefile
22940   .mailmap
16993   .clang-format
1959    .gitignore
1327    Kbuild
727     README
555     Kconfig
496     COPYING
```

# 06.Docker

Создал файлы `dockerfile` и `entrypoint.sh`
Содержание файлов:
* dokerfile
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun$ cat 06.Docker/dockerfile
FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
```
* entrypoint.sh
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun$ cat 06.Docker/entrypoint.sh
#!/bin/sh
apk update && apk add --no-cache curl wget git bash speedtest-cli
speedtest > log.txt
```
Собрал образ:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/06.Docker$ docker build . -f dockerfile -t speedtest
```
Запустил контейнер с выводом в `~/log`:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/06.Docker$ docker run -d -v ~/log:/app speedtest
```
Содержимое log файла:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun$ cat ~/log/log.txt
Retrieving speedtest.net configuration...
Testing from Beltelecom (37.215.10.208)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by JLLC "COSMOS TV" (Minsk) [0.29 km]: 73.546 ms
Testing download speed................................................................................
Download: 69.43 Mbit/s
Testing upload speed......................................................................................................
Upload: 46.04 Mbit/s
```
Загрузил образ на DockerHub:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/06.Docker$ docker login -u <login> -p <password>
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/06.Docker$ docker tag speedtest:latest ldunicom/speedtest
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/06.Docker$ docker push ldunicom/speedtest
```
Ссылка на образ: `https://hub.docker.com/repository/docker/ldunicom/speedtest/tags?page=1&ordering=last_updated`

# 07.Nginx
Создал два файла html (по сути один, но id_docker будет менятся при сборке образа):
```
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx on docker #id_docker!</h1>
<p>If you see this page, the nginx web server on docker container #id_docker is successfully installed and
working.</p>
</body>
</html>
```
Создал два `dockerfile`, при запуске перезаписывается дефолтный `index.html`:
```
FROM nginx:latest
WORKDIR /usr/share/nginx/html/
COPY /pattern /usr/share/nginx/html/pattern.html
RUN cat ./pattern.html | sed "s/id_docker/first container/">./index.html
```
```
FROM nginx:latest
WORKDIR /usr/share/nginx/html/
COPY /pattern /usr/share/nginx/html/pattern.html
RUN cat ./pattern.html | sed "s/id_docker/second docker container/">./index.html
```
Собрал образы и запустил контейнеры:
```
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/07.Nginx$ docker run -dit -p 8100:80 nginx_srv1
e6e774733a0eba5c00e77f8156671c62e118791a4bf3f8c24a768646a652f5e3
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/07.Nginx$ docker run -dit -p 8200:80 nginx_srv2
db3950e65537a64f22fa752ba7a5c5dc57343e8f31c2b3c8183c620f5bb98cd4
belhard@srv-ubuntu:~/belhard-devops/Uladzislau_Lahun/07.Nginx$ docker ps -a
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS          PORTS                                   NAMES
db3950e65537   nginx_srv2   "/docker-entrypoint.…"   9 seconds ago    Up 8 seconds    0.0.0.0:8200->80/tcp, :::8200->80/tcp   youthful_hermann
e6e774733a0e   nginx_srv1   "/docker-entrypoint.…"   15 seconds ago   Up 14 seconds   0.0.0.0:8100->80/tcp, :::8100->80/tcp   tender_blackburn
a34e623cc1bf   nginx        "/docker-entrypoint.…"   4 hours ago      Up 4 hours      0.0.0.0:8080->80/tcp, :::8080->80/tcp   exciting_goldberg
```
Добавил переадресацию в `/etc/nginx/sites-available/default`:
```
server {
        listen 81;
        location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://localhost:8100;
        }
}
server {
        listen 82;
        location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://localhost:8200;
        }
}
```
На моей виртуалке сетевой мост, пробрасывать порты не нужно, при обращении на 81 и 82 порты идет переадресация на 8100 и 8200 порты соответственно, при обращении на 80 порт открывается стандартная страница nginx
