Ссылка на образ - https://hub.docker.com/repository/docker/sergkharkin/speedtest

cat Dockerfile 

FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

cat entrypoint.sh 

#!/bin/sh
apk update && apk add curl wget git bash
apk add speedtest-cli
speedtest-cli >> /app/speedtest.log
