#! /bin/bash

Instance_Id=$(aws ec2 describe-instances \
             --filters 'Name=key-name,Values=usa_key' 'Name=instance-type,Values=t2.micro' \
	     --query 'Reservations[].Instances[].InstanceId[]' --output text)	     

if [[ -z $Instance_Id ]]
then
	echo "No instances found"
	exit 0
fi

aws ec2 terminate-instances --instance-ids $Instance_Id

echo "$Instance_Id is terminating ....."
