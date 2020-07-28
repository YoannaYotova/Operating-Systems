#!/bin/bash
# Да се напише shell скрипт, който получава при стартиране като параметър в кома# ндния ред идентификатор на потребител. Скриптът периодично (sleep(1)) да прове# рява дали потребителят е log-нат, и ако да - да прекратява изпълнението си, из# веждайки на стандартния изход подходящо съобщение.

if [[ $# -ne 1 ]]; then
	echo "Invalid number of arguments"
	exit 1
fi

user="${1}"

num_user=$(cat ~/passwd | grep "$user" | wc -l)

if [[ $num_user -eq 0 ]]; then
	echo "There is no user with this name"
	exit 2
fi

until who -u | grep "$user"; do
	sleep 1
done

echo "User ${user} has just logged in"
