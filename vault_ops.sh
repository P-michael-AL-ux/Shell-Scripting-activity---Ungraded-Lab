 #!/bin/bash

#!/bin/bash

# Ensure directory and files exist
mkdir -p secure_vault
touch secure_vault/secrets.txt secure_vault/logs.txt secure_vault/keys.txt

while true
do
    echo -e "1. Add Secret"
    echo -e "2. Update Secret"
    echo -e "3. Add Log Entry"
    echo -e "4. Access Keys"
    echo -e "5. Exit"
    read -p "Enter Selection: " usrmenu 

    case $usrmenu in
        1)
            read -p "What's the secret: " newsecret
            if grep -Fxq "$newsecret" secure_vault/secrets.txt; then
                echo "Secret already exists,try another one"
            else
                echo "$newSecret" >> secure_vault/secrets.txt
                echo "Secret added sucessfully."
            fi
            ;;
        2)
            read -p "What secret do you wish to replace: " usr_1
            if grep -Fxq "$usr_1" secure_vault/secrets.txt ; then
                read -p "What do you want to change it to: " updateds
                sed -i "s|$usr_1|$updateds|" secure_vault/secrets.txt
                echo "Secret changed sucessfully."
            else
                echo "No match found."
            fi
            ;;
        3)
            read -p "Enter log: " usrinput
            printf "$usrinput \nWritten on: $(date)" >> secure_vault/logs.txt
            echo "Log updated! Current logs:"
            cat secure_vault/logs.txt
            ;;
        4)
            echo "Access Denied"
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    sleep 1
done
