#!/bin/sh
apk update && apk add curl wget git bash speedtest-cli
speedtest-cli > speedtest.txt
