#!/bin/bash

find $1 -type f -print0 | xargs -0 du | sort -nr | head -10 | cut -f2 | xargs -I{} du -sh {}
