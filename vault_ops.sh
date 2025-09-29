 #!/bin/bash

while true
do
        echo -e "1. Add Secret\n2. Update Secret\n3. Add Log Entry\n4. Access Keys\n5. Exit"
        read -p "Enter Selection: " usrMenuSelect 

        case $usrMenuSelect in
                [1])
                        read -p "What's the secret: " newSecret

                        if grep -Fxq "$newSecret" secure_vault/secrets.txt; then
                                echo -e "Secret already Exists!"
                                continue
                        else
                                echo $newSecret >> secure_vault/secrets.txt
                                echo -e "Secret Added"
                                continue
                        fi
                ;;
                [2])
                        read -p "What secret do you wish to replace: " usr_1

                        if grep -Fxq "$usr_1" secure_vault/secrets.txt ; then
                               read -p "What do you wanna change it to: " updatedSecret
                                sed -i "s/$usr_1/$updatedSecret/" secure_vault/secrets.txt
                                echo -e "Secret Changed"
                                continue
                        else
                                echo -e "No Match Found."
                                continue
                        fi
                ;;
                [3])
                        
                        read -p "Enter log: " usrEntry
                        echo -e $usrEntry \nWritten on: $(date) "  >> secure_vault/logs.txt
                        echo -e "\n"
                        cat secure_vault/logs.txt
                        echo -e "Log Updated!"
                ;;
                [4])
                        echo -e "Access Denied"
                        continue
                ;;
                [5])
                       exit
                ;;
        esac
        sleep 1
done
