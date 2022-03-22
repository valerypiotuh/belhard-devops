#!/bin/bash
echo "Текстовых файлов со словом fuck: `grep -Rwi "fuck*" /home/dima/linux/linux-5.16.13 | wc -l`" > badwords.txt
echo "Текстовых файлов со словом shit: `grep -Rwi "shit*" /home/dima/linux/linux-5.16.13 | wc -l`" >> badwords.txt
echo "Текстовых файлов со словом crap: `grep -Rwi "crap*" /home/dima/linux/linux-5.16.13 | wc -l`" >> badwords.txt
echo "Текстовых файлов со словом bastard: `grep -Rwi "bastard" /home/dima/linux/linux-5.16.13 | wc -l`" >> badwords.txt
echo "Текстовых файлов со словом penguin: `grep -Rwi "penguin" /home/dima/linux/linux-5.16.13 | wc -l`" >> badwords.txt
