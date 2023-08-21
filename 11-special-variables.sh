#!/bin/bash

VAR1=$1
VAR2=$2

echo "Script name:$0"
echo "Variables 1:$VAR1"
echo "All variables:$@"
echo "How many variables:$#"
echo "First argument: $1"
echo "Exit status of last command: $?"
echo "Process ID of script: $$"
echo "Home directory: $HOME"
echo "Username: $USER"
echo "Hostname: $HOSTNAME"
echo "Current line number: $LINENO"
echo "Random number: $RANDOM"
echo "Default shell: $SHELL"
