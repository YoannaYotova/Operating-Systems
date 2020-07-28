#!/bin/bash
# Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. Напи# шете shell script, който да покaзва колко е дълбоко най-дълбокото nest-ване (в# лагане).

if [[ $# -eq 0 ]]; then
	echo "You did not give an argument"
	exit 1
fi

cur_depth=0
max_depth=0

file=$(cat $1)

for i in $file; do
	if [[ $i = '{' ]]; then
		cur_depth=$(($cur_depth+1))
		if [[ $cur_depth -gt $max_depth ]]; then
			max_depth=$cur_depth
		fi
	elif [[ $i = '}' ]]; then
		cur_depth=$(($cur_depth-1))
	fi
done
echo " The deepest nesting is $max_depth levels."
