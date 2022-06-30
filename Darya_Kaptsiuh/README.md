## Отчеты по домашним задания
### 04.GIT - Создание веток и коммитов
##### Создание на локальной машине Git репозитория:
```
mkdir homework
cd homework/
git init
```

#####  Создание ветки master и 2-ух коммитов в ней:
```
vi test1
git add test1
git status
git commit -m "file 1"
vi test2
git status
git add test2
git commit -m "file 2"
```

##### Создание ветки staging, с 2-мя коммитами из master и 2-мя новыми:
```
git checkout -b staging
vi test3
git add test3
git commit -m "file 3"
vi test4
git add test4
git commit -m "file 4"
```

##### Создание ветки test, с 2-мя коммитами из master, с 2-мя коммитами из staging и одним новым коммитом:
```
git checkout -b test
vi test5
git add test5
git commit -m "file 5"
git checkout master
git branch
```

##### Создание ветки fix/prod_is_down, с 2-мя коммитами из master и одним новым коммитом:

```
git checkout -b fix/prod_is_down
vi test6
git add test6
git commit -m "file 6"
```


#### Сценарии:
##### Релиз в production - все коммиты должны быть в ветке master (кроме коммитов из ветки fix/prod_is_down):

```
git checkout master 
git merge test
```

##### Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках:

```
git merge fix/prod_is_down
git checkout staging 
git merge fix/prod_is_down
git checkout test
git merge fix/prod_is_down
```


#### Вывод команды git log для каждой ветки:
##### Ветка master:
```
user@ubuntu:~/gitwork/homework$ git log --oneline
3769b94 (HEAD -> master) Merge branch 'fix/prod_is_down'
f0fdcb8 (fix/prod_is_down) file 6
9c03027 file 5
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1
```

##### Ветка staging:
```
user@ubuntu:~/gitwork/homework$ git log --oneline 
ef3fa20 (HEAD -> staging) Merge branch 'fix/prod_is_down' into staging
f0fdcb8 (fix/prod_is_down) file 6
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1
```

##### Ветка test:
```
user@ubuntu:~/gitwork/homework$ git log --oneline
e4c18c5 (HEAD -> test) Merge branch 'fix/prod_is_down' into test
f0fdcb8 (fix/prod_is_down) file 6
9c03027 file 5
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1
```

##### Ветка fix/prod_is_down:
```
user@ubuntu:~/gitwork/homework$ git log --oneline
f0fdcb8 (HEAD -> fix/prod_is_down) file 6
b7e33f5 file 2
f64413c file 1
```
---

### 05.Bash

##### Задание 1. Посчитать количество странных слов в ядре Linux
##### Скрипт:
```
#!/bin/bash
sudo grep -r /home/belhard/devops_course/linux -e crap -e fuck -e penguin -e bastard -e shit > /home/belhard/devops_course/finditems.txt

searched="$1"
src="$2"

while read word; do
          LINES_COUNT=`grep -c "$word" "$src"`
            echo "$word: $LINES_COUNT"
    done < "$searched"
```
##### Запуск:
```
./words_search.sh words finditems.txt
```
##### В файле words содержатся искомые слова - fuck shit crap bastard penguin.
##### Вывод скрипта:
```
fuck: 13
shit: 99
crap: 227
bastard: 26
penguin: 96
```
##### Задание 2. Найти 10 самых больших файлов в директории
##### Скрипт:
```
#!/bin/bash
find ${testpath} -type f -exec ls -s {} \; | sort -n -r | head -10
```
##### Запуск:
```
./biggestfiles_search_v2.sh /home/user/devops_course/05.Bash
```
##### Вывод скрипта:
```
6831048-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dce/dce_12_0_sh_mask.h
7205628-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h
7561306-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h
11368060-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h
11394491-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_2_sh_mask.h
12748346-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
12839488-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_2_3_sh_mask.h
14151728-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_6_1_sh_mask.h
14373916-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_3_sh_mask.h
16414003-./linux/linux-5.18.3/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_2_0_sh_mask.h
```
---

### 06.Docker

##### Содержимое Dockerfile_speedtest:
```
FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY entrypoint_speedtest.sh /entrypoint_speedtest.sh
ENTRYPOINT ["/entrypoint_speedtest.sh"]
```
##### Содержимое entrypoint_speedtest.sh
```
#!/bin/sh
apk update && apk add --no-cache curl wget git bash speedtest-cli
speedtest > log_speedtest.txt
```
##### Команды для запуска:
```
mkdir ~/log_speedtest
docker build . -f Dockerfile_speedtest -t speedtest
docker run -d -v ~/log_speedtest:/app speedtest
```
##### Создание образа:
```
docker tag speedtest:latest daryakap/speedtest
```
##### Загрузка образа на Docker Hub:
```
docker login
docker push daryakap/speedtest
```
##### Ссылка на образ в Docker Hub:
```
https://hub.docker.com/repository/docker/daryakap/speedtest

```
---

### 07.Nginx

##### Содержимое DockerFile и index.html для контейнера №1
```
FROM nginx
COPY index.html /usr/share/nginx/html
```
```
<html>
        <title>My NGINX Homework 1!!!</title>
        </head>
        <body>
        My NGINX Homework 1
        </body>
</html> 
```
##### Содержимое DockerFile и index.html для контейнера №2
```
FROM nginx
COPY index.html /usr/share/nginx/html
```
```
<html>
        <head>
        <title>My NGINX Homework 2!!!</title>
        </head>
        <body>
        My NGINX Homework 2
        </body>
</html>
```
##### Команды для создания образов
```
docker build . -t nginx_hm1
docker build . -t nginx_hm2
```
##### Команды для запуска контейнеров
```
docker run -d -p 8100:80 nginx_hm1
docker run -d -p 8200:80 nginx_hm2
```
##### Конфигурационный файл для nginx на виртуальной машине
```
server {
        listen 84;
            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:8100;
            }
}
server {
        listen 85;
            location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://127.0.0.1:8200;
            }
}
```
##### Делаем символьную ссылку на наш конфигурационный файл docker_hw
```
sudo ln -s /etc/nginx/sites-available/docker_hw /etc/nginx/sites-enabled/
```
##### Рестарт  сервиса nginx
```
sudo systemctl restart nginx.service
```
---

### 08.PostgreSQL

##### Поднять Docker контейнер с PostgreSQL сервером
```
docker run -d -e POSTGRES_HOST_AUTH_METHOD=trust postgres
```
##### Поднять Docker контейнер с pgAdmin и подключиться к PosgreSQL серверу
```
docker run -p 8899:80 -d -e PGADMIN_DEFAULT_EMAIL=admin@admin.co -e PGADMIN_DEFAULT_PASSWORD=root dpage/pgadmin4
```
##### Создать БД под названием  `belhard`
```
CREATE DATABASE belhard;
```
##### Создать таблицу под названием  `devops`  с полями  `FirstName`,  `LastName`,  `Email`,  `Age`
```\c belhard
CREATE TABLE devops_new
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
);
```
##### Заполнить таблицу данными (+- 10 строк)
```
INSERT INTO devops (FirstName, LastName, Email, Age) VALUES
('Ivan', 'Ivanov', 'ivanov@test.com', 30),
('Petr', 'Petrov', 'petrov@test.com', 35),
('Ivan', 'Sidorov', 'sidorov@test.com', 40),
('Aleksey', 'Ivanov', 'ivanov@test.com', 30),
('Sergey', 'Petrov', 'petrov@test.com', 35),
('Alexandr', 'Sidorov', 'sidorov@test.com', 40),
('Natalya', 'Ivanova', 'ivanov@test.com', 30),
('Anna', 'Petrova', 'petrov@test.com', 35),
('Kate', 'Sidorova', 'sidorov@test.com', 40)
('Julya', 'Ivanova', 'ivanov@test.com', 30);
```
##### Снять дамп с текущей БД и развернуть его в новом Docker контейнере
```
pg_dumpall -U postgres > belhard_dump - на текущем контейнере
psql -U postgres -f belhard_dump - на новом контейнере
```
---

### 08.Terraform

##### Файл с описанием ВМ
```
terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}
```
##### Файл с описанием провайдера
```
resource "virtualbox_vm" "node" {
  count     = var.count_vm
  name      = format(var.name, count.index + 1)
  image     = var.image
  cpus      = var.cpu
  memory    = var.memory

  network_adapter {
    type           = var.type
    host_interface = var.interface
  }
}
```
##### Файл с переменными
```
variable "count_vm" {
  type    = number
  default = "3"

}
variable "name" {
  type    = string
  default = "hm_node-%02d"

}
variable "image" {
  type    = string
  default = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"

}
variable "cpu" {
  type    = number
  default = "2"

}
variable "memory" {
  type    = number
  default = "512"

}  
variable "type" {
  type    = string
  default = "hostonly"

}
variable "interface" {
  type    = string
  default = "vboxnet1"
}
```
---

### 09.Ansible

##### Рабочий Playbook
```
- name: Setting up our VMs
  gather_facts: true
  hosts: all

  tasks:

    - name: Create group "devops"
      ansible.builtin.group:
        name: devops
        state: present
        gid: 1400
      become: yes

    - name: Add user "belhard"
      ansible.builtin.user:
        name: belhard
        group: devops
        shell: /bin/bash
        comment: "Belhard DevOps user"
        state: present
        uid: 1500
      become: yes

    - name: install packages
      apt:
        update_cache: yes
        pkg:
        - curl
        - wget
        - unzip
        - zip
        autoclean: yes
        autoremove: yes
      become: yes

    - name: install java
      apt:
        update_cache: yes
        pkg:
        - openjdk-11-jdk
        autoclean: yes
        autoremove: yes
      when:
        - ansible_hostname == "ansible-1"
      become: yes

    - name: update
      apt: update_cache=yes
      become: yes

    - name: Install Nginx
      apt: name=nginx state=latest
      when:
        - ansible_hostname == "ansible-2"
      become: yes
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      service: name=nginx state=reloaded
      become: yes
```
##### Содержимое файла hosts
```
[db]
ansible-1 ansible_ssh_host=10.0.2.5 ansible_ssh_user=vagrant

[web]
ansible-2 ansible_ssh_host=10.0.2.6 ansible_ssh_user=vagrant
```
##### Команда для запуска playbook
```
ansible-playbook -i /home/vagrant/.ansible/inventory/hosts /home/vagrant/.ansible/my_playbook.yaml
```
