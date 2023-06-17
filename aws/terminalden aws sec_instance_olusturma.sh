#!/bin/bash

# Güvenlik grubu oluşturma komutu
security_group_id=$(aws ec2 create-security-group \
    --group-name my-security-group \
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

# EC2 örneğini başlatma komutu
aws ec2 run-instances \
    --region us-east-1 \
    --image-id ami-04a0ae173da5807d3 \
    --instance-type t2.micro \
    --key-name end-key-pair \
    --security-group-ids $security_group_id