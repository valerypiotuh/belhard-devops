#!/bin/bash

some="fuck* shit* crap* bastard penguin"


for i in $some
do
	for v in $(grep -o -i -r -a $i linux-5 | wc -l)
	do
	echo Всего $i= $v
	done
done

#result:
#Всего fuck*= 1689
#Всего shit*= 1381271
#Всего crap*= 52429
#Всего bastard= 24
#Всего penguin= 119

