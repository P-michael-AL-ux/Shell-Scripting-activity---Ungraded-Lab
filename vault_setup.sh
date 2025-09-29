#!/bin/bash
direc="~/secure_vault"
file_1="~/secure_vault/keys.txt"
file_2="~/secure_vault/secrates.txt"
file_3="~/secure_vault/logs.txt"


mkdir -p "$direc"

echo "Welcome" > "$file_1"
echo "Welcome" > "$file_2"
echo "Welcome" > "$file_3"

#for files [ $direc "*txt" ]; then
#   echo "welcome" > $files


echo "...........successful.........."

ls -l "$direc"
