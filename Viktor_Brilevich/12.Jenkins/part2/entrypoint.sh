#!/bin/sh
apk update && apk add --no-cach curl wget git bash speedtest-cli
speedtest-cli >> speedtest.log
