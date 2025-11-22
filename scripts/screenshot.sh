#!/usr/bin/env bash

dir="$HOME/ss"
mkdir -p "$dir"

file="$dir/chop_$(date +%Y_%m_$d__%H_%M_%S).png"

region="$(slurp)"
[ -z "$region" ] && exit 0   # user cancelled

grim -g "$region" "$file"

wl-copy < "$file"
cliphist store < "$file"
