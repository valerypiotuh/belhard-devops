#!/bin/bash


i="$1"
test="Page first Docker"

while [ $i -gt 0 ];
do
  i=$[ $i - 1 ];
  a="$(curl -s 127.0.0.1:8300)"
  echo "$a"
  if [ "$a" = "$test" ];
  then w10=$(( $w10 + 1 )) # можно и []
	else w5=$(( $w5 + 1 ))
  fi
done
echo "8100 = $w10"
echo "8200 = $w5"

