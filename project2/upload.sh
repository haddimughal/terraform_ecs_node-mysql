#!/bin/bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 014620044081.dkr.ecr.us-west-2.amazonaws.com
docker build -t ecs-terraform/runner .
docker tag ecs-terraform/runner:latest 014620044081.dkr.ecr.us-west-2.amazonaws.com/ecs-terraform/runner:latest
docker push 014620044081.dkr.ecr.us-west-2.amazonaws.com/ecs-terraform/runner:latest
