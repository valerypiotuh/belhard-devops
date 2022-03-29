#!/bin/sh

apk update && apk add --no-cache curl wget git py-pip bash
pip install speedtest-cli

speedtest-cli > /app/data/log-speedtest
