#!/bin/bash
direc="$HOME/secure_vault"
file_1="$HOME/secure_vault/keys.txt"
file_2="$HOME/secure_vault/secrates.txt"
file_3="$HOME/secure_vault/logs.txt"


mkdir -p "$direc"

echo "Welcome" > "$file_1"
echo "Welcome" > "$file_2"
echo "Welcome" > "$file_3"

#for files [ $direc "*txt" ]; then
#   echo "welcome" > $files


echo "...........successful.........."

ls -l "$direc"
