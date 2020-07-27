#!/bin/bash
 
if [[ $# -eq 0 ]]
then
echo "There are no arguments"
exit 1
fi

for i in 1 2 3; 
do
echo "i is $i";
done

echo

for i in $@; do
echo "[$i]"; done

echo

for i in "$@"; do 
echo "[$i]"; done 

echo -e 

for i in $*; do
echo "[$i]"; done 

echo -e

for i in "$*"; do
echo "[$i]"; done 

