#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/support-rulesengine.postman_collection.json"
ENV_PATH="environment/edgex.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Rulesengine Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="rules" --iteration-data="data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportRulesengine_rules_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="rules_error_5xx" --iteration-data="data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportRulesengine_rules5xx_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/supportRulesengine_ping_`date "+%Y%m%d-%H%M%S"`.xml"

echo "Info: Rulesengine Test Completed."
