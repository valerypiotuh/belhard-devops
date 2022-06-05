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
