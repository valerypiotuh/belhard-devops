### создвем папку Docker
### создаем папку log
### создаем файл Dockerfile1
### создаем скрипт entrypoint.sh даем ему права на выполнение
билдим образ из докер файла
** docker build . -f Dockerfile1 -t speedtest **
запуск контейнера с монитрованием локальной паппки
** docker run -d -v ~/log:/app speedtes **
результат работы в докер контейнере в папке ~/log
зарегился на докер хабе
ставим метку
** docker tag speedtest artemka123/dockerspeedtest **
пушим на докер хаб
** docker push artemka123/dockerspeedtest **

https://hub.docker.com/layers/195908550/artemka123/dockerspeedtest/latest/images/sha256-06068a083e82397d8e408bc4460844277071a18afba6b96cc77268698e12481d?context=repo


