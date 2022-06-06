# Инициализация

Создание Git репозитория со следующими ветками и коммитами:

- master - в ней 2 коммита
- staging - в ней 2 коммита из master + 2 дополнительных
- test - в ней 2 коммита из master + 2 дополнительных из staging + 1 дополнительный
- fix/prod_is_down - в ней 2 коммита из master + 1 дополнительный

```
git init
touch file1.txt
git add .
git commit -m "master/commit-01"
touch file2.txt
git add .
git commit -m "master/commit-02"
git checkout -b staging
touch file3.txt
git add .
git commit -m "staging/commit-01"
touch file4.txt
git add .
git commit -m "staging/commit-02"
git checkout -b test
touch file5.txt
git add .
git commit -m "test/commit-01"
git checkout master
git checkout -b fix/prod_is_down
touch file6.txt
git add .
git commit -m "fix_prod_is_down/commit-01"
```

# Первый сценарий

Релиз в production - все коммиты должны быть в ветке master (кроме коммитов из ветки fix/prod_is_down).

```
git rebase staging master
git rebase test master
```

# Второй сценарий

Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках.

```
git rebase fix/prod_is_down master
git rebase fix/prod_is_down staging
git rebase fix/prod_is_down test
```

# Результат состояния веток

Итоговый список коммитов в каждой из веток.

##### Ветка master
```
[belhard@10 git-homework]$ git checkout master
Switched to branch 'master'
[belhard@10 git-homework]$ git log --oneline
7e4f32d test/commit-01
cbe669f staging/commit-02
6c7ceb9 staging/commit-01
4f51074 fix_prod_is_down/commit-01
b90687b master/commit-02
8781b1a master/commit-01
```
##### Ветка staging
```
[belhard@10 git-homework]$ git checkout staging
Switched to branch 'staging'
[belhard@10 git-homework]$ git log --oneline
d2a4df4 staging/commit-02
6c7ceb9 staging/commit-01
4f51074 fix_prod_is_down/commit-01
b90687b master/commit-02
8781b1a master/commit-01
```
##### Ветка test
```
[belhard@10 git-homework]$ git checkout test
Switched to branch 'test'
[belhard@10 git-homework]$ git log --oneline
dc7dda3 test/commit-01
4bb3bf9 staging/commit-02
465f3e8 staging/commit-01
4f51074 fix_prod_is_down/commit-01
b90687b master/commit-02
8781b1a master/commit-01
```
##### Ветка fix/prod_is_down
```
[belhard@10 git-homework]$ git checkout fix/prod_is_down
Switched to branch 'fix/prod_is_down'
[belhard@10 git-homework]$ git log --oneline
4f51074 fix_prod_is_down/commit-01
b90687b master/commit-02
8781b1a master/commit-01
```
