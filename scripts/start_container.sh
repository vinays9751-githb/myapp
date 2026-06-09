#!/bin/bash

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com

docker pull $ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/hiqode-app:latest

docker run -d \
--name hiqode-app \
-p 5000:5000 \
$ACCOUNT_ID.dkr.ecr.us-east-2.amazonaws.com/hiqode-app:latest
