# 04.GIT
* Создание локального репозитория и двух коммитов в ветке master
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


