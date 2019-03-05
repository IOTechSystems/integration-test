#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/export-client.postman_collection.json"
ENV_PATH="environment/export-client-docker.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Export-Client Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="registration" --iteration-data="data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/exportClient_registration_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="registration_error_4xx" --iteration-data="data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/exportClient_registration4xx_`date "+%Y%m%d-%H%M%S"`.xml"
    
docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/exportClient_ping_`date "+%Y%m%d-%H%M%S"`.xml"

echo "Info: Export-Client Test Completed."
