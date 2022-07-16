## Выполненные задания:

### 04. GIT

#### Создать у себя на локальной машине Git репозиторий со следующими ветками:

* master - в ней 2 коммита
* staging - в ней 2 коммита из master + 2 дополнительных
* test - в ней 2 коммита из master + 2 дополнительных из staging + 1 дополнительный
* fix/prod_is_down - в ней 2 коммита из master + 1 дополнительный

#### Отработать два сценария:

* Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down);
* Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках;
---

### 05. Bash

1. Посчитать количество странных слов в ядре Linux.
2. 10 самых больших файлов в директории.
---

### 06. Docker

1. Зарегистрировать на Docker Hub;
2. Создать Dockerfile:
   * базовый образ - Alpine Linux;
   * рабочий каталог - /app;
   * примонтировать локальную папку ~/log к контейнеру по пути /app;
   * все, что указано ниже, должно выполняться в entrypoint.sh, а именно:
      - установка пакетов curl,wget,git,bash;
      - установка пакета speedtest-cli;    
      - проверка скорости интернет соединения с помощью пакета speedtest-cli с выводом в файл;
3. Загрузить рабочий Docker образ на Docker Hub.
---

### 07. Nginx

#### Содержимое Dockerfile и index.html (контейнер nginx_hw1):
````
FROM nginx
COPY index.html /usr/share/nginx/html
````
````
<html>
	<head>
		<title>NGINX page 1</title>
	</head>
	<body>
		Welcome to NGINX home page 1!
	</body>
</html>
````

#### Содержимое Dockerfile и index.html (контейнер nginx_hw2):
````
FROM nginx
COPY index.html /usr/share/nginx/html
````
````
<html>
	<head>
		<title>NGINX page 2</title>
	</head>
	<body>
		Welcome to NGINX home page 2!
	</body>
</html>
````

#### Создание образов:
````
docker build . -t nginx_hw1
docker build . -t nginx_hw2
````

#### Запуск контенеров:
````
docker run -d -p 8100:80 nginx_hw1
docker run -d -p 8200:80 nginx_hw2
````

#### Настройка прокси на Docker контейнеры на локальной машине:

````
/etc/nginx/sites-available/nginx

server {
    listen 81;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://127.0.0.1:8100;
    }
}

server {
    listen 82;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://127.0.0.1:8200;
    }
}
````

#### Проверка синтаксиса файла nginx:
````
nginx -t
````

#### Создание символьной ссылки для конфигурационного файла nginx:
````
ln -s /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/
````

#### Перезапуск службы nginx для применения изменений в конфигурации:
````
systemctl reload nginx
````
---

### 08. PostgreSQL

#### Поднять Docker контейнер с PostgreSQL сервером:

##### Содержимое Dockerfile и создание образа:
````
FROM postgres
ENV POSTGRES_HOST_AUTH_METHOD=trust
RUN mkdir /dumps
````
````
docker build . -t postgresql
````

#### Запуск контейнеров с PostgreSQL:
````
docker run --name psql1 -d -v ~/dumps:/dumps postgresql
docker run --name psql2 -d -v ~/dumps:/dumps postgresql
````

#### Проверка ip адресов контейнеров:
````
user@ubuntu:~/belhard/08.PostgreSQL$ docker inspect psql1 | grep IPAddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
user@ubuntu:~/belhard/08.PostgreSQL$ docker inspect psql2 | grep IPAddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.3",
                    "IPAddress": "172.17.0.3",
````

#### Поднять Docker контейнер с pgAdmin и подключиться к PosgreSQL серверу
````
docker run --name pgadmin -p 8888:80 -d -e PGADMIN_DEFAULT_EMAIL=admin@admin.com -e PGADMIN_DEFAULT_PASSWORD=root dpage/pgadmin4
````

#### Запуск PostgreSQL в контейнере:
````
docker exec -it dcf168aa2739 psql -U postgres
````

#### Создание БД под названием `belhard` и таблицы `devops` с полями (`FirstName`, `LastName`, `Email`, `Age`):
````
CREATE DATABASE belhard;
\c belhard
use belhard;

CREATE TABLE devops
(
    ID SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
);
````

#### Наполнение таблицы данными:
```
INSERT INTO devops (FirstName, LastName, Email, Age) VALUES
('Ivan', 'Ivanov', 'ivanov@test.com', 30),
('Aleksey', 'Ivanov', 'ivanov@test.com', 30),
('Sergey', 'Petrov', 'petrov@test.com', 35),
('Alexey', 'Medvedev', 'medvedev@test.com', 40),
('Nikolay', 'Ivanov', 'ivanov@test.com', 30),
('Marina', 'Petrova', 'petrova@test.com', 35),
('Petr', 'Petrov', 'petrov@test.com', 35),
('Ivan', 'Sidorov', 'sidorov@test.com', 40),
('Anna', 'Sidorova', 'sidorova@test.com', 40),
('Juri', 'Fedorov', 'fedorov@test.com', 30);
````

#### Снятие дампа с текущей БД и развертывание его в новом Docker контейнере:
##### Контейнер `psql1`:
````
pg_dumpall -U postgres > /dumps/dump.sql
````

##### Контейнер `psql2`:
```
psql -U postgres -f /dumps/dump.sql
````
#### 09. Terraform

#### Провайдер:
````
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.19.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
````

#### Ресурсы:
````
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "nginx"
  ports {
    internal = 80
    external = var.nginx_port
  }
}

resource "docker_image" "speedtest" {
  name = "juliaviolet666/speedtest:latest"
}

resource "docker_container" "speedtest" {
  name = "speedtest"
  image = docker_image.speedtest.latest

  volumes {
    host_path = "${abspath(path.module)}/logs"
    container_path = "/app"
  }
}

resource "docker_image" "postgres" {
  name = "postgres:latest"
  keep_locally = false
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.latest
  name = "psql"
  env = [
    "POSTGRES_HOST_AUTH_METHOD=trust"
  ]
}

resource "docker_image" "pgadmin" {
  name = "dpage/pgadmin4:latest"
  keep_locally = true
}

resource "docker_container" "pgadmin4" {
  image = docker_image.pgadmin.latest
  name = "pgadmin"
  env = [
    "PGADMIN_DEFAULT_EMAIL=admin@admin.co",
    "PGADMIN_DEFAULT_PASSWORD=root"
  ]
  ports {
    internal = 80
    external = var.pgadmin_port
  }
}
````

#### Переменные:
````
variable "nginx_port" {
  type = string
  default = "80"

}

variable "pgadmin_port" {
  type = string
  default = "80"

}
````

#### Проброс портов:
````
nginx_port    = "8080"
pgadmin_port  = "8081"
````
