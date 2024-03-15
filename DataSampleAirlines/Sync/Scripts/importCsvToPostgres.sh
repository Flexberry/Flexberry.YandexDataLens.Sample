#!/bin/bash

echo "Запускаем импорт csv в postgres"

conenction_string=$CONNECTION_STRING
db_name=$DB_NAME
user=$USER
path_to_scheme="/tmp/Scheme"
path_to_csv="$path_to_scheme/$db_name.csv"
path_to_import_file="$path_to_scheme/importList.txt"

while read line 
do
	line=$(echo "$line" | tr -d '\n\r')
	csv_file_name="${path_to_csv}/${line}.csv"
	read -r columns < "$csv_file_name"
	
	psql -h ${conenction_string} -d ${db_name} -U ${user} -c "\copy ${line} (${columns}) FROM '${csv_file_name}' WITH (FORMAT csv, ESCAPE '\', HEADER, DELIMITER ',', NULL 'NULL')"

done < $path_to_import_file
