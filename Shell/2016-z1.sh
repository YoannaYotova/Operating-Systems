#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "must have one argument"
	exit 1
fi

if [[ ! -d $1 ]]; then
	echo "must be directory"
	exit 2
fi

find -L $1 -type l
