#!/bin/bash

: '
Script Name: input_user_login.sh
Description: This script validates a user using their login credentials and prompts for their country and city.
Usage: Run the script in the terminal with "./input_user_login.sh" and enter the username, password, country, and city.
'

# Predefined credentials
USERNAME="yaokunlola"
PASSWORD="pwd2025"

# Prompt for user input
read -p "Provide your username: " input_username
read -s -p "Provide your password: " input_password
echo ""

# Validate credentials
if [[ "$input_username" == "$USERNAME" && "$input_password" == "$PASSWORD" ]]; then
    read -p "Provide your country of residence: " country
    read -p "Provide your city/state of residence: " city
    echo "Username: $input_username, lives in $country and $city"
else
    echo "You have no access this time!"
fi

