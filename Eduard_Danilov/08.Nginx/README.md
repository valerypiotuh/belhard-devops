1. Установил Nginx
sudo apt install nginx -y
2. Создал папки для контейнеров
mkdir nginx1
mkdir nginx2
3. Создал Dockerfile в каждой папке
nano Dockerfile
4. Создал html-страницу в каждой папке
nano index.html
5. Собрал образы
docker build -t nginx1 .
docker build -t nginx2 .
6. Запустил контейнеры
docker run --name nginx1 -d -p 8100:80 -v /home/user/docker/nginx1:/usr/share/nginx/html nginx1
docker run --name nginx1 -d -p 8200:80 -v /home/user/docker/nginx2:/usr/share/nginx/html nginx2
7. Посмотрел id и IP адреса контейнеров
docker ps
docker inspect a89a16ce2874 | grep IP
docker inspect da82ea6ceea8 | grep IP
8. На локальном сервере Nginx нашел файл default
/etc/nginx/sites-available/default
9. Добавил в него строки 
server {
  listen 8100;
  server_name domain.com;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_pass http://172.17.0.2:80;
    }
}
server {
  listen 8200;
  server_name domain.com;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_pass http://172.17.0.3:80;
    }
}
10. Перезагрузил сервер 
systemctl nginx reload
11. Проверил, чтобы все работало
