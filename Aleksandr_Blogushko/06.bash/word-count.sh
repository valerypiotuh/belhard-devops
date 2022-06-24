#!/bin/bash

count=$(grep -ioar $1 $2 | wc -l)
echo $(date +%F_%T) "| '$1' count: " $count >> word-count.log
