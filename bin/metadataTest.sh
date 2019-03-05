#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="collections/core-metadata.postman_collection.json"
ENV_PATH="environment/core-metadata-docker.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Metadata Test."

echo "[info] ---------- use docker-compose run newman ----------"

echo "[info] ======================== Start run metaData test - addressable ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="addressable" --iteration-data="data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_addressable_`date "+%Y%m%d-%H%M%S"`.xml"
    
docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="addressable_error_4xx" --iteration-data="data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_addressable4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - command ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="command" --iteration-data="data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_command_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="command_error_4xx" --iteration-data="data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_command4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - device ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="device" --iteration-data="data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_device_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="device_error_4xx" --iteration-data="data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_device4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - deviceprofile ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceprofile" --iteration-data="data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_deviceprofile_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceprofile_error_4xx" --iteration-data="data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_deviceprofile4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - devicereport ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="devicereport" --iteration-data="data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_devicereport_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="devicereport_error_4xx" --iteration-data="data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_devicereport4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - deviceservice ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceservice" --iteration-data="data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_deviceservice_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="deviceservice_error_4xx" --iteration-data="data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_deviceservice4xx_`date "+%Y%m%d-%H%M%S"`.xml"

echo "[info] ======================== Start run metaData test - provisionwatcher ========================"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="provisionwatcher" --iteration-data="data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_provisionwatcher_`date "+%Y%m%d-%H%M%S"`.xml"

docker-compose run --rm postman run ${COLLECTION_PATH} \
    --folder="provisionwatcher_error_4xx" --iteration-data="data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export "newman/coreMetadata_provisionwatcher4xx_`date "+%Y%m%d-%H%M%S"`.xml"


echo "Info: Metadata Test completed."

