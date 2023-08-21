#!/bin/bash

#our program goal is to install mysql

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo " ERROR: Please Run this script with root user"
    exit 1
fi
#it is our responsibility again to check installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installation of mysql is error"
    exit 1
else   
    echo "Installation of mysql is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
    echo "installation of postfix is error"
    exit 1
else   
    echo " installation of postfix is sucess"
fi
