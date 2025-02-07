#!/bin/bash

: '
Script Name: math_operation.sh
Description: This script performs basic math operations (addition, subtraction, multiplication, division).
Usage: Run the script in the terminal with "./math_operation.sh"  and enter two numbers, followed by an operation choice.
'

# Prompt user for numbers
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Ensure input is numeric
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input! Please enter valid numbers."
    exit 1
fi

# Present math operation choices
echo "Select a math operation:"
echo "1) Add"
echo "2) Subtract"
echo "3) Multiply"
echo "4) Divide"
read -p "Enter choice (1-4): " choice

# Perform operation
case $choice in
    1) result=$(echo "$num1 + $num2" | bc); echo "Sum is $result" ;;
    2) result=$(echo "$num1 - $num2" | bc); echo "Difference is $result" ;;
    3) result=$(echo "$num1 * $num2" | bc); echo "Product is $result" ;;
    4) if [[ "$num2" == "0" ]]; then
           echo "Only non-zero numbers are allowed for division."
       else
           result=$(echo "scale=2; $num1 / $num2" | bc); echo "Division is $result"
       fi ;;
    *) echo "Invalid option!" ;;
esac

