#!/bin/sh
apk update && apk add bash, curl, git, wget
wget https://install.speedtest.net/app/cli/ookla-speedtest-1.1.1-linux-x86_64.tgz
tar zxvf ookla-speedtest-1.1.1-linux-x86_64.tgz
./speedtest --accept-license > results.txt