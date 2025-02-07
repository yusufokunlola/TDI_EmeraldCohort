#!/bin/bash


# Script Name: student_progress.sh
# Description: This script prompts users to enter a student’s name and marks, determines their progress status, and appends the information to "student_marks.txt".
# Usage: Run the script and enter the student name and marks when prompted.
# Dependencies: Requires "student_marks.txt" to exist in the same directory before execution.


# Ensure the file exists
touch student_marks.txt

# Function to validate marks input
validate_marks() {
    local marks="$1"
    if [[ ! "$marks" =~ ^[0-9]+$ ]] || (( marks < 0 || marks > 100 )); then
        echo "Invalid marks! Please enter a value between 0 and 100."
        return 1
    fi
    return 0
}

# Prompt for student details
read -p "Enter student name: " student_name

while true; do
    read -p "Enter marks (0-100): " marks
    validate_marks "$marks" && break
done

# Determine status
if (( marks > 75 )); then
    status="Pass with Distinction"
elif (( marks >= 50 )); then
    status="Pass"
else
    status="Fail"
fi

# Append data to student_marks.txt
echo "Student Name: $student_name, Marks: $marks, Status: $status" >> student_marks.txt

# Confirmation message
echo "Student $student_name with marks $marks and status $status has been added to student_marks.txt."

