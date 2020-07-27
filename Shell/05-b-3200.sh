#!/bin/bash
# Да се напише shell скрипт, който приканва потребителя да въведе пълното име на# директория и извежда на стандартния изход подходящо съобщение за броя на всичк# и файлове и директории в нея.

read -p "Enter a directory:" dir

if [[ ! -d $dir ]]; then
	echo "There is no such a directory!"
	exit 1
fi

find_files=$(find "${dir}" -type f | wc -l)
find_dirs=$(find "${dir}" -type d |wc -l)

echo "There are $find_files files and $find_dirs directories in $dir"
