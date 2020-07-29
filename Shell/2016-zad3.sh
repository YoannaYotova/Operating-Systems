#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
	exit 1
fi

while read user; do
	echo "user-> $user"
    username=$(echo $user | cut -d ':' -f 1)
    uid=$(echo $user | cut -d ':' -f 3)
    gid=$(echo $user | cut -d ':' -f 4)
    home=$(echo $user | cut -d ':' -f 6)

    if [[ -z $home ]]; then
        echo "$username has no homedir set"
        continue
    fi

    if [[ ! -d $home ]]; then
        echo "$username has homedir $home but is not a directory"
        continue
    fi

    dir_permissions=$(ls -ld $home | awk '{print $1}')
    dir_owner=$(ls -ld $home | awk '{print $3}')

    if [[ $dir_owner != $username ]]; then
        echo "$username is not owner of $home"
        continue
    fi

    if [[ $(echo $dir_permissions | cut -c 3) != "w" ]]; then
        echo "$username (owner) cannot write in $home"
    fi
done < <(cat ~/passwd)
