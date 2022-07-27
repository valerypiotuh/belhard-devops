#!/bin/bash
find ${testpath} -type f -exec ls -s {} \; | sort -n -r | head -10 >> top10.txt
echo "" >> top10.txt
