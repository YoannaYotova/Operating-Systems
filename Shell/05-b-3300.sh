#!/bin/bash
# Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла, # обединява редовете на първите два (man paste), подрежда ги по азбучен ред и ре# зултата записва в третия файл.

read -p "Enter first file: " first
read -p "Enter second file: " second
read -p "Enter output file: " output

if [[ ! -f "${first}" || ! -f "${second}" ]]; then
	echo "Something wrong"
	exit 1
fi

cat $first $second | sort > $output
echo "Result in "${output}""
