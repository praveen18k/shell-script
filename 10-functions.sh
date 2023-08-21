#!/bin/bash

#our program goal is to install mysql

USERID=$(id -u)
#Function name is VALIDATE & this validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1 --> it will receive the argument 1
    if [ $1 -ne 0 ]
    then
        echo "Installation ... FAILURE"
        exit 1
    else 
        echo "Installation ... SUCCESS"
    fi  
}
if [ $USERID -ne 0 ]
then
    echo " ERROR: Please Run this script with root user"
    exit 1
fi
#it is our responsibility again to check installation is success or not
yum install mysql -y

VALIDATE $?

yum install postfix -y

VALIDATE $?