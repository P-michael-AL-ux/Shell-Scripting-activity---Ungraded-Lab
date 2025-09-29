#!/bin/bash
# Check if directory exists
if [[ ! -d "$HOME/secure_vault" ]]; then
    echo "Error: Directory does not exist"
    exit 1
fi

cd "$HOME/secure_vault" || exit 1

# Display current permissions
ls -l

update_permission() {
    file_name=$1
    default_perm=$2

    echo ""
    echo "Processing file: $file_name (default: $default_perm)"

    if [[ ! -f $file_name ]]; then
        echo "Warning: $file_name does not exist"
        return
    fi

    read -p "Do you want to update the permission for $file_name? (yes/no) " choice

    if [[ $choice =~ ^(yes|Yes|YES)$ ]]; then
        read -p "Enter the new permission (e.g. 600, 644): " new_perm
        chmod "$new_perm" "$file_name"
        echo "Updated $file_name to permission $new_perm"
    elif [[ -z $choice ]]; then
        chmod $default_perm "$file_name"
        echo "No input given, reverted $file_name to default permission $default_perm"
    else
        ls -l "$file_name"
        echo "Input was 'no': $file_name permissions remain unchanged"
    fi
}

# Apply to each file
update_permission key.txt 600
update_permission secrets.txt 640
update_permission logs.txt 644
