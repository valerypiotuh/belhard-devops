### Создал образы через dockerfile  и запустил два контейнера new и newbase и pgadmin4 ###

В контейнере new создал бд belhard таблицу devops и десять строчек c данными

### Контейнеры запущены с общей папкой /dumpdb ###

Создаю дамп dump_full командой pg_dumpall -U postgres > /dumpdb/dump_full из общей папки, который доступен в обоих контейнерах

В контейнере  newbase восстановил бд из общей папки командой psql -f dump_full postgres.

### скрины в файлах orirgin.png и restore_base.png ###
