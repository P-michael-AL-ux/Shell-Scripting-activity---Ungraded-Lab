#!/bin/bash

 while true; do
  echo " 1) Add a new secret "
  echo " 2) Update the secret "
  echo " 3) Add log entry "
  echo " 4) Access keys "
  echo " 5) Exit "

  read -p "Choice an option:" option

  case $option in 
   1) 
     read -p "Add a new secret:" secret
     echo "$secret" >> ~/secure_vault/secrets.txt
     echo -e "\nThe new secret was added to secrets.txt\n"
     ;;

   2) 
      read -p " Enter the old secret:" oldSecret
      read -p " Enter new secret:" newSecret 
      if grep -q "$oldSecret" ~/secure_vault/secrets.txt; then 
        sed -i "s/$oldSecret/$newSecret/g" ~/secure_vault/secrets.txt 
        echo -e "\nThe secret has been updated from $oldSecret to $newSecret \n"

       else
      
       echo -e "\nNo match found\n"
     
     fi
     ;;
 
  3) 
     timestamp=$(date)
     read -p " Enter the log message: " message
     echo " ($timestamp) $message " >> ~/secure_vault/logs.txt
     echo -e "\n The log entry has beeen added to logs.txt \n"
     ;;
       
  4) 
     echo -e "\n ACCESS DENIED \n"
     ;;
  5)
     break 
     ;;


 esac

done
