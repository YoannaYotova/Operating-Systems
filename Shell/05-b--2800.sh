#!/bin/bash
# Да се напише shell скрипт, който проверява дали подаденият му параметър се със# тои само от букви и цифри.

if [[ ! $1 ]]; then
	echo "Missing argument"
	exit 1
fi

if [[ ! $1 =~ [^a-zA-Z0-9]+ ]]; then

	echo "Your input contains only letters and digits"
else
	echo "Your input does not contain only letters and digits"
fi
