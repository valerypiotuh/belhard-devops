#!/bin/sh
apk update && apk add --no-cach curl wget git bash speedtest-cli
date > speedtest.log && speedtest-cli >> speedtest.log
