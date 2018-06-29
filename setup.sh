#!/bin/bash

echo "Creating data dirs"
mkdir -p $JIBJIB_MONGO_IMPORT_PATH
mkdir -p $JIBJIB_MONGO_CONFIG_PATH
mkdir -p $JIBJIB_MONGO_INITDB_PATH
mkdir -p $JIBJIB_MODEL_PATH
mkdir -p ${JIBJIB_APP_INPUT_PATH}/pickle

echo "Creating docker volume"
docker volume create $JIBJIB_MONGO_DATABASE_VOLUME

echo "Fetch model"
curl https://s3-eu-west-1.amazonaws.com/jibjib/model/jibjib_model_serving.tgz | \
	tar -xvz -C $JIBJIB_MODEL_PATH

echo "Fetch pickles"
curl https://s3-eu-west-1.amazonaws.com/jibjib/pickle/mapping_pickles.tgz | \
	tar -xvz -C ${JIBJIB_APP_INPUT_PATH}/pickle

echo "Fetch birds"
curl https://raw.githubusercontent.com/gojibjib/voice-grabber/master/meta/birds.json \
	-o ${JIBJIB_MONGO_IMPORT_PATH}/birds.json

echo "Fetch DB config and initdb scripts"
curl https://raw.githubusercontent.com/gojibjib/jibjib-api/master/db/conf/mongod.conf \
	-o ${JIBJIB_MONGO_CONFIG_PATH}/mongod.conf
curl https://raw.githubusercontent.com/gojibjib/jibjib-api/master/db/initdb/init_db.js \
	-o ${JIBJIB_MONGO_INITDB_PATH}/init_db.js
curl https://raw.githubusercontent.com/gojibjib/jibjib-api/master/db/initdb/setup.sh \
	-o ${JIBJIB_MONGO_INITDB_PATH}/setup.sh

