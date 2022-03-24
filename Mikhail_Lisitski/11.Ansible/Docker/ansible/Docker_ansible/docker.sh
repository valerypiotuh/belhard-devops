#!/bin/bash

mkdir ~/log

cd ~/Docker_ansible/

docker build . -t speedtest 
docker run -v ~/log:/app/data speedtest
