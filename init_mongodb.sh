#!/bin/bash

CONTAINER_ID=$(docker ps --filter "name=jibjib-mongo" --format="{{.ID}}")
echo "Init MongoDB in container $CONTAINER_ID "
docker exec $CONTAINER_ID bash /initdb/setup.sh
