#!/bin/bash
echo "Файлов с именем fuck: `grep -Rwi "fuck*" /root/linux-5.16.11 | wc -l`"
echo "Файлов с именем shit: `grep -Rwi "shit*" /root/linux-5.16.11 | wc -l`"
echo "Файлов с именем crap: `grep -Rwi "crap*" /root/linux-5.16.11 | wc -l`"
echo "Файлов с именем bastard: `grep -Rwi "bastard" /root/linux-5.16.11 | wc -l`"
echo "Файлов с именем penguin: `grep -Rwi "penguin" /root/linux-5.16.11 | wc -l`"
