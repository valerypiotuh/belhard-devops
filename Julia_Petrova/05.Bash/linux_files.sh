#!/bin/bash

echo $(date +%F %T) >> linux_files.log
du -ah $1 | grep -v '\s/[^.]*$' | sort -rh | head -10 >> linux_files.log
echo "" >> linux_files.log
