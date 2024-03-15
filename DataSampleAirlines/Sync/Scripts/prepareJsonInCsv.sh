#!/bin/bash

echo "Запускаем правку json"

# Проверяем, передан ли путь к файлу в качестве аргумента
if [ $# -eq 0 ]; then
  echo "Использование: $0 <путь к файлам>"
  exit 1
fi

# Путь к файлам, которые нужно изменить
FILES_PATH=$1

# Цикл по файлам, соответствующим пути FILES_PATH
for file in `find $FILES_PATH -type f -name "*"`
do
   sed -i 's/""/\\"/g' "$file"
done

echo "Замена выполнена."