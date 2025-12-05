#!/usr/bin/env bash

# source dir = $; else ask for dir, same with models / basically set variables for the first time

echo -e "\n[ WARNING /!\ ]:  Ai is stupid, Continue? [Y/n]"
read ans
if [[ "$ans" == "yes" || "$ans" == "Y" || "$ans" == "Yes" || "$ans" == "y" || -z "$ans" ]]; then
 source ~/ai-env/bin/activate
 echo "[OK] venv enabled"
fi

echo -e "\n"
ollama list
echo -e "\nSelect a model ^"

read inp

if [ "$inp" -eq 1 ]; then
 ollama run sushruth/solar-uncensored
elif [ "$inp" -eq 2 ]; then
 ollama run deepseek-r1:7b
elif [ "$inp" -eq 3 ]; then
 ollama run deepseek-r1:1.5b
else
 echo "nah sum ting went rong vro"
fi
