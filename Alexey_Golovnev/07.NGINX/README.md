# Создание Docker образов

Описываем слои необходимые для образов:
##### Dockerfile_1
```
FROM nginx
COPY index_1.html /usr/share/nginx/html/index.html
```
##### Dockerfile_2
```
FROM nginx
COPY index_2.html /usr/share/nginx/html/index.html
```

---

Создаем необходимые html-файлы:
##### index_1.html
```
<!DOCTYPE html>
<html>
<head>
  <title>My First Nginx Server</title>
</head>
<body>
  <h1>My First Nginx Server</h1>
</body>
</html>
```
##### index_2.html
```
<!DOCTYPE html>
<html>
<head>
  <title>My Second Nginx Server</title>
</head>
<body>
  <h1>My Second Nginx Server</h1>
</body>
</html>
```

---

Создаем Docker образы:
```
docker build . -f Dockerfile_1 -t nginx_image_1
docker build . -f Dockerfile_2 -t nginx_image_2
```

# Запускаем Docker контейнеры

Запуск контейнеров и проброс 80 порта:
```
docker run --name nginx_1 -d -p 8100:80 nginx_image_1
docker run --name nginx_2 -d -p 8200:80 nginx_image_2
```

# Установка и настройка Nginx

Устанавливаем локально nginx:
```
apt update
apt install nginx -y
systemctl status nginx
```

---

Настраиваем проксирование на Docker контейнеры:
##### /etc/nginx/sites-available/nginx
```
server {
    listen 81;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://127.0.0.1:8100;
    }
}

server {
    listen 82;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://127.0.0.1:8200;
    }
}
```

---

Применяем нашу конфигурацию:
```
ln -s /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/
systemctl reload nginx
```
