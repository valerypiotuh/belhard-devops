#!bin/bash

#grep -R -i -E -l "fuck | shit | crap | bastard | penguin" ~/yadro/* 

arrfuck=( $(grep -R -i -E -l "fuck" ~/yadro/*) )
echo "Слово Fuck встречается ${#arrfuck[@]} раз" > slova

arrshit=( $(grep -R -i -E -l "shit" ~/yadro/*) )
echo "Слово Shit встречается ${#arrshit[@]} раз" >> slova

arrcrap=( $(grep -R -i -E -l "crap" ~/yadro/*) )
echo "Слово Crap встречается ${#arrcrap[@]} раз" >> slova

arrbastard=( $(grep -R -i -E -l "bastard" ~/yadro/*) )
echo "Слово Bastard встречается ${#arrbastard[@]} раз" >> slova

arrpenguin=( $(grep -R -i -E -l "penguin" ~/yadro/*) )
echo "Слово Penguin встречается ${#arrpenguin[@]} раз" >> slova
