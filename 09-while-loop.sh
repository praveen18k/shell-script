#!/bin/bash

# Initialize an empty array
my_array=()

# Prompt the user for input and add values to the array
while true; do
    read -p "Enter a value (or 'exit' to finish): " input
    if [ "$input" = "exit" ]; then
        break
    else
        my_array+=("$input")
    fi
done

# Display the contents of the array
echo "Array contents:"
for value in "${my_array[@]}"; do
    echo "$value"
done
