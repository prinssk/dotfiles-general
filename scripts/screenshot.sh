#!/usr/bin/env bash

dir="$HOME/ss"
mkdir -p "$dir"

file="$dir/chop_$(date +%Y_%m_$d__%H_%M_%S).png"

region="$(slurp)"
[ -z "$region" ] && exit 0   # user cancelled

grim -g "$region" "$file"

wl-copy < "$file"
cliphist store < "$file"

kitty
echo -e "\nSelection\n> [D]elete\n> [R]ename"
read imp
if [ "$imp" == "D" || "$imp" == "d" ]; then
	rm $file
elif [ "$imp" == "R" || "$imp" == "r" ]; then
	read -p $'\nNew file name: ' filen
	mv $file $filen
else
	echo "[!] Something went wrong!"
fi
