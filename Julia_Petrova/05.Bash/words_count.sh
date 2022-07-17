#!/bin/bash
count=$(grep -ioar $1 $2 | wc -l)
echo $(date +%F %T) "| '$1' count: " $count >> word-count.log
