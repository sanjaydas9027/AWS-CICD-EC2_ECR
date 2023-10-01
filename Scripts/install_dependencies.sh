#!/bin/bash

sudo apt-get install -y awscli

sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 621916407872.dkr.ecr.us-east-1.amazonaws.com


