### устанолен nginx проброшен порт 80 на 127.0.0.1:8000
Создал папки для контейнеров в директории с домашкой ng1, ng2

Создал в ng1 Dockerfile1+index.html в ng2 dockerfile2+index.html (в каждом докере установка nginx и замена index.html)

Были собраны два образа docker build . -f dockerfile1(2) -t nginx1(2)

Запустил контейнеры docker run -d -p 81(2)00:80 nginx1(2)

### на основании инспекции контейнеров и поиска ip сдеал файл test в папке с настройками как прокси Nginx /etc/nginx/sites-available/
перегруз systemctl restart nginx

curl 127.0.0.1:8100 --- ok

curl 127.0.0.1:8200 --- ok

проброс портов 
browser opera test --- ok

### устанавливаем docker-compose
создаем папку docker-compose

Создал папки для контейнеров  1 и 2

Создал в папке 1 Dockerfile+index.html в папке 2 Dockerfile+index.html (в каждом докере установка nginx и замена index.html)

создаем файл docker-compose.yml

выполняем команду docker-compouse build

затем выполняем docker-compouse up -d для запуска контейнера в фоновом режиме

порты проброшены , содержимое страниц браузера изменилось

в файле log копия текста терминала
