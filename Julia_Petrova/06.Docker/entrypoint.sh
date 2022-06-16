#!/bin/sh
apk update && apk add speedtest-cli
speedtest-cli --bytes >> log.txt 
