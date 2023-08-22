#!/bin/bash

#colors
#validations
#log redirections

LOGFILE_DIRECTORY=/temp
DATE=(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please Run this script with root access $N"
    exit 1
fi