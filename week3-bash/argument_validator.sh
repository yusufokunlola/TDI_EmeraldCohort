#!/bin/bash

# Script Name: argument_validator.sh
# Description: This script accepts 1-6 arguments, validates them as alphabetic strings, and creates a file named using the provided arguments.
# Usage: ./argument_validator.sh arg1 arg2 arg3 ... arg6
# Dependencies: None

# Function to validate arguments
validate_args() {
    for arg in "$@"; do
        if [[ ! "$arg" =~ ^[A-Za-z]+$ ]]; then
            echo "The input is invalid: '$arg'. You must enter characters only."
            return 1
        fi
    done
    return 0
}

# Main function
process_arguments() {
    echo "Script Name: $0"
    echo "Number of arguments: $#"

    # Validate the number of arguments
    if (( $# < 1 || $# > 6 )); then
        echo "Error: Please provide between 1 and 6 arguments."
        return 1
    fi

    # Display each argument
    echo "Arguments provided:"
    for arg in "$@"; do
        echo "- $arg"
    done

    # Validate arguments for alphabetic characters only
    validate_args "$@" || return 1

    # Create the file
    filename=$(IFS=_; echo "$*.txt")
    touch "$filename"
    echo "The file '$filename' has been successfully created in the working directory."
}

# Loop to request valid arguments if conditions aren't met
while true; do
    process_arguments "$@"
    if [[ $? -eq 0 ]]; then
        break
    fi
    read -p "Please enter valid arguments (1-6 alphabetic strings separated by spaces): " -a args
    set -- "${args[@]}"
done
