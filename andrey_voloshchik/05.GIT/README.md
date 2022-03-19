Создали Git репозиторий со следующими ветками (все используемые команды находятся в файле history_command):

* master - в ней 2 коммита

* staging - в ней 2 коммита из master + 2 дополнительных

* test - в ней 2 коммита из master + 2 дополнительных из staging + 1 дополнительный

* fix/prod_is_down - в ней 2 коммита из master + 1 дополнительный

Выполнили следующие сценарии(ниже находятся коммиты по каждому из них):

 1) Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down);
 2) Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках.

* Релиз в production
  * master 
    * added_file1_test
    * added_file2_staging
    *  added_file1_staging
    *  added_file2_master
    *  added_file1_master

* Развертывание fix
 * master 
    * Merge branch 'fix/prod_is_down'
    * added_file1_fix_prod_is_down
    * added_file1_test
    * added_file2_staging
    *  added_file1_staging
    *  added_file2_master
    *  added_file1_master

 * staging
    * Merge branch 'fix/prod_is_down' into staging merge to staging
    * added_file1_fix_prod_is_down
    * added_file1_test
    * added_file2_staging
    *  added_file1_staging
    *  added_file2_master
    *  added_file1_master

* test
    * Merge branch 'fix/prod_is_down' into test
    * added_file1_fix_prod_is_down
    * added_file1_test
    * added_file2_staging
    *  added_file1_staging
    *  added_file2_master
    *  added_file1_master
