#!/bin/bash
# Напишете shell script, който по подаден като аргумент файл с map между \<nickn# ame\> -> <реален sername в os-server> и nickname, ще ви улесни да изпращате с # ъобщения на хората.

if [[ $# -ne 2 ]]; then
	echo "Invalid number of arguments"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "Invalid file"
	exit 2
elif [[ ! -r $1 ]]; then
	echo "This file is not readable"
	exit 3
fi

if [[ -z $2 ]]; then
	echo "Invalid nickname"
	exit 4
fi

num_nickname=$(cat $1 | egrep "${2}" | wc -l)

if [[ $num_nickname -eq 0 ]]; then
	echo "No nickname like this in the address book"
	exit 5
fi

read -p "Enter a message: " message
echo "Sending message to ${2}"
write ${2} "${message}"
exit
