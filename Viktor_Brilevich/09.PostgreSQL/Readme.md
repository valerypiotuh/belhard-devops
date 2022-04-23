1. Создал образы через докерфайлы и запустил контейнеры командами в comands.txt.
2. В котейнере postgrebd создал бд belhar, затем таблицу devops и десять строчек в ней.

belhard@ubuntu2:~$ docker exec -it 57fb44ada28f /bin/bash
root@57fb44ada28f:/# psql -U postgres -d belhard
psql (14.2 (Debian 14.2-1.pgdg110+1))
Type "help" for help.

belhard=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 belhard   | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(4 rows)

belhard=# select * from devops;
 id | firstname | lastname |      email       | age
----+-----------+----------+------------------+-----
  1 | Ivan      | Steplov  | steplov@test.com |  30
  2 | Petr      | Klimov   | klimov@test.com  |  35
  3 | Fedor     | Belov    | belov@test.com   |  41
  4 | Sergey    | Parsin   | parsin@test.com  |  22
  5 | Zaur      | Baev     | baev@test.com    |  45
  6 | Shon      | Connery  | connery@test.com |  25
  7 | Jon       | Smith    | smith@test.com   |  18
  8 | Ivan      | Abramov  | abramov@test.com |  39
  9 | Stepan    | Loev     | loev@test.com    |  54
 10 | Boris     | Shurpin  | shurpin@test.com |  27
(10 rows)

belhard=#.

3. Контейнеры запущены с общей папкой /dump.
4. Создал дамп dump_full командой pg_dumpall > dump_full из общей папки, который доступен как в контейнере postgrebd, так и в контейнере postgrebdnew.
5. В контейнере postgrebdnew восстановил бд из общей папки командой psql -f dump_full postgres.

belhard@ubuntu2:~$ docker exec -it 01fde6df3f29  /bin/bash
root@01fde6df3f29:/# psql -U postgres -d belhard
psql (14.2 (Debian 14.2-1.pgdg110+1))
Type "help" for help.
belhard=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 belhard   | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(4 rows)

belhard=# select * from devops;
 id | firstname | lastname |      email       | age
----+-----------+----------+------------------+-----
  1 | Ivan      | Steplov  | steplov@test.com |  30
  2 | Petr      | Klimov   | klimov@test.com  |  35
  3 | Fedor     | Belov    | belov@test.com   |  41
  4 | Sergey    | Parsin   | parsin@test.com  |  22
  5 | Zaur      | Baev     | baev@test.com    |  45
  6 | Shon      | Connery  | connery@test.com |  25
  7 | Jon       | Smith    | smith@test.com   |  18
  8 | Ivan      | Abramov  | abramov@test.com |  39
  9 | Stepan    | Loev     | loev@test.com    |  54
 10 | Boris     | Shurpin  | shurpin@test.com |  27
(10 rows)

belhard=#

6. Скрины из pgadmin4 d в файлах basebd.png и newbd.png.
