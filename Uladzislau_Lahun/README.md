#05.Git
*Создал у себя на локальной машине Git репозиторий `test_rep`
*Поочередно создал два файла и закомитил, создалась ветка `master`
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 029a23dd4593809586da0e4c867f8deda5e0710c (HEAD -> master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
*Создал и перешел на ветку `staging`, также создал два файла и *сделал комиты
```
belhard@srv-ubuntu:~/test_rep$ git log
commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (HEAD -> staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
belhard@srv-ubuntu:~/test_rep$ git checkout -b test
Switched to a new branch 'test'
```
*Создал и перешел на ветку `test`, создал файл и сделал комит
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 55b83b7b463e51fb1d62166acca2f42482924462 (HEAD -> test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
*Перешел на ветку `master`
*Создал и перешел на ветку `fix/prod_is_down`, создал файл, закомитил.
```
belhard@srv-ubuntu:~/test_rep$ git log
commit 00159038974a372fa784a84639596d49de8dcdf0 (HEAD -> fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 029a23dd4593809586da0e4c867f8deda5e0710c (master)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```

##Сценарии

###1. Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down)

Из ветки `master` смержил все остальные ветки кроме `fix/prod_is_down`

```
belhard@srv-ubuntu:~/test_rep$ git log
commit 55b83b7b463e51fb1d62166acca2f42482924462 (HEAD -> master, test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```

###2. Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках

Из каждой ветки смержил ветку `fix/prod_is_down`

```
belhard@srv-ubuntu:~/test_rep$ git checkout master
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit e1026859dc5246957d0f694c45687246f6bc7b5c (HEAD -> master)
Merge: 55b83b7 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:45:49 2022 +0000

    Merge branch 'fix/prod_is_down'

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 55b83b7b463e51fb1d62166acca2f42482924462 (test)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7 (staging)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1


belhard@srv-ubuntu:~/test_rep$ git checkout staging
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit ec930280368205c9a6158ffac6c5bd11d90e580f (HEAD -> staging)
Merge: c158e9b 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:46:45 2022 +0000

    Merge branch 'fix/prod_is_down' into staging

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1


belhard@srv-ubuntu:~/test_rep$ git checkout test
belhard@srv-ubuntu:~/test_rep$ git merge fix/prod_is_down
belhard@srv-ubuntu:~/test_rep$ git log
commit 493a8bd9fb25c60825e6f49399ed8ff4c4a5e358 (HEAD -> test)
Merge: 55b83b7 0015903
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:47:39 2022 +0000

    Merge branch 'fix/prod_is_down' into test

commit 00159038974a372fa784a84639596d49de8dcdf0 (fix/prod_is_down)
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:05:19 2022 +0000

    create test6

commit 55b83b7b463e51fb1d62166acca2f42482924462
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:03:34 2022 +0000

    create test5

commit c158e9bc6850a248e78e52e87d2104f5e2f2a6e7
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:50 2022 +0000

    create test4

commit 36e10b8f091f22080b5836bbb7255315fe001e3e
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 15:01:24 2022 +0000

    create test3

commit 029a23dd4593809586da0e4c867f8deda5e0710c
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:19 2022 +0000

    create test2

commit f8be0d463cb2f5886d26c060cc6a55601ce36af2
Author: Uladzislau Lahun <vladok.13.97@gmail.com>
Date:   Mon Jun 6 14:59:04 2022 +0000

    create test1
```
