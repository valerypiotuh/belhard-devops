FROM alpine:latest
RUN mkdir /app
WORKDIR /app
RUN apk update && apk add curl wget git bash speedtest-cli
RUN speedtest-cli >> /app/speedtest.log && cat /app/speedtest.log
#COPY entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
