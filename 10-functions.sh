#!/bin/bash

#our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#Function name is VALIDATE & this validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1 --> it will receive the argument 1
    if [ $1 -ne 0 ]
    then
        echo "$2... FAILURE"
        exit 1
    else 
        echo "$2... SUCCESS"
    fi  
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " ERROR: Please Run this script with root user"
    exit 1
fi
#it is our responsibility again to check installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MySQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"