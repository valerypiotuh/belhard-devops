#!/bin/sh
apk update && apk add curl wget git bash 
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
apk update && apk add speedtest-cli
speedtest-cli --bytes > log.txt
