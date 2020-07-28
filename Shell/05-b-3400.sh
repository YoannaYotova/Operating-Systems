#!/bin/bash
# Да се напише shell скрипт, който чете от стандартния вход име на файл и символ# ен низ, проверява дали низа се съдържа във файла и извежда на стандартния изхо# д кода на завършване на командата с която сте проверили наличието на низа.

read -p "Enter a file: " file
read -p "Enter a string: " str

if [[ ! -f $file ]]; then
	echo "There is no file!"
	exit 1
fi

if [[ -z $str ]]; then
	echo "You did not enter a valid string!"
	exit 2
fi

if [[ $file =~ .*"${str}".* ]]; then
	echo $?
	echo "Yes"
else
	echo $?
	echo "No"
fi

