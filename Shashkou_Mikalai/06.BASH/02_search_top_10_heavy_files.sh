#1/bin/bash

core=~/teach/06.bash/core/linux-5.19-rc1/

find $core -type f -printf "%s %p\n" | sort -rn | head -n 10
