#!/bin/bash

### Colors
NOCOLOR='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'

function info() {
  echo -e ${GREEN}$@${NOCOLOR}
}

function error() {
  echo -e ${RED}'Error:' $@${NOCOLOR}
}

function warn() {
  echo -e ${ORANGE}'Warning:' $@${NOCOLOR}
}

function log() {
  echo -e '['$(date +'%Y-%m-%d %H:%M:%S')']' $@ >> $(basename $0)'.log'
}
