#!/bin/bash

if [[ $(id -u) -eq 0 ]]; then
	echo "not a root"
	exit 1
fi

cat /etc/passwd | while read line; do
	user=$(echo $line | cut -d ':' -f1)
	uid=$(echo $line | cut -d ':' -f3)
	home=$(echo $line | cut -d ':' -f6)

	if [[ -z $home ]]; then
		echo "$user has no homedir"
		continue
	fi

	if [[ ! -d $home ]]; then
		echo "$user has a homedir $home but it is not a directory"
		continue
	fi
	
	dirperm=$(ls -ld $home | awk '{print $1}')
	dirowner=$(ls -ld $home | awk '{print $3}')

	echo "dirperm --> $dirperm"
	echo "dirowner --> $dirowner"

	if [[ $dirowner != $user ]]; then
		echo "$user is not an owner"
		continue
	fi

	if [[ $(echo $dirperm | cut -c 3) != 'w' ]]; then
		echo "$user cannot write in $home"
	fi
done	
