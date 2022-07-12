#\\ДЗ//#      

#05.GIT#

##ЗАДАНИЕ:

###Создайте у себя на локальной машине Git репозиторий со следующими ветками:

   #### master - в ней 2 коммита

   #### staging - в ней 2 коммита из master + 2 дополнительных

   #### test - в ней 2 коммита из master + 2 дополнительных из staging + 1 дополнительный

   #### fix/prod_is_down - в ней 2 коммита из master + 1 дополнительный

### Предположим следующие сценарии:

    #### Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down);
    #### Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках;

### В конце этих сценариев Вы должны предоставить список коммитов в вышеуказанных ветках в качестве отчета о выполненном ДЗ.

### Все Ваши команды вставьте в файл 05.Git.txt и добавьте в свой репозиторий, затем подготовьте Pull Request.

### ВАЖНО!!! Используйте Git Markdown для своего отчета. Ссылка на документацию

### Создайте файл README.md с описанием выполненной работы. Далее Вы будете дополнять этот файл по мере готовности ДЗ.

### Дополнительно: развернуть у себя локально GitLab CE и выполнить все операции со своим локальным репозиторием.

#ПОРЯДОК РАБОТ:

#ДОБАВЛЕНИЕ ДИРЕКТОРИИ, ИНИЦИАЛИЗАЦИЯ

##cd ~/belhard-devops.old
##mkdir Shashkou_Mikalai
##cd ~/belhard-devops.old/Shashkou_Mikalai
##git_init
##mkdir 05.GIT
##cd ~/belhard-devops.old/Shashkou_Mikalai/05.GIT
##git_init

#РАБОТА В MASTER

##nano 01_commit_master (value 01_commit_master; save and exit)
##git add 01_commit_master
##git commit -m "Add file 01_commit_master"
##nano 02_commit_master (value 02_commit_master; save and exit)
##git add 02_commit_master
##git commit -m "Add file 02_commit_master"

#РАБОТА В STANDING

##git checkout -b staging
##nano 01_commit_staging (value 01_commit_staging; save and exit)
##git add 01_commit_staging
##git commit -m "Add file 01_commit_staging"
##nano 02_commit_staging (value 02_commit_staging; save and exit)
##git add 02_commit_staging
##git commit -m "Add file 02_commit_staging"

#РАБОТА В TEST

##git checkout -b test
##nano 01_commit_test (value 01_commit_test; save and exit)
##git add 01_commit_test
##git commit -m "Add file 01_commit_test"

#РАБОТА В FIX/PROD_IS_DOWN

##git checkout master
##git checkout -b fix/prod_is_down
##nano 01_commit_fix_prod_is_down (value fix/prod_is_down; save and exit)
##git add 01_commit_fix_prod_is_down
##git commit -m "Add file 02_commit_fix_prod_is_down"

#ОТРАБОТКА СЦЕНАРИЯ № 1 - РЕЛИЗ В PRODUCTION

##git checkout master
##git merge --no-ff staging
##git commit -m "Merge stanging to master"
##git merge --no-ff test
##git commit -m "Merge test to master"

#ОТРАБОТКА СЦЕНАРИЯ № 2 - РАЗВЕРТЫВАНИ FIX
##git checkout master
##git merge --no-ff fix/prod_is_down
##git checkout test
##git merge --no-ff fix/prod_is_down
##git checkout staging
##git merge --no-ff fix/prod_is_down

#COMMIT

##MASTER:

###709f904 (HEAD -> master, staging) Add file 02_commit_master
###6688307 Add file 01_commit_master

##STAGING:

###f5911cd (HEAD -> staging) Add file 02_commit_staging
###a61ef4a Add file 01_commit_staging
###709f904 (master) Add file 02_commit_master
###6688307 Add file 01_commit_master

##TEST:

###6ffc2f4 (HEAD -> test) Add file 01_commit_test
###f5911cd (staging) Add file 02_commit_staging
###a61ef4a Add file 01_commit_staging
###709f904 (master) Add file 02_commit_master
###6688307 Add file 01_commit_master

##FIX/PROD_IS_DOWN

###77ff165 (HEAD -> fix/prod_is_down) Add file 02_commit_fix_prod_is_down
###709f904 (master) Add file 02_commit_master
###6688307 Add file 01_commit_master

##MERGE TO MASTER

###e9bba4f (HEAD -> master) Merge branch 'test'
###190baae Merge stanging to master
###6ffc2f4 (test) Add file 01_commit_test
###f5911cd (staging) Add file 02_commit_staging
###a61ef4a Add file 01_commit_staging
###709f904 Add file 02_commit_master
###6688307 Add file 01_commit_master

##FIX (MERGE FROM FIX/PROD_IS_DOWN TO MASTER, TEST, STAGING)

###MERGE FROM FIX/PROD_IS_DOWN TO MASTER

####a337028 (HEAD -> master) Merge branch 'fix/prod_is_down'
####e9bba4f Merge branch 'test'
####190baae Merge stanging to master
####77ff165 (fix/prod_is_down) Add file 02_commit_fix_prod_is_down
####6ffc2f4 (test) Add file 01_commit_test
####f5911cd (staging) Add file 02_commit_staging
####a61ef4a Add file 01_commit_staging
####709f904 Add file 02_commit_master
####6688307 Add file 01_commit_master

###MERGE FROM FIX/PROD_IS_DOWN TO TEST

####77d99c2 (HEAD -> test) Merge branch 'fix/prod_is_down' into test
####77ff165 (fix/prod_is_down) Add file 02_commit_fix_prod_is_down
####6ffc2f4 Add file 01_commit_test
####f5911cd (staging) Add file 02_commit_staging
####a61ef4a Add file 01_commit_staging
####709f904 Add file 02_commit_master
####6688307 Add file 01_commit_master

###MERGE FROM FIX/PROD_IS_DOWN TO STAGING

####de99d69 (HEAD -> staging) Merge branch 'fix/prod_is_down' into staging
####77ff165 (fix/prod_is_down) Add file 02_commit_fix_prod_is_down
####f5911cd Add file 02_commit_staging
####a61ef4a Add file 01_commit_staging
####709f904 Add file 02_commit_master
####6688307 Add file 01_commit_master

#####// В комментарии к коммиту 77ff165 ошибка. Вместо "Add file 02_commit_fix_prod_is_down" считать "Add file 01_commit_fix_prod_is_down"//
#06.BASH

##ЗАДАНИЕ

1. Посчитать количество странных слов в ядре Linux:

    посмотреть по ссылке слова, которые встречаются в ядре Linux;
    скачать любую версию ядра с сайта https://www.kernel.org/ или с зеркал;
    распаковать его;
    написать скрипт для подсчета слова в текстовых файла в директориях.

2. 10 самых больших файлов в директории:

написать скрипт, который будет выводить 10 самых больших файлов в директории, которая будет указана в качестве параметра при выполнении

Добавьте в репозиторий готовые скрипты и результат их вывода, затем подготовьте Pull Request.

##РЕШЕНИЕ

Файлы заливал через SFTP (FileZilla)

1. Количество странных слов (делал циклом, директория задается в переменной core):

#1/bin/bash

core=~/teach/06.bash/core/linux-5.19-rc1/

for f in $(grep -o  -i -r -a 'fuck*' $core | wc -l)
do
echo "Всего fuck*: "$f
done

for s in $(grep -o  -i -r -a 'shit*' $core | wc -l)
do
echo "Всего shit*: "$s
done

for c in $(grep -o -i -r -a 'crap*' $core | wc -l)
do
echo "Всего crap*: "$c
done

for b in $(grep -o -i -r -a 'bastard' $core | wc -l)
do
echo "Всего bastard: "$b
done

for p in $(grep -o -i -r -a 'penguin' $core | wc -l)
do

Результат: 

Всего fuck*: 1690
Всего shit*: 1381272
Всего crap*: 52430
Всего bastard: 26
Всего penguin: 121

2. 10 самых тяжелых файлов:

#1/bin/bash

core=~/teach/06.bash/core/linux-5.19-rc1/

find $core -type f -printf "%s %p\n" | sort -rn | head -n 10

Результат:

16728123 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h
16414003 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_2_0_sh_mask.h
14373916 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h
14151728 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_6_1_sh_mask.h
12839488 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_2_3_sh_mask.h
12748346 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
11394491 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h
11368060 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h
8724349 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
7561306 /home/belhard/teach/06.bash/core/linux-5.19-rc1/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h

// RUN через ./"file_name.sh"

#07.DOCKER

##ЗАДАНИЕ:



    Зарегистрироваться на Docker Hub;
    Создать Dockerfile:
        базовый образ - Alpine Linux;
        рабочий каталог - /app;
        примонтировать локальную папку ~/log к контейнеру по пути /app;
        все, что указано ниже, должно выполняться в entrypoint.sh, а именно:
            установка пакетов curl,wget,git,bash;
            установка пакета speedtest-cli;
            проверка скорости интернет соединения с помощью пакета speedtest-cli с выводом в файл;
    Загрузить рабочий Docker образ на Docker Hub.

В качестве отчета о выполненном домашнем задании предоставить ссылку на Ваш Docker image в Docker Hub и вывод содержимого Dockerfile и entrypoint.sh.

Отчет поместить в своем рабочем каталоге в папку 07.Docker и создать Pull Request.

##РЕШЕНИЕ:

Установил docker на Debian https://docs.docker.com/engine/install/debian/

Создал Dockerfile и entrypoint.sh (названия делал свои)

Содержимое Dockerfile (Dockerfile_Shashkou):

FROM alpine:latest
RUN apk update && apk add --no-cache bash curl git wget
RUN mkdir /app
RUN curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
RUN chmod +x speedtest-cli
WORKDIR /app
COPY entrypoint_Shashkou.sh /entrypoint_Shashkou.sh
ENTRYPOINT ["/entrypoint_Shashkou.sh"]

Содержимое entrypoint.sh (entrypoint_Shashkou.sh):

#!/bin/sh
apk update && apk add speedtest-cli
speedtest-cli --bytes > log.txt

Билд: docker build . -f ./Dockerfile_Shashkou -t test1

Запуск (с прокидыванием директории, куда писать лог): docker run -d -v ~/teach/07.docker/docker_image/log:/app one

Содержимое log.txt:

Retrieving speedtest.net configuration...
Testing from Beltelecom (178.127.236.148)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Inter Plus sp. z o.o. (Chełm) [413.34 km]: 69.794 ms
Testing download speed................................................................................
Download: 4.92 Mbyte/s
Testing upload speed......................................................................................................
Upload: 4.62 Mbyte/s

Авторизировался в Docker Hub через docker login

Создал в Docker Hub репозиторий

выполнил docker tag 021c265dc77d mikola1911/belhard-shashkou-teach:latest

выполнил docker push mikola1911/belhard-shashkou-teach

Общедоступный URL моего Image: https://hub.docker.com/r/mikola1911/belhard-shashkou-teach/tags
# 08.NGINX

## ЗАДАНИЕ

    Создать 2 разные html страницы nginx для двух Docker контейнеров;
    Написать два Dockerfile для запуска nginx с этими страницами;
    Запустить 2 Docker контейнера c nginx:

    на первый Docker контейнер можно попасть по порту 8100, сам контейнер слушает порт 80;
    на второй Docker контейнер можно попасть по порту 8200, сам контейнер слушает порт 80;

    Установить на виртуальную машину nginx и настроить его как прокси сервер для Docker контейнеров;
    Пробросить порты с локальной машины на виртуальную так, чтобы в браузере:

    на порту 8000 была стандартная конфигурация nginx виртуальной машины
    на порту 8100 была конфигурация nginx из Docker контейнера №1
    на порту 8200 была конфигурация nginx из Docker контейнера №2

Конфигурационный файл для nginx на виртуальной машине, HTML файлы для Docker контейнеров, а также оба Dockerfile положить в свою директорию в папку 08.nginx, добавить README.md с описанием и создать Pull Request

Дополнительно: сделать все тоже самое, только используя docker-compose и кастомную сеть

## РЕШЕНИЕ

Выполнил билд 2-х контейнеров, предварительно создав 2 директории, в которых разместил по 1 докерфайлу, а также index.html. В докерфайле запустил установку nginx, а также копирование index.html:

docker build . -t nginx_1
docker build . -t nginx_2

Запустил 2 контейнера на портах локалхоста виртуалки 8100 и 8200 соответственно:

docker run -d -p 8100:80 nginx_1
docker run -d -p 8200:80 nginx_2

Пробросил порты в настройках виртуалки, проверил в браузере - работает.

Далее настраивал proxy

Создал в NGINX конфиг-файл docker, в котором настроил подключение к докер-контейнерам (80 порты каждого контейнера), а также к 80 порту nginx

Проверял на каком IP живут контейнеры командой docker inspect fe61f270e8c3 (ИД контейнера)

Содержимое конфига:

server {
        listen 82;

            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://172.17.0.2:8100;
            }
}


server {
        listen 83;

            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http:172.17.0.3:8200;
            }
}

server {
        listen 80;

            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:80;
            }
}

Пробросил порты в настройках машины в соответствии с заданием. Проверил в браузере - работает.

# 09.PostgreSQL

## ЗАДАНИЕ



    Поднять Docker контейнер с PostgreSQL сервером
    Поднять Docker контейнер с pgAdmin и подключиться к PosgreSQL серверу
    Создать БД под названием belhard
    Создать таблицу под названием devops с полями FirstName, LastName, Email, Age
    Заполнить таблицу данными (+- 10 строк)
    Снять дамп с текущей БД и развернуть его в новом Docker контейнере

В качестве отчета о выполненном домашнем задании предоставить файл дампа БД, а также скриншоты двух БД в pgAdmin c данными.

Отчет поместить в своем рабочем каталоге в папку 09.PostgreSQL и создать Pull Request.


## РЕШЕНИЕ

Убил все действующие контейнеры (docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q) && docker system prune --volumes -f).

Поднял 2 контейнера с PostgreSQL (docker run -d -e POSTGRES_HOST_AUTH_METHOD=trust postgres), 1 с PGAdmin (docker run -p 8888:80 -d -e PGADMIN_DEFAULT_EMAIL=admin@admin.co -e PGADMIN_DEFAULT_PASSWORD=root dpage/pgadmin4). Пробросил порты к PGAdmin, зашел в PGAdmin, добавил 2 сервера PostgreSQL.

Перешел через консоль в 1 контейнер с БД, добавил БД, создал таблицу, сделал инсерт в таблицу:

psql -U postgres

CREATE DATABASE belhard;

\c belhard;

CREATE TABLE devops
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
);

INSERT INTO devops  (FirstName, LastName, Email, Age)
VALUES
('Devops1', 'Devopsov1', 'devops1@test.com', 30),
('Devops2', 'Devopsov2', 'devops2@test.com', 31),
('Devops3', 'Devopsov3', 'devops3@test.com', 32),
('Devops4', 'Devopsov4', 'devops4@test.com', 33),
('Devops5', 'Devopsov5', 'devops5@test.com', 34),
('Devops6', 'Devopsov6', 'devops6@test.com', 35),
('Devops7', 'Devopsov7', 'devops7@test.com', 36),
('Devops8', 'Devopsov8', 'devops8@test.com', 37),
('Devops9', 'Devopsov9', 'devops9@test.com', 38),
('Devops10', 'Devopsov10', 'devops10@test.com', 39);

select * from devops;

Сделал дамп в файл pg_dumpall -U postgres > dump

Перешел в другой контейнер, установил nano (apt update && apt install -y nano), создал dump, вставил в него содержимое dump из 1-го контейнера.

Залил дамп psql -U postgres -f dump

#10.TERRAFORM

##ЗАДАНИЕ

3 ВМ в ВБ, провайдер отдельно, переменные отдельно, описание ВМ отдельно

##РЕШЕНИЕ

Создал директорию в локальной машине, перешел в неё, выполнил terrafrom init

Создал 3 файла конфигурации согласно ДЗ

выполнил terraform plan, удостоверился в отсутствии ошибок

выполнил terraform apply, завершилось с ошибками, но 3 машины создались

#11.Ansible

##ЗАДАНИЕ

    Поднять 3 виртуальные машины (можете использовать из прошлого ДЗ по Terraform)
    Установить на одну из них Ansible и изменить hostname на ansible-master
    На остальных двух виртуальных машинах изменить hostname на ansible-1 и ansible-2
    сгенерировать на ansible-master новую пару SSH ключей
    Закинуть public ключ на ansible-1 и ansible-2 и проверить, что можно подключиться по SSH с ansible-master на ansible-1 и ansible-2
    Написать ansible playbook, в котором:
        отдельный inventory файл с группами
        создается группа devops и пользователь belhard на ansible-1 и ansible-2
        устанавливаются пакеты curl, wget, unzip, zip на ansible-1 и ansible-2
        устанавливается Java 11 на ansible-1
        устанавливается nginx на ansible-2

В качестве отчета о выполненном ДЗ предоставить рабочий playbook и inventory файл, а также команды для запуска playbook. Отчет поместить в своем рабочем каталоге в папку 11.Ansible и создать Pull Request.

##РЕШЕНИЕ

Развернул 3 машины на Debian 11. Всех добавил в nat-сеть. Пробросил порты. Зашел в master, установил пакет sudo, добавил текущего юзера в sudoers, обновил python, установил ansible. Сгенерил пару ключей, загрузил их на ansible-1, 2 (хосты переименовал). Пользователей по-умолчанию в ansible-1, 2 добавил в sudoers, сделал применение sudo без пароля.

В master создал директорию ansible, в которой создал директории inventory и для playbook. В inventory добавил файл hosts, в котором создал 2 группы, в которые добавил по 1 машине - ansible-1 и 2 соответственно. Пинганул машины командой ansible -i ~/ansible/inventory/hosts -m ping all. 

Создал playbook файл в директории playbook. Файл составил в соответствии с заданием. Запустил командой ansible-playbook -i ansible/inventory/hosts ansible/playbook/playbook.yml.

#12.Jenkins

##ЗАДАНИЕ

    Установить Jenkins
    Подключить к нему 1 слейв
    Написать 2 Jenkinsfile:

    Первый:
        запускается только на слейве в Docker Alpine по Push в репозиторий
        устанавливаются пакеты curl, wget, git, bash, speedtest-cli
        клонируется свой репозиторий
        показывает список файлов в репозитории
        запустить speedtest-cli
    Второй:
        запускается локально на слейве
        лежит в GitHub
        запускает Docker контейнер из ДЗ 07.Docker
        показывает вывод docker ps -a

В качестве отчета о выполненном домашнем задании предоставить скриншоты и логи двух джоб в Jenkins (Configure), а так же 2 Jenkinsfile

Дополнительно: добавить оповещения об статусе выполнения джобы в Telegram или в Slack

##РЕШЕНИЕ

Развернул ВМ Debian 64 (slave), поставил на неё докер, Java, добавил машину в сеть Nat, пробросил порты. Сгенерировал на master ключ (SSH-keygen) и скопировал его на slave (ssh-copy-id). На slave сделал запуск doker без sudo (sudo usermod -aG docker ${USER}).

Аналогичным способом сделал доступ к slave по SSH из контейнера с Jenkins. Добавил в кредах slave private_key из контейнера с Jenkins.

Т.к. с Github были проблемы, а делать из Origina я не хочу и не могу (я ж не смогу в origin запушить Jenkinsfile и прав нет, и Валерий будет ругаться), то решил использовать ранее созданный GitLab (из занятия по Github). Склонировал имеющуюся репу, тестировал на ней, всё работало прекрасно.

Создал 2 пайплайна согласно условий. Всё сработало. Подготовил отчет, запушил.
