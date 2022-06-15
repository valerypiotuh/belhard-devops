#!/bin/bash

read -rp 'Please enter the path to the folder:' path

sudo find $path -type f -printf '%s\t%f\n' | sort -rn | head -n 10
