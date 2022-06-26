#!/bin/bash

echo $(date +%F_%T) >> top10files.log
du -ah $1 | grep -v '\s/[^.]*$' | sort -rh | head -10 >> top10files.log
echo "" >> top10files.log
