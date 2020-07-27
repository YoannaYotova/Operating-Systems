#!/bin/bash
if [ $# -ne 1 ]; then
	echo "There is no file"
	exit 1
fi

if [ ! -f $1 ]; then
	echo "The given file does not exist!"
	exit 1
fi

max_depth=0
cur_depth=0

for word in $(cat $1); do
	if [ $word = '{' ]; then
		cur_depth=$((cur_depth+1))
		if [ $cur_depth -gt $max_depth ]; then
			max_depth=curdepth
		fi
	elif [ $word = '}' ]; then
		cur_depth=$(( cur_depth - 1 ))
	fi
done

echo "The deepest nesting is $max_depth levels"
