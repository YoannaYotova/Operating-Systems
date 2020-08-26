#!/bin/bash

if [ $# -lt 1 ]; then
	echo "There should be at leats 1 argument"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "First argument should be a directory"
	exit 2
fi

if [ -z $2 ]; then
	find -L $1 -type l 2>/dev/null
else
	find $1 -type f -links +$2
fi

### official solution:  ###

# check_dir() {
#	if [ ! -d "$1" ]; then
#		echo "$1 not a dir"
#		exit 2
#	fi
# }

# case $# in
#	1)
#	check_dir "$1"
#	find -L $1 -type l
#	;;
#	2)
#	check_dir "$1"
#	for i in $(find "$1" -type f); do
#		if [ $(stat -c ’%h’ "${i}") -ge $2 ]; then
#			echo "${i}"
#		fi
#	done
#	;;
#	*)
#	echo "usage: $0 <dirname> [<number>]"
# 	exit 1
# esac
