#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/support-logging.postman_collection.json"
ENV_PATH="environment/edgex.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Logging Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="logs" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportLogging_logs_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="logs_error_4xx" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportLogging_logs4xx_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportLogging_ping_`date "+%Y%m%d-%H%M%S"`.xml"

echo "Info:Command Test Completed."
