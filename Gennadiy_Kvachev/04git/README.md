# Описание выполненной работы
-
## master
```
[belhard@centos7 dz04]$ git checkout master
Switched to branch 'master'
[belhard@centos7 dz04]$ git log --oneline
1e98d7b test_commit1
0a68f88 commit2_staging
b6d6218 commit1_staging
0d0517e fixproddown_commit1
16fbf4a commit2
57a1382 commit1
```
## test
```
[belhard@centos7 dz04]$ git checkout test
Switched to branch 'test'
[belhard@centos7 dz04]$ [belhard@centos7 dz04]$ git log --oneline
-bash: [belhard@centos7: command not found
[belhard@centos7 dz04]$ git log --oneline
9580bb2 test_commit1
9946e68 commit2_staging
d8b498f commit1_staging
0d0517e fixproddown_commit1
16fbf4a commit2
57a1382 commit1
```
## staging
```
[belhard@centos7 dz04]$ git checkout staging
Switched to branch 'staging'
[belhard@centos7 dz04]$ git log --oneline
bb875ab commit2_staging
e5c823b commit1_staging
0d0517e fixproddown_commit1
16fbf4a commit2
57a1382 commit1
```
## prod is down
```
[belhard@centos7 dz04]$ git checkout fix/prod_is_down
Switched to branch 'fix/prod_is_down'
[belhard@centos7 dz04]$ git log --oneline
0d0517e fixproddown_commit1
16fbf4a commit2
57a1382 commit1
```
