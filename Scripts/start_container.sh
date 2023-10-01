#!/bin/bash

container_name="FlaskApp"

# sudo docker pull 621916407872.dkr.ecr.us-east-1.amazonaws.com/flaskapp:latest
# Check if a container with the same name exists and remove it if it does
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi
sudo docker run -d -p 5000:5000 --name "$container_name" 621916407872.dkr.ecr.us-east-1.amazonaws.com/flaskapp:latest
