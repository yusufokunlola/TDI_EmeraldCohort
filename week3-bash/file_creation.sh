#!/bin/bash

: '
Script Name: file_creation.sh
Description: The script creates a file with a valid extension in the "dataset" folder.
Usage: Run the script in the terminal "./file_creation.sh" and enter a filename with a valid extension (.txt, .csv, .json, .xlsx).
Dependencies: Requires "dataset" directory (created if not exists).
'

# Create "dataset" directory if it does not exist
mkdir -p dataset

# Prompt user for filename with extension
read -p "Enter file name with extension (e.g., file.txt, dataset.csv, validfile.json, exceldata.xlsx): " filename

# Extract file extension
extension="${filename##*.}"

# Define allowed extensions
valid_extensions=("txt" "csv" "json" "xlsx")

# Check if extension is valid
if [[ " ${valid_extensions[*]} " =~ " $extension " ]]; then
    touch "dataset/$filename"
    echo "File '$filename' created successfully in the 'dataset' directory."
else
    echo "File not created. An invalid extension was provided."
    echo "Valid extensions are: .txt, .csv, .xlsx, .json."
fi

