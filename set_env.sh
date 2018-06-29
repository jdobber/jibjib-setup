#!/bin/bash

DATA_HOME="$(pwd)/data"

export JIBJIB_MONGO_IMPORT_PATH="${DATA_HOME}/mongo/import"
export JIBJIB_MONGO_CONFIG_PATH="${DATA_HOME}/mongo/conf"
export JIBJIB_MONGO_INITDB_PATH="${DATA_HOME}/mongo/initdb"
export JIBJIB_MODEL_PATH="${DATA_HOME}/model"
export JIBJIB_APP_INPUT_PATH="${DATA_HOME}/app/input"
export JIBJIB_MONGO_DATABASE_VOLUME="jibjib-mongo-db"
