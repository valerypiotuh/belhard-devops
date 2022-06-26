# 05.Dcker
___

##### Задание:

- Dockerfile_HW
```sh
FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY entrypoint_HW.sh /entrypoint_HW.sh
ENTRYPOINT ["/entrypoint_HW.sh"]
```

- entrypoint_HW.sh
```sh
#!/bin/sh
#apk update && apk add curl && apk add wget && apk add git && apk add bash && apk add py3-pip
#pip install speedtest-cli
#speedtest-cli > log.txt
# Так делать не надо, но на посмотреть -it захотелось =)
echo -e "\033[37;1;41m apk update \033[0m"
apk update
echo -e "\033[37;1;41m apk add curl \033[0m"
apk add curl
echo -e "\033[37;1;41m apk add wget \033[0m"
apk add wget
echo -e "\033[37;1;41m apk add git \033[0m"
apk add git
echo -e "\033[37;1;41m apk add bash \033[0m"
apk add bash
echo -e "\033[37;1;41m apk add py3-pip \033[0m"
apk add py3-pip
echo -e "\033[37;1;41m pip install speedtest-cli \033[0m"
pip install speedtest-cli
echo -e "\033[37;1;41m speedtest-cli \033[0m"
speedtest-cli | tee log.txt
```
- Ссылка: stopgamezz/speedtest (https://hub.docker.com/r/stopgamezz/speedtest)
