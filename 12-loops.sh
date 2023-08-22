#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

#Function name is VALIDATE & this validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1 --> it will receive the argument 1
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE"
        exit 1
    else 
        echo -e "$2...$G SUCCESS"
    fi  
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " ERROR: Please Run this script with root user"
    exit 1
fi

#all arguments are in $@
for i in $@
do
yum install $i -y
done
VALIDATE $? "Package installation" >> $LOGFILE 2>&1

#VALIDATE $? "Package installation" &>>$LOGFILE




