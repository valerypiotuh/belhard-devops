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
