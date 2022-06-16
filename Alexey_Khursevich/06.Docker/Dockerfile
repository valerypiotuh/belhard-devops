FROM alpine:latest
RUN apk update && apk add --no-cache curl wget git bash
RUN mkdir /app
RUN wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
RUN chmod +x speedtest-cli
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
