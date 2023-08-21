#!/bin/bash

#this is called assay, insted of single value it can hold multiple values
PERSONS=("Praveen" "Shekar" "Naveen")
#inside array we always refer values with index and it starts from 0

echo "First Person:${PERSONS[0]}"
echo "Second Person: ${PERSONS[1]}"