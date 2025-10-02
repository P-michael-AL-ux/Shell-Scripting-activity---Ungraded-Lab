#!/bin/bash
#Create a if loop, if secure_vault exists to displays exists and otherwise displays error.
 if [ -d ~/secure_vault ]; then

    echo -e "\nTHE DIRECTORY secure_vault EXISTS.\n";
  else
    echo -e " ERROR "
    exit 1;

  fi
  cd ~/secure_vault
#Update the permissions for keys.txt, secrets.txt, logs.txt.
update_permissions () {
   local file="$1"
   local default_permi="$2"

   echo -e "Current permissions of $file : \n$(ls -l "$file")"

   read -p "Do want to update the permission $file ? (y/n):" question

   if [[ "$question" == "Y" ]] || [[ "$question" == "y" ]]; then

     read -p "Enter new permission e.g 600: " permi 

     chmod "$permi" "$file"

     echo -e "\nPermission updated to $permi\n"
   elif [ -z $question ]; then
     permi=[$permi:-$default_permi]
     echo -e "\n The permissions haven't changed  \n"

   else

     echo -e "\nPermission left unchanged\n"

  fi
 }
    



update_permissions "keys.txt" "644"
update_permissions "secrets.txt" "644"
update_permissions "logs.txt"  "644"

   cd ~/secure_vault
   echo -e "\nFinal permissions for all files:\n" 
    for file in keys.txt secrets.txt logs.txt; do
      ls -l "$file"
    done
