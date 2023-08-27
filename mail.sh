#!/bin/bash

#anyone in your project can call this script with arguments
#we need to call the below script : mail.sh TO_ADDRESS SUBJECT BODY TEAM_NAME ALERT_TYPE

To_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all args: $@"

#to write or Edit "BODY" use 'sed' editor (streamline editor)

FINAL_BODY=$(sed -e 's/TEAM_NAME/DevOps Team/g' -e 's/ALERT_TYPE/High Disck Usage/g' -es/MESSAGE/$BODY" template.html)

echo "$FINAL_BODY" | mail -s "$SUBJECT" $TO_ADDRESS