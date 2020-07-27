#!/bin/bash
#Да се напише shell скрипт, който извежда на стандартния изход факултетния номер# на потребителя, който изпълнява скрипта, или казва "DANGER! It's a teacher!", # ако потребителското име не е факултетен номер.

username=$(whoami)

if [[ $username =~ ^s[0-9]+$ ]]; then
	echo "${username:1}" # Cut first symbol
else
	echo "Danger! It is a teacher!"
fi
