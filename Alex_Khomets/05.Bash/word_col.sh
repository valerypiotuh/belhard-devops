#!/bin/bash
col=$(grep -ioar $1 $2 | wc -l)
echo "'$1' count: " $col >> word_col.txt
