#!/bin/bash

# Define the name of the Docker container
CONTAINER_NAME="FlaskApp"

# Check if a container with the same name exists and remove it if it does
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi