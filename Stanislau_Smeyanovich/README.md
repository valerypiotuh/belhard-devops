# 04.GIT
* Создание локального репозитория и двух коммитов в ветке master:
```
user@ubuntu:~$ mkdir homework
user@ubuntu:~$ cd homework/
user@ubuntu:~/homework$ git init
user@ubuntu:~/homework$ echo "Create file1" > file1
user@ubuntu:~/homework$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file1

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add 
user@ubuntu:~/homework$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   file1

user@ubuntu:~/homework$ git commit -m "Creating file1"
[master (root-commit) 59d210e] Creating file1
 1 file changed, 1 insertion(+)
 create mode 100644 file1
user@ubuntu:~/homework$ git log
commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6 (HEAD -> master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ echo "Create fil2" > file2
user@ubuntu:~/homework$ echo "Adding line" > file1
user@ubuntu:~/homework$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   file1

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file2

no changes added to commit (use "git add" and/or "git commit -a")
user@ubuntu:~/homework$ git add .
user@ubuntu:~/homework$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   file1
        new file:   file2

user@ubuntu:~/homework$ git commit -m "Add file2, edit file1"
[master 092e94d] Add file2, edit file1
 2 files changed, 4 insertions(+), 1 deletion(-)
 rewrite file1 (100%)
 create mode 100644 file2
user@ubuntu:~/homework$ git log
commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (HEAD -> master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
```
* Создание и переход в ветку staging, а также создание 2-ух коммитов в ней
```
user@ubuntu:~/homework$ git checkout -b staging
Switched to a new branch 'staging'
user@ubuntu:~/homework$ git log
commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (HEAD -> staging, master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ git status
On branch staging
nothing to commit, working tree clean
user@ubuntu:~/homework$ git branch -a
  master
* staging
user@ubuntu:~/homework$ echo "Create file3" > file3
user@ubuntu:~/homework$ git status
On branch staging
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file3

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add .
user@ubuntu:~/homework$ git commit -m "Add file3"
[staging dbcb63d] Add file3
 1 file changed, 1 insertion(+)
 create mode 100644 file
 user@ubuntu:~/homework$ git log
commit dbcb63d2824f670d6776c620490d1a83e0b2506a (HEAD -> staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ echo "Create file4" > file4
 git status
On branch staging
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file4

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add .
user@ubuntu:~/homework$ git status
On branch staging
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   file4

user@ubuntu:~/homework$ git commit -m "Add file4"
[staging 70ddb5b] Add file4
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 file
 create mode 100644 file4
user@ubuntu:~/homework$ git log
commit 70ddb5b609da87d2ce4a122b07cd396a2d57e55f (HEAD -> staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit dbcb63d2824f670d6776c620490d1a83e0b2506a
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3
commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
``` 
* Создание ветки test икоммита в ней
```    
user@ubuntu:~/homework$ git checkout -b test
Switched to a new branch 'test'
user@ubuntu:~/homework$ git branch -a
  master
  staging
* test
user@ubuntu:~/homework$ git log
commit 70ddb5b609da87d2ce4a122b07cd396a2d57e55f (HEAD -> test, staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit dbcb63d2824f670d6776c620490d1a83e0b2506a
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ echo "Create file5" > file5
user@ubuntu:~/homework$ git status
On branch test
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file5

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add .
user@ubuntu:~/homework$ git status
On branch test
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   file5

user@ubuntu:~/homework$ git commit -m "Add file5"
[test a1accb9] Add file5
 1 file changed, 1 insertion(+)
 create mode 100644 file5
user@ubuntu:~/homework$ git log
commit a1accb9efc8262e5efcf86960febac1a4f02259e (HEAD -> test)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:46:53 2022 +0000

    Add file5

commit 70ddb5b609da87d2ce4a122b07cd396a2d57e55f (staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit dbcb63d2824f670d6776c620490d1a83e0b2506a
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
```
* Создание ветк fix/prod_is_down и коммита в ней
```
user@ubuntu:~/homework$ git checkout master
Switched to branch 'master'
user@ubuntu:~/homework$ git log
commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (HEAD -> master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ git branch -a
* master
  staging
  test
user@ubuntu:~/homework$ git checkout -b fix/prod_is_down
Switched to a new branch 'fix/prod_is_down'
user@ubuntu:~/homework$ git log
commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (HEAD -> fix/prod_is_down, mast                                                                                                         er)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ echo "Create file6" > file6
user@ubuntu:~/homework$ git status
On branch fix/prod_is_down
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file6

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add /
fatal: /: '/' is outside repository
user@ubuntu:~/homework$ git status
On branch fix/prod_is_down
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file6

nothing added to commit but untracked files present (use "git add" to track)
user@ubuntu:~/homework$ git add .
user@ubuntu:~/homework$ git status
On branch fix/prod_is_down
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   file6

user@ubuntu:~/homework$ git commit -m "Add file6"
[fix/prod_is_down dcf9cb9] Add file6
 1 file changed, 1 insertion(+)
 create mode 100644 file6
user@ubuntu:~/homework$ git status
On branch fix/prod_is_down
nothing to commit, working tree clean
user@ubuntu:~/homework$ git log
commit dcf9cb95fac50ec4299dcf7108cf2c12e7d97103 (HEAD -> fix/prod_is_down)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:50:00 2022 +0000

    Add file6

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71 (master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
```
* Сценарий 1
```
user@ubuntu:~/homework$ git checkout master
user@ubuntu:~/homework$ git rebase test
user@ubuntu:~/homework$ git log
commit a1accb9efc8262e5efcf86960febac1a4f02259e (HEAD -> master, test)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:46:53 2022 +0000

    Add file5

commit 70ddb5b609da87d2ce4a122b07cd396a2d57e55f (staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit dbcb63d2824f670d6776c620490d1a83e0b2506a
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
```
* Сценарий 2
```
user@ubuntu:~/homework$ git rebase fix/prod_is_down
First, rewinding head to replay your work on top of it...
Applying: Add file2, edit file1
Applying: Add file4
Applying: Add file5
user@ubuntu:~/homework$ ll
total 32
drwxrwxr-x 3 user user 4096 Jun  6 16:04 ./
drwxr-xr-x 8 user user 4096 Jun  6 15:20 ../
-rw-rw-r-- 1 user user  662 Jun  6 15:33 file1
-rw-rw-r-- 1 user user   12 Jun  6 15:30 file2
-rw-rw-r-- 1 user user   13 Jun  6 16:04 file4
-rw-rw-r-- 1 user user   13 Jun  6 16:04 file5
-rw-rw-r-- 1 user user   13 Jun  6 16:04 file6
drwxrwxr-x 8 user user 4096 Jun  6 16:04 .git/
user@ubuntu:~/homework$ git log
commit 01550cb696d2763ef8dcf3811e908a04042d0f5b (HEAD -> master)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:46:53 2022 +0000

    Add file5

commit df484110fabd3d165e35312d6e689d9e1fa319ce
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit 0d683582ff1e2d81a169d716c680cab1861ecca7
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit dcf9cb95fac50ec4299dcf7108cf2c12e7d97103 (fix/prod_is_down)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:50:00 2022 +0000

    Add file6

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ git checkout staging
user@ubuntu:~/homework$ git rebase fix/prod_is_down
First, rewinding head to replay your work on top of it...
Applying: Add file2, edit file1
Applying: Add file4
user@ubuntu:~/homework$ git log
commit f0bc390c6fab0b028a1a125f957d3aa623d66528 (HEAD -> staging)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit 4a69d2dce27a05ef3cc63b83c4eb08fc51ef67d9
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit dcf9cb95fac50ec4299dcf7108cf2c12e7d97103 (fix/prod_is_down)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:50:00 2022 +0000

    Add file6

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
user@ubuntu:~/homework$ git checkout test
Switched to branch 'test'
user@ubuntu:~/homework$ git rebase fix/prod_is_down
First, rewinding head to replay your work on top of it...
Applying: Add file2, edit file1
Applying: Add file4
Applying: Add file5
user@ubuntu:~/homework$ git log
commit ee106573cee8eb0573725cfe5e96bb9d79fe89fc (HEAD -> test)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:46:53 2022 +0000

    Add file5

commit c1e37ebd77bccc5290b8534490c69dc1b12386d4
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:45:10 2022 +0000

    Add file4

commit b37fdf54e1ab2efc8716347a14a8f1f773da5343
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:42:37 2022 +0000

    Add file3

commit dcf9cb95fac50ec4299dcf7108cf2c12e7d97103 (fix/prod_is_down)
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:50:00 2022 +0000

    Add file6

commit 092e94d534c0ccf6c6d85802bba6a74ec9cadc71
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:36:27 2022 +0000

    Add file2, edit file1

commit 59d210ee3a0533bb7d8e69d439eaf9b8c792add6
Author: Stanislau Smeyanovich <ssmeyanovich@gmail.com>
Date:   Mon Jun 6 15:28:08 2022 +0000

    Creating file1
```
# 05.Bash
* Посчитать количество странных слов в ядре Linux, выполнение скрипта:
```
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw1.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
Please enter the word you are looking for:fuck
13
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw1.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
Please enter the word you are looking for:shit
99
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw1.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
Please enter the word you are looking for:crap
227
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw1.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
Please enter the word you are looking for:bastard
26
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw1.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
Please enter the word you are looking for:penguin
96
```
* 10 самых больших файлов в директории, выполнение скрипта:
```
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich/05.Bash$ ./hw2.sh
Please enter the path to the folder:/home/user/05.bash/linux_kernel/linux-5.18.3/
[sudo] password for user:
16414003        nbio_7_2_0_sh_mask.h
14373916        dpcs_4_2_3_sh_mask.h
14151728        nbio_6_1_sh_mask.h
12839488        nbio_2_3_sh_mask.h
12748346        nbio_7_0_sh_mask.h
11394491        dpcs_4_2_2_sh_mask.h
11368060        dpcs_4_2_0_sh_mask.h
7561306 dcn_3_0_0_sh_mask.h
7205628 dcn_2_0_0_sh_mask.h
6831048 dce_12_0_sh_mask.h
```
# 06.Docker
* Создаем Dockerfile для контейнера:
```
user@ubuntu:~/06.docker/hw$ nano Dockerfile
```
* Содержимое Dockerfile:
```
FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
```
* Создаем скрипт entrypoint.sh с инструкцией для выполнения в контейнере:
```
user@ubuntu:~/06.docker/hw$ nano entrypoint.sh
```
* Содержимое entrypoint.sh:
```
#!/bin/sh
apk update && apk add --no-cache  curl wget git bash speedtest-cli
speedtest-cli > log.txt
```
* Назначаем права на выполнение для entrypoint.sh:
```
user@ubuntu:~/06.docker/hw$ chmod +x entrypoint.sh
```
* Создаем директорию на хосте, куда будут смонтирована рабочая директория контейнера:
```
user@ubuntu:~/06.docker/hw$ mkdir ~/log
```
* Билдим image:
```
docker build . -t speedtest
```
* Запускаем контейнер, указываем в какую папку будем монтировать директорию контейнера:
```
docker run -d -v ~/log:/app speedtest
```
* Проверяем содержимое файла log содержмиое:
```
user@ubuntu:~/belhard-devops/Stanislau_Smeyanovich$ cat /home/user/log/log.txt
Retrieving speedtest.net configuration...
Testing from Beltelecom (37.214.73.34)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by PinPro (Pinsk) [222.94 km]: 23.321 ms
Testing download speed................................................................................
Download: 52.44 Mbit/s
Testing upload speed......................................................................................................
Upload: 28.12 Mbit/s 
```
* Выгружаем образ на DockerHub:
```
user@ubuntu:~/06.docker/hw$ docker login  -u [username] -p [password]
user@ubuntu:~/06.docker/hw$ docker tag speedtest:latest stanislausmain/speedtest
user@ubuntu:~/06.docker/hw$ docker push stanislausmain/speedtest
```
* Ссылка на образ:
```
https://hub.docker.com/repository/registry-1.docker.io/stanislausmain/speedtest/tags?page=1&ordering=last_updated
```
# 07.Nginx
* 1. Создаем 2 разные страницы для Docker контейнеров:
```
user@ubuntu:~/07.Nginx$ mkdir 1
user@ubuntu:~/07.Nginx$ cd 1/
user@ubuntu:~/07.Nginx/1$ nano index.html
user@ubuntu:~/07.Nginx/1$ cat index.html
<html>
<head>
<title>First Docker Container Page</title>
</head>
<body>
This page is based on Docker container #1
</body>
</html>
user@ubuntu:~/07.Nginx/1$ mkdir ../2
user@ubuntu:~/07.Nginx$ cd 2/
user@ubuntu:~/07.Nginx/2$ nano index.html
user@ubuntu:~/07.Nginx/2$ cat index.html
<html>
<head>
<title>Second Docker Container Page</title>
</head>
<body>
This page is based on Docker container #2
</body>
</html>
```
* 2. Пишем два Dokerfile для работы контейнеров:
```
user@ubuntu:~/07.Nginx/1$ nano Dockerfile
user@ubuntu:~/07.Nginx/1$ cat Dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html/
user@ubuntu:~/07.Nginx/1$ cd ../2
user@ubuntu:~/07.Nginx/2$ nano Dockerfile
user@ubuntu:~/07.Nginx/2$ cat Dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html/
```
* 3. Билдим два образа на основе написанных Dokerfile и запускаем контейнеры с пробросом необходимых портов на хост:
```
user@ubuntu:~/07.Nginx/1$ docker build . -t nginx_1
Sending build context to Docker daemon  3.072kB
Step 1/2 : FROM nginx
 ---> 0e901e68141f
Step 2/2 : COPY index.html /usr/share/nginx/html/
 ---> c06af9cd4457
Successfully built c06af9cd4457
Successfully tagged nginx_1:latest
user@ubuntu:~/07.Nginx/1$ sudo docker run -d -p 8100:80 nginx_1
e5b77bbe8878cef044c38b2cbc11721f380f447ff190501720b5c94722e69e16
user@ubuntu:~/07.Nginx/1$ cd ../2
user@ubuntu:~/07.Nginx/2$ docker build . -t nginx_2
Sending build context to Docker daemon  3.072kB
Step 1/2 : FROM nginx
 ---> 0e901e68141f
Step 2/2 : COPY index.html /usr/share/nginx/html/
 ---> 4014563cb5da
Successfully built 4014563cb5da
Successfully tagged nginx_2:latest
user@ubuntu:~/07.Nginx/2$ sudo docker run -d -p 8200:80 nginx_2
eb1511cf342976803bf2bb6ddb3fe8588d866f35a5cc8ddaf992214f53cb3666
user@ubuntu:~/07.Nginx/2$ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                   PORTS                                   NAMES
eb1511cf3429   nginx_2          "/docker-entrypoint.…"   23 seconds ago       Up 22 seconds            0.0.0.0:8200->80/tcp, :::8200->80/tcp   recursing_carson
e5b77bbe8878   nginx_1          "/docker-entrypoint.…"   About a minute ago   Up About a minute        0.0.0.0:8100->80/tcp, :::8100->80/tcp   elegant_morse
0a398da957a0   postgres         "docker-entrypoint.s…"   5 days ago           Exited (0) 7 hours ago                                           relaxed_nash
ce7ec297434b   dpage/pgadmin4   "/entrypoint.sh"         5 days ago           Exited (0) 7 hours ago                                           jolly_lewin
deb1e71eeb52   postgres         "docker-entrypoint.s…"   5 days ago           Exited (0) 7 hours ago                                           brave_maxwell
d3e7b383331b   speedtest        "/entrypoint.sh"         7 days ago           Exited (0) 7 days ago
```
* После проброса портов 8100 и 8200 виртуальной машины в VirtualBox вводим в строку браузера 127.0.0.1:8100 (для первого контейнера) и смотрим результат вывода HTML страницы:
```
This page is based on Docker container #1 
```
* И 127.0.0.1:8200 для второго контейнера:
```
This page is based on Docker container #2 
```
* 4. Для использование Nginx на ВМ в качестве прокси сервера пробросим в контейнеры локальные порты 8881 и 8882:
```
user@ubuntu:~$ docker run -d -p 8881:80 nginx_1
8dc4072c99fb7cb8ae737f1391c62e431e44c7711edc13be786f686e85f1b7fe
user@ubuntu:~$ docker run -d -p 8882:80 nginx_2
5d5e0e911213dc61e33ab124f42a2233ec94aa04cd98c69e9419db4d6c89ee58
user@ubuntu:~$ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                    PORTS                                   NAMES
5d5e0e911213   nginx_2          "/docker-entrypoint.…"   13 seconds ago   Up 12 seconds             0.0.0.0:8882->80/tcp, :::8882->80/tcp   wonderful_wing
8dc4072c99fb   nginx_1          "/docker-entrypoint.…"   25 seconds ago   Up 24 seconds             0.0.0.0:8881->80/tcp, :::8881->80/tcp   heuristic_curie
7d0801f9d285   nginx_2          "/docker-entrypoint.…"   18 hours ago     Exited (0) 4 hours ago                                            serene_jennings
d3c5341ebd8a   nginx_1          "/docker-entrypoint.…"   18 hours ago     Exited (0) 4 hours ago                                            gifted_wiles
0a398da957a0   postgres         "docker-entrypoint.s…"   5 days ago       Exited (0) 26 hours ago                                           relaxed_nash
ce7ec297434b   dpage/pgadmin4   "/entrypoint.sh"         6 days ago       Exited (0) 26 hours ago                                           jolly_lewin
deb1e71eeb52   postgres         "docker-entrypoint.s…"   6 days ago       Exited (0) 26 hours ago                                           brave_maxwell
d3e7b383331b   speedtest        "/entrypoint.sh"         8 days ago       Exited (0) 8 days ago                                             flamboyant_ride
```
* 5. Редактируем файл  docker в /etc/nginx/sites-available где указываем на какие порты проксировать трафик от ВМ к контейнерам, проверяем есть ли ссылка на этот файл в /etc/nginx/sites-enabled:
```
user@ubuntu:~$ sudo nano /etc/nginx/sites-available/docker
[sudo] password for user:
user@ubuntu:~$ cat /etc/nginx/sites-available/docker
server {
 listen 8100;

            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:8881;
            }
}


server {
 listen 8200;

            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:8882;
            }
}
user@ubuntu:~$ ll /etc/nginx/sites-enabled/
total 8
drwxr-xr-x 2 root root 4096 Jun 14 18:31 ./
drwxr-xr-x 8 root root 4096 Jun 21 14:43 ../
lrwxrwxrwx 1 root root   34 Jun 14 17:12 default -> /etc/nginx/sites-available/default
lrwxrwxrwx 1 root root   33 Jun 14 18:31 docker -> /etc/nginx/sites-available/docker
```
* 6. Создаем HTML страницу для ВМ машины, которая будет выводится при указании порта 8000 + меняем в файле конфигурации значение порта, который будет прослушивать ВМ для отображения своей страницы:
```
user@ubuntu:~$ sudo nano /var/www/example.com/index.html
user@ubuntu:~$ cat /var/www/example.com/index.html
<html>
<head>
<title>VM WEB Page</title>
</head>
<body>
This page is based on host VM
</body>
</html>
user@ubuntu:~$ sudo nano /etc/nginx/sites-available/default
[sudo] password for user:
user@ubuntu:~$ cat /etc/nginx/sites-available/default
server {
        listen 8000;
        listen [::]:8000;

        server_name example.com;

        root /var/www/example.com;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }
}
```

* 7. Пробрасывем нужные порта в VirtulBox и проверяем вывод страниц в браузере. Для ВМ 127.0.0.1:8000:
```
This page is based on host VM 
```
* 8. Для Docker #1 127.0.0.1:8100:
```
This page is based on Docker container #1 
```
* 9. Для Docker #2 127.0.0.1:8200:
```
This page is based on Docker container #2 
```
# 08.PostgreSQL
* 1. Поднимаем Docker контейнер с PostgreSQL сурвером:
```
user@ubuntu:~$ docker run -d -e POSTGRES_HOST_AUTH_METHOD=trust postgres
dde7d7db1bbb29e9f02c80ae2cfc0f7ea20fcfe879a91df7b0287679d1060fc0
user@ubuntu:~$ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED             STATUS                    PORTS                                   NAMES
dde7d7db1bbb   postgres         "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes              5432/tcp                                inspiring_margulis
```
* 2. Поднимаем Docer контейнер с pgAdmin:
```
user@ubuntu:~$ docker run -p 8888:80 -d -e PGADMIN_DEFAULT_EMAIL=admin@admin.co -e PGADMIN_DEFAULT_PASSWORD=root dpage/pgadmin4
43be235065234cda8de95fda6236b16ecd742951502558213a283babbddcadc8
user@ubuntu:~$ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                    PORTS                                            NAMES
43be23506523   dpage/pgadmin4   "/entrypoint.sh"         6 seconds ago    Up 6 seconds              443/tcp, 0.0.0.0:8888->80/tcp, :::8888->80/tcp   confident_brahmagupta
dde7d7db1bbb   postgres         "docker-entrypoint.s…"   32 minutes ago   Up 32 minutes             5432/tcp                                         inspiring_margulis
```
* 3. Создаем БД под названием belhard:
```
user@ubuntu:~$ docker exec -it dde7d7db1bbb bash
root@dde7d7db1bbb:/# psql -U postgres
postgres=# CREATE DATABASE belhard;
CREATE DATABASE
```
* 4. Создаем таблицу под названием devops с полями FirstName, LastName, Email, Age:
```
postgres=# \c belhard
You are now connected to database "belhard" as user "postgres".
belhard=# CREATE TABLE devops
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
);
CREATE TABLE
```
* 5. Заполняем таблицу данными:
```
belhard=# INSERT INTO devops  (FirstName, LastName, Email, Age)
VALUES
('Vasiliy', 'Pupkin', 'pupkin@belhard.com', 29),
('Igor', 'Buskin', 'buskin@belhard.com', 36),
('Vadim', 'Lapko', 'lapko@belhard.com', 28),
('Sergey', 'Kukish', 'kukish@belhard.com', 32),
('Artur', 'Kazulin', 'razulin@belhard.com', 25),
('Nikita', 'Varenik', 'varenik@belhard.com', 35),
('Roman', 'Sumarin', 'sumarin@belhard.com', 33),
('Makar', 'Rubin', 'rubin@belhard.com', 28),
('Kupriyan', 'Osokin', 'osokin@belhard.com', 45),
('Pavel', 'Hmyz', 'hmyz@test.com', 40);
INSERT 0 10
```
* 6. Снимаем дамп с текущей БД, запускаем новый контейнер postgres и разворачиваем на нем базу из дампа:
```
root@dde7d7db1bbb:/app# pg_dumpall -U postgres > dump
root@dde7d7db1bbb:/app#exit
exit
user@ubuntu:~/08.PostgreSQL$ docker run -d -v ~/log:/app -e POSTGRES_HOST_AUTH_METHOD=trust postgre_1
1ed48e6cadcdf2788654a241c18315ec8e1bdda8caac5fcf16ddecc6769c3f05
user@ubuntu:~/08.PostgreSQL$ docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS                    PORTS                                            NAMES
1ed48e6cadcd   postgre_1        "docker-entrypoint.s…"   3 seconds ago   Up 3 seconds              5432/tcp                                         elastic_lalande
43be23506523   dpage/pgadmin4   "/entrypoint.sh"         15 hours ago    Up 15 hours               443/tcp, 0.0.0.0:8888->80/tcp, :::8888->80/tcp   confident_brahmagupta
dde7d7db1bbb   postgres         "docker-entrypoint.s…"   15 hours ago    Up 15 hours               5432/tcp                                         inspiring_margulis
user@ubuntu:~/08.PostgreSQL$ docker exec -it 1ed48e6cadcd bash
root@1ed48e6cadcd:/app# psql -U postgres -f dump
SET
SET
SET
psql:dump:14: ERROR:  role "postgres" already exists
ALTER ROLE
You are now connected to database "template1" as user "postgres".
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
CREATE DATABASE
ALTER DATABASE
You are now connected to database "belhard" as user "postgres".
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 10
 setval
--------
     10
(1 row)

ALTER TABLE
You are now connected to database "postgres" as user "postgres".
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
```

# 09.Terraform

* Для VirtualBox файлы конфигурации Terraform provider.tf/variables.tf/vm's.tf находятся в папке 09.Terraform/VirtualBox.
* Для VirtualBox файлы конфигурации Terraform provider.tf/variables.tf/containers.tf находятся в папке 09.Terraform/Docker.
* Следующие команды использовались при выполнении задяния:
```
# Подготовка директории для дальнейшей работы с Terraform
terraform init
# Просмотр текущих изменений
terraform plan
# Проверка валидности конфигурации
terraform validate
# Создаем инфраструктуру
terraform apply
```

# 10.Ansible

* Меняем hostname для основной ВМ и перелогиниваемся для применения настройки: 
```
vagrant@node-01:~$ sudo hostnamectl set-hostname ansible-master 

```
* Ту же операцию проделываем и на двух слейв нодах:
```
vagrant@node-02:~$ sudo hostnamectl set-hostname ansible-1
vagrant@node-03:~$ sudo hostnamectl set-hostname ansible-2
```
* Генерируем пару ssh ключей на ansible-master:
```
vagrant@ansible-master:~$ ssh-keygen
 
```
* Размещаем public key на слейв нодах и проверяем подключение с master на них:
```
vagrant@ansible-master:~$ ssh-copy-id vagrant@10.10.0.5
vagrant@ansible-master:~$ ssh-copy-id vagrant@10.10.0.4
```
* Создаем файл hosts и пишем ansible playbook (сами файлы доступены в директории 10.Ansible):
```
vagrant@ansible-master:~/ansible/playbook/hw$ nano playbook.yml
vagrant@ansible-master:~/ansible/playbook/hw$ nano /home/vagrant/ansible/inventory/hw/hosts
```
* Запускаем playbook следующей командой: 
```
vagrant@ansible-master:~/ansible/playbook/hw$ ansible-playbook -i/home/vagrant/ansible/inventory/hw/hosts /home/vagrant/ansible/playbook/hw/playbook.yml
```


