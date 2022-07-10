# 05.Git#

####Создать ветку мастер####
#####в ней 2 коммита mast1 и mast2#####

######git init######
######nano mast1######
######git add mast1######
######git commit -m "add mast1"######
######nano mast2######
######git add mast2######
######git commit -m "add mast2"######

####Создать ветку staging####
#####в ней 2 коммита из мастера mast1 и mast2 и 2 новых коммита stag1 и stag2#####

git checkout -b staging
nano stag1
nano stag2
git add --all
git commit -m "add stag1 and stag2"

####Создать ветку test####
#####в ней 2 коммита из master и 2 коммита из staging + добавить ещё один новый коммит#####

git checkout -b test
nano test1
git add test1
git commit -m "add test1"

####Создать ветку fix/prod_is_down####
#####в ней 2 коммита mast1 и mast2 и ещё один дополнительный#####

git checkout master
git checkout -b fix/prod_is_down
nano fix1
git add fix1
git commit  -m "add fix1"

####Сценарий 1####
##### все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down)#####

git checkout master
git rebase staging
git rebase test

####Сценарий 2####
#####коммит из ветки fix/prod_is_down должен быть во всех ветках#####

git rebase fix/prod_is_down master
git rebase fix/prod_is_down staging
git rebase fix/prod_is_down test
