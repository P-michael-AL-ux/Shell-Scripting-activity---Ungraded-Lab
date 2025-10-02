#!/bin/bash


 dir=~/secure_vault
 touch ~/vault_report.txt

for file in "$dir"/*; do
   if [ -f "$file" ]; then
     filename=$(basename "$file")
     size=$(stat -c %s "$file")
     date=$(stat -c %y "$file")
     perm=$(stat -c %a "$file")


   { 
     echo -e "\n file name: $filename"
     echo -e " size in bytes: $size"
     echo -e " Last modification date: $date" 
     echo -e " Current permisisons: $perm"    
    } >> ~/vault_report.txt
 
      if [ "$perm" -gt 644 ]; then
       echo -e " ⚠️ SECURITY RISK DETECTED " >> ~/vault_report.txt
      fi
    fi
done

   echo -e "\n The vault_report.txt has been created .\n"

