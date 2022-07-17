#!/bin/sh
mkdir /app
apk update && apk add --no-cache curl wget git bash speedtest-cli
speedtest-cli --bytes > log.txt 
