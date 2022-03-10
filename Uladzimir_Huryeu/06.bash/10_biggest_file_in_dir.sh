#!/bin/bash
echo "Enter the absolute path to directory"
read P
cd $P
ls -alhS | grep '^-' | head -10
