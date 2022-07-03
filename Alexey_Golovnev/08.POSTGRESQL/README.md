# Создание Docker образа

Описываем слои необходимые для образа:
##### Dockerfile
```
FROM postgres
ENV POSTGRES_HOST_AUTH_METHOD=trust
RUN mkdir /dumps
```

---

Создаем Docker образ:
```
docker build . -t postgresql
```

# Запускаем Docker контейнеры

Запуск контейнеров:
```
docker run --name postgresql_1 -d -v ~/dumps:/dumps postgresql
docker run --name postgresql_2 -d -v ~/dumps:/dumps postgresql
```

---

Узнаем IP адреса контейнеров:
```
docker inspect postgresql_1 | grep IPAddress
docker inspect postgresql_2 | grep IPAddress
```

# Запуск Pgadmin

Запускаем контейнер с pgadmin и пробрасываем 80 порт:
```
docker run --name pgadmin -p 8080:80 -d -e PGADMIN_DEFAULT_EMAIL=admin@admin.com -e PGADMIN_DEFAULT_PASSWORD=root dpage/pgadmin4
```

# Заполняем postgresql_1:

```
CREATE DATABASE belhard;
CREATE TABLE devops
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
);
INSERT INTO devops ("FirstName", "LastName", "Email", "Age") VALUES
('Ivan', 'Ivanov', 'ivanov@test.com', 30),
('Petr', 'Petrov', 'petrov@test.com', 35),
('Ivan', 'Sidorov', 'sidorov@test.com', 40),
('Aleksey', 'Ivanov', 'ivanov@test.com', 30),
('Sergey', 'Petrov', 'petrov@test.com', 35),
('Alexandr', 'Sidorov', 'sidorov@test.com', 40),
('Natalya', 'Ivanova', 'ivanov@test.com', 30),
('Anna', 'Petrova', 'petrov@test.com', 35),
('Kate', 'Sidorova', 'sidorov@test.com', 40),
('Julya', 'Ivanova', 'ivanov@test.com', 30);
```

# Снимаем дамп с postgresql_1:

Выполняем в контейнере postgresql_1:
```
pg_dumpall -U postgres > /dumps/dump.sql
```

# Переносим дамп в postgresql_2:

Выполняем в контейнере postgresql_2:
```
psql -U postgres -f /dumps/dump.sql
```
