#1/bin/bash

core=~/teach/06.bash/core/linux-5.19-rc1/

for f in $(grep -o  -i -r -a 'fuck*' $core | wc -l)
do
echo "Всего fuck*: "$f
done

for s in $(grep -o  -i -r -a 'shit*' $core | wc -l)
do
echo "Всего shit*: "$s
done

for c in $(grep -o -i -r -a 'crap*' $core | wc -l)
do
echo "Всего crap*: "$c
done

for b in $(grep -o -i -r -a 'bastard' $core | wc -l)
do
echo "Всего bastard: "$b
done

for p in $(grep -o -i -r -a 'penguin' $core | wc -l)
do
echo "Всего penguin: "$p
done
