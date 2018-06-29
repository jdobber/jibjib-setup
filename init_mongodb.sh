#!/bin/bash

echo "Init MongoDB in container $CONTAINER_ID "
docker exec $CONTAINER_ID bash /initdb/setup.sh