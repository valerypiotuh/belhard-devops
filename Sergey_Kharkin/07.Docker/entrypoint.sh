#!/bin/sh
apk update && apk add curl wget git bash
apk add speedtest-cli
speedtest-cli >> /app/speedtest.log
