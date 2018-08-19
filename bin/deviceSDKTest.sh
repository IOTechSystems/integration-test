#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/device-sdk.postman_collection.json"
ENV_PATH="environment/edgex.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Device SDK Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} --environment=${ENV_PATH} --reporters="junit,cli"

echo "Info:Device SDK Test Completed."
