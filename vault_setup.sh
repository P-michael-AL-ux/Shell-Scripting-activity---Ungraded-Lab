#!/bin/bash
mkdir -p ~/secure_vault

cd ~/secure_vault

touch ~/secure_vault/keys.txt |  #stores encryption keys
touch ~/secure_vault/secrets.txt | #stores confidential data
touch ~/secure_vault/logs.txt | #stores system logs

#Add a welcome message to each file .
 echo " Welcome " > keys.txt
 echo " Welcome " > secrets.txt
 echo " Welcome " > logs.txt

#Add success message and list all files in long format.
  echo " SUCCESS SETUP " && ls -l






