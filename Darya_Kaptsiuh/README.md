# Создание веток и коммитов
---

## Создание на локальной машине Git репозитория:

mkdir homework
cd homework/
git init

## Создание ветки master и 2-ух коммитов в ней:

vi test1
git add test1
git status
git commit -m "file 1"
vi test2
git status
git add test2
git commit -m "file 2"

## Создание ветки staging, с 2-мя коммитами из master и 2-мя новыми:

git checkout -b staging
vi test3
git add test3
git commit -m "file 3"
vi test4
git add test4
git commit -m "file 4"

## Создание ветки test, с 2-мя коммитами из master, с 2-мя коммитами из staging и одним новым коммитом:

git checkout -b test
vi test5
git add test5
git commit -m "file 5"
git checkout master
git branch

## Создание ветки fix/prod_is_down, с 2-мя коммитами из master и одним новым коммитом.

git checkout -b fix/prod_is_down
vi test6
git add test6
git commit -m "file 6"

# Сценарии
---

## Релиз в production - все коммиты должны быть в ветке master (кроме коммитов из ветки fix/prod_is_down):

git checkout master 
git merge test

## Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках:

git merge fix/prod_is_down
git checkout staging 
git merge fix/prod_is_down
git checkout test
git merge fix/prod_is_down


# Вывод команды git log для каждой ветки
---

## Ветка master:
user@ubuntu:~/gitwork/homework$ git log --oneline
3769b94 (HEAD -> master) Merge branch 'fix/prod_is_down'
f0fdcb8 (fix/prod_is_down) file 6
9c03027 file 5
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1

## Ветка staging:
user@ubuntu:~/gitwork/homework$ git log --oneline 
ef3fa20 (HEAD -> staging) Merge branch 'fix/prod_is_down' into staging
f0fdcb8 (fix/prod_is_down) file 6
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1

## Ветка test:
user@ubuntu:~/gitwork/homework$ git log --oneline
e4c18c5 (HEAD -> test) Merge branch 'fix/prod_is_down' into test
f0fdcb8 (fix/prod_is_down) file 6
9c03027 file 5
c2bcb1b file 4
5c59530 file 3
b7e33f5 file 2
f64413c file 1

## Ветка fix/prod_is_down:
user@ubuntu:~/gitwork/homework$ git log --oneline
f0fdcb8 (HEAD -> fix/prod_is_down) file 6
b7e33f5 file 2
f64413c file 1

# THE END

