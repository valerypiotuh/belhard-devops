#!/bin/sh

apk update
apk add --no-cache curl wget git bash speedtest-cli
speedtest-cli > $(hostname -s)-speedtest.log
