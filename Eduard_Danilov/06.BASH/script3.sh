#!bin/bash
read -e -p "Введи каталог, в котором следует искать большие файлы: " filepath
echo $filepath
echo "Введи имя файла, в который нужно сохранить результат"
read otchet
du -ahx $filepath | sort -rh | head -10 > $otchet
echo "Операция выполнена. Результат в файле $otchet"
