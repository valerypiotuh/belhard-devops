# Создание Docker образа

Описываем слои необходимые для образа:
##### Dockerfile
```
FROM alpine:latest

RUN mkdir /app
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
```

---

Описываем скрипт, который необходимо выполнить с запуском контейнера:
##### entrypoint.sh
```
#!/bin/sh

apk update && apk add curl wget git bash speedtest-cli

speedtest-cli > speedtest-cli.log
```

---

Собираем и тегируем образ:
```
docker build . -t speedtest
```

---

Запускаем контейнер из образа и монтируем к рабочей папке контейнера локальную папку ~/log:
```
docker run -d -v ~/log:/app speedtest
```

---

Результат работы контейнера:
##### ~/log/speedtest-cli.log
```
Retrieving speedtest.net configuration...
Testing from A1 Belarus (46.53.249.206)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Amigo.Minsk (Minsk) [0.29 km]: 30.609 ms
Testing download speed................................................................................
Download: 67.52 Mbit/s
Testing upload speed......................................................................................................
Upload: 94.58 Mbit/s
```

# Загрузка Docker образа на Docker Hub

Тегируем образ:
```
docker tag speedtest:latest aleksyglvnw/speedtest
```

---

Авторизуемся и отправляем образ:
```
docker login
docker push aleksyglvnw/speedtest
```

---

Образ доступен по [cсылке](https://hub.docker.com/r/aleksyglvnw/speedtest).
