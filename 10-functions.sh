#!/bin/bash

#our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#Function name is VALIDATE & this validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1 --> it will receive the argument 1
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else 
        echo -e "$2...$G SUCCESS $N"
    fi  
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$Y ERROR: Please Run this script with root user $N"
    exit 1
fi
#it is our responsibility again to check installation is success or not
yum install git -y &>>$LOGFILE

VALIDATE $? "Installing Git"

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MySQL"

#yum install postfix -y &>>$LOGFILE

#VALIDATE $? "Installing postfix"