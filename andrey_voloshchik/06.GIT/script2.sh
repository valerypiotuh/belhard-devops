#!/bin/bash
find $1 -type f -exec du -sh {} 2>/dev/null + | sort -rh | head -n 10
