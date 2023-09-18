#!/bin/bash
#change below VARS values

NAMES=$@
INSTANCE_TYPE="t2.micro"
IMAGE_ID=ami-03265a0778a880afb
SECURITY_GROUP_ID=sg-08d18df927e2af951
DOMAIN_NAME=awsdevops.site
HOSTED_ZONE_ID=

for i in $@
do
    # if [[ $i == "mongodb" || $i == "mysql" ]]
    # then
    #     INSTANCE_TYPE="t3.medium"
    # else    
    #     INSTANCE_TYPE="t2.micro"
    # fi
    echo "create $i instance"
    IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance_type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
    echo "created $i instance: $IP_ADDRESS"
    aws route53 chnage-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch '
    {
             "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                            "Name": "'$i.$DOMAIN_NAME'",
                            "Type": "A",
                            "TTL": 300,
                            "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
                        }}]
    }
    '
done
   

    