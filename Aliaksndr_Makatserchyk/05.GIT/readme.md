# GIT-домашняя работа
1. Создаем папку "Домашка": `mkdir 05.git`
2. Делаем папку репозиторием командой `git init`
3. Находясь в ветке "master", создаем 2 текстовых файла с названиями "file1" и "file2":
>`nano file1`
>
>`nano file2`
4. Добавляем файлы в контроль: `git add --all`
5. Создаем коммит: `git commit -m "commit 1 vetki master"`
6. Далее по аналогии
>`nano file3`
>
>`git add file3`
>
>`git commit -m "commit 2 vetki master"`
7. Создаем новую ветку и автоматически в нее попадаем `git checkout -b staging`
8. Снова создаем файл и пишем команды по аналогии:
>`nano file4`
>
>`git add file4`
>
>`git commit -m "dop commit 1 for staging"`
>
>`nano file5`
>
>`git add file5`
>
>`git commit -m "dop commit 2 for staging"`
9. По аналогии работаем с веткой test
>`git checkout -b test`
>>
>`nano file6`
>>
>`git add file6`
>
>`git commit -m "dop commit for test"`
10. Переходим в ветку master, создаем ветку fix/prod_is_down и создаем коммит

>`git checkout master`
>
>`git checkout -b fix/prod_is_down`
>
>`nano file7`
>
>`git add --all`
>
>`git commit -m "dop commit for branch vetki fix/prod_is_down"`
<b>ЗАДАНИЕ 1</b>

Релиз в production - все коммиты должны быть в ветке master (кроме коммитов в ветке fix/prod_is_down)

`git checkout master`

`git cherry-pick staging test`

<b>ЗАДАНИЕ 2</b>

Развертывание fix - коммит из ветки fix/prod_is_down должен быть во всех ветках

>git rebase fix/prod_is_down
>
>git checkout staging
>
>git rebase fix/prod_is_down
>
>>тест проверки git
>
>git rebase fix/prod_is_down
В конце этих сценариев Вы должны предоставить список коммитов в вышеуказанных ветках в качестве отчета о выполненном ДЗ

`git log --all --graph --decorate > otchet.txt`

