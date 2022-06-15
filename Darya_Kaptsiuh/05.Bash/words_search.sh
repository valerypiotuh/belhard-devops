#!/bin/bash

sudo grep -r /home/belhard/devops_course/linux -e crap -e fuck -e penguin -e bastard -e shit > /home/belhard/devops_course/finditems.txt

searched="$1"
src="$2"

while read word; do
	          LINES_COUNT=`grep -c "$word" "$src"`

		              echo "$word: $LINES_COUNT"

			          done < "$searched"
