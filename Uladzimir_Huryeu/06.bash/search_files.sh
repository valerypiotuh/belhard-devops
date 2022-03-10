#!/bin/bash
echo "Enter the absolute path to kernel files"
read P
echo "Starting count"
RESULT01=$( grep -i -r -E "\bfuck" $P | wc -l )
echo "fuck* =" $RESULT01
RESULT02=$( grep -i -r -E "\bshit" $P | wc -l )
echo "shit* =" $RESULT02
RESULT03=$( grep -i -r -E "\bcrap" $P | wc -l )
echo "crap* =" $RESULT03
RESULT04=$( grep -i -r "\<bastard\>" $P | wc -l )
echo "bastard =" $RESULT04
RESULT05=$( grep -i -r "\<penguin\>" $P | wc -l )
echo "penguin =" $RESULT05
