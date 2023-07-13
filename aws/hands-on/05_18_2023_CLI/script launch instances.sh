#! /bin/bash

image_id=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --query 'Parameters[0].[Value]' --output text)
aws ec2 run-instances \
--image-id $image_id \
--instance-type t2.micro \
--count 1 \
--key-name usa_key 

sleep 60

Address=$( aws ec2 describe-instances \
	--filters 'Name=key-name,Values=usa_key' \
	--query 'Reservations[].Instances[].{Instance:InstanceId,PuclicIp:PublicIpAddress}')
echo "$Address"
