#!/bin/bash

# Güvenlik grubu oluşturma komutu
security_group_id=$(aws ec2 create-security-group \
    --group-name my-security-group-by-CLI \
    --description "My security group" \
    --region us-east-1 \
    --output text)

# Güvenlik grubuna gerekli kuralları ekleme komutları
aws ec2 authorize-security-group-ingress \
    --group-id $security_group_id \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
    --group-id $security_group_id \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# EC2 örneğini başlatma komutu ve en son güncel image-id komutu 
aws ec2 run-instances \
    --region us-east-1 \
    --image-id $(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --query \
               'Parameters[0].[Value]' --output text) \
    --instance-type t2.micro \
    --key-name end-key-pair \
    --security-group-ids $security_group_id