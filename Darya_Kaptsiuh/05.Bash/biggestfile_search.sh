#!/bin/bash

find ${testpath} -type f -exec ls -s {} \; | sort -n -r | head -10
