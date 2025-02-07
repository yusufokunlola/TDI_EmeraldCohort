#! /bin/bash

: '
Script Name: pwd_user_validate.sh
Description: The script validates a user’s login credentials using predefined username and password.
Usage: Run the script on the terminal with "./pwd_user_validate.sh" and enter the username and password upon request.
'

# Predefined credentials
USERNAME="yaokunlola"
PASSWORD="pwd2025"

# Prompt for user input
read -p "Provide your username: " username_input
read -s -p "Provide your password: " password_input
echo ""

# Validate user credentials
if [[ "$username_input" == "$USERNAME" && "$password_input" == "$PASSWORD" ]]; then
    echo "User access granted with username:  $username_input"
else
    echo "Incorrect username or password"
fi
