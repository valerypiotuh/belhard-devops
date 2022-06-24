Подключился через pgAdmin к основному докер контейнеру (имя: belhard09, 172.17.0.2)

Создал базу belhard и вбил данные:

INSERT INTO belhard  (FirstName, LastName, Email, Age)
VALUES
('Ivan', 'Ivanov', 'ivanov@test.com', 30),
('Petr', 'Petrov', 'petrov@test.com', 35),
('Ivan', 'Sidorov', 'sidorov@test.com', 40),
('Dmitriy', 'Tatarkin', 'sale@dtatarkin.ru', 42),
('Sergey', 'Kharkin', 'sharkin@inteliventi.com', 43),
('Ekaterina', 'Redko', 'redxxx@gmail.com', 36),
('Sofia', 'Kharkina', 'sofia@test.com', 17),
('Maria', 'Kharkina', 'maria@test.com', 35),
('Sergey', 'Anosov', 'nosic01@yandex.ru', 44),
('Ivan', 'Alexandrov', 'vanya@focus.ru', 38),
('Ekaterina', 'Denisenko', 'denisenko@test.com', 18),
('Natalia', 'Sorokina', 'sidorov@beauty.com', 31);

Скриншот scr1.png

Запустил новый контейнер и подключился через тот же pgAdmin (имя: belhard09-dump, 172.17.0.4)

docker ps -a
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS                                            NAMES
f08b3aa0d488   postgres         "docker-entrypoint.s…"   12 seconds ago   Up 10 seconds   5432/tcp                                         wizardly_agnesi
71f03be8d03e   dpage/pgadmin4   "/entrypoint.sh"         10 hours ago     Up 10 hours     443/tcp, 0.0.0.0:8888->80/tcp, :::8888->80/tcp   crazy_bose
25c69c460854   postgres         "docker-entrypoint.s…"   10 hours ago     Up 10 hours     5432/tcp                                         heuristic_babbage


Зашел в новый контейнер, установил nano и восстановил базу из дампа:

psql -U postgres -f belhard-dump 
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
COPY 12

Скриншот scr2.png
