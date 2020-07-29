#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Invalid number of parameters"
	exit 1
fi

if [[ ! $1 =~ ^[0-9]+$ ]]; then
	echo "The argument must be a number"
	exit 2
fi

if [[ $(id -u) -eq 0 ]]; then
	users=$(ps -e -o user | tail -n +2 | sort | uniq)
	for user in $users; do
		total_rss=0
		while read line; do
			cur_pid=$(echo $line | awk '{pint $1}')
			cur_rss=$(echo $line | awk '{print$2}')
			total_rss=$(( $total_rss + $cur_rss ))
		done < <(ps -u $user -o pid,rss | tail -n +2 | sort -n -k2)
	
	echo "user: $user , total_rss: $total_rss"
	if [[ $total_rss -gt $1 ]]; then
		echo "greater than $1, will kill $cur_pid"
		kill -s SIGTERM $cur_pid
		sleep 2
		kill -s SIGKILL $cur_pid
	fi
	done
else
	echo "Must be root"
	exit 3
fi
