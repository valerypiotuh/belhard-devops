#!/bin/sh
apk update && apk add --no-cach curl wget git bash speedtest-cli
date > /app/speedtest.log && speedtest-cli >> /app/speedtest.log
