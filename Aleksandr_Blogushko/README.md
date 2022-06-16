# ДЗ 05.GIT
## Создане необходимой структуры файлов\коммитов для выполнения сценариев
### Ветка `master`
Использовались команды
```
git init
touch master1
git add master1
git commit -m "add master1 file"
touch master2
git add master2
git commit -m "add master2 file"
```
Результат
```
git checkout master
git log --oneline
	321d335 (HEAD -> master) add master2 file
	34f87b8 add master1 file
```
### Ветка `staging`
Использовались команды
```
git checkout -b staging
touch staging1
git add staging1
git commit -m "add staging1 file"
touch staging2
git add staging2
git commit -m "add staging2 file"
```
Результат
```
git checkout staging
git log --oneline
	663c446 (HEAD -> staging) add staging2 file
	bb44d6c add staging1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
### Ветка `test`
Использовались команды
```
git checkout -b test
touch test1
git add test1
git commit -m "add test1 file"
```
Результат
```
git checkout test
git log --oneline
	9cda287 (HEAD -> test) add test1 file
	663c446 (staging) add staging2 file
	bb44d6c add staging1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
### Ветка `create fix/prod_is_down`
Использовались команды
```
git checkout master
git checkout -b fix/prod_is_down
touch fix1
git add fix1
git commit -m "add fix1 file"
```
Результат
```
git checkout fix/prod_is_down
git log --oneline
	ad1e5b5 (HEAD -> fix/prod_is_down) add fix1 file
	321d335 (master) add master2 file
	34f87b8 add master1 file
```
## Сценарии
### Сценарий 1 `Релиз в production`
Все коммиты из веток `staging` и `test` должны быть перенесены в ветку `master`

Использовались команды
```
git rebase staging master
git rebase test master
```
Результат
```
git checkout master
git log --oneline
	9cda287 (HEAD -> master, test) add test1 file
	663c446 (staging) add staging2 file
	bb44d6c add staging1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
### Сценарий 2 `Развертывание fix`
Все коммиты из ветки `fix/prod_is_down` должны быть перенесены в ветки `master` `staging` `test`

Использовались команды
```
git rebase fix/prod_is_down master
git rebase fix/prod_is_down staging
git rebase fix/prod_is_down test
```
Результат
```
git checkout master
git log --oneline
	5a5f357 (HEAD -> master) add test1 file
	cc135e6 add staging2 file
	5f604ab add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
```
git checkout staging
git log --oneline
	7bcb0f6 (HEAD -> staging) add staging2 file
	5ead49a add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
```
git checkout test
git log --oneline
	68b1660 (HEAD -> test) add test1 file
	a25831b add staging2 file
	2894d07 add staging1 file
	ad1e5b5 (fix/prod_is_down) add fix1 file
	321d335 add master2 file
	34f87b8 add master1 file
```
