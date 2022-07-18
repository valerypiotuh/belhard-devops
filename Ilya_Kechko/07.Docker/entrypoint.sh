#!/bin/sh
apk update && apk add --no-cache curl py-pip wget git bash
pip install speedtest-cli
speedtest-cli > /app/log
