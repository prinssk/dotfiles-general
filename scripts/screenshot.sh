#!/usr/bin/env bash

dir="$HOME/ss"
mkdir -p "$dir"

file="$dir/chop_$(date +%Y_%m_$d_%S).png"

region="$(slurp)"
[ -z "$region" ] && exit 0   # user cancelled

grim -g "$region" "$file"
