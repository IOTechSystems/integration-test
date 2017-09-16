#!/bin/bash

DOCKER_NETWORK="${1}"

NAMESFILE=files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Metadata Test."


COLLECTION_PATH="collections/fuse-core-metadata.postman_collection.json"
ENV_PATH="environment/MetadataEnv.postman_environment.json"

#if [ "${WORKSPACE}" != "" ]; then

echo "[info] ---------- jenkins use docker run newman  ----------"
#	echo "[info] WORKSPACE is ${WORKSPACE}"

echo "[info] ======================== Start run test - addressable ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}" --folder="addressable"  \
    --iteration-data="data/addressableData.json" --environment="${ENV_PATH}"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}" --folder="addressable_error_4xx"  \
    --iteration-data="data/addressableData.json" --environment="${ENV_PATH}"

echo "[info] ======================== Start run test - command ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}" --folder="command"  \
    --iteration-data="data/commandData.json" --environment="${ENV_PATH}"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}" --folder="command_error_4xx"  \
    --iteration-data="data/commandData.json" --environment="${ENV_PATH}"

echo "[info] ======================== Start run test - device ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="device" --iteration-data="data/deviceData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="device_error_4xx" --iteration-data="data/deviceData.json"

echo "[info] ======================== Start run test - devicemanager ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="devicemanager" --iteration-data="data/deviceManagerData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="devicemanager_error_4xx" --iteration-data="data/deviceManagerData.json"

echo "[info] ======================== Start run test - deviceprofile ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="deviceprofile" --iteration-data="data/deviceProfileData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="deviceprofile_error_4xx" --iteration-data="data/deviceProfileData.json"

echo "[info] ======================== Start run test - devicereport ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="devicereport" --iteration-data="data/deviceReportData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="devicereport_error_4xx" --iteration-data="data/deviceReportData.json"

echo "[info] ======================== Start run test - deviceservice ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="deviceservice" --iteration-data="data/deviceServiceData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="deviceservice_error_4xx" --iteration-data="data/deviceServiceData.json"

echo "[info] ======================== Start run test - provisionwatcher ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="provisionwatcher" --iteration-data="data/provisionWatcherData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="provisionwatcher_error_4xx" --iteration-data="data/provisionWatcherData.json"

echo "[info] ======================== Start run test - schedule ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="schedule" --iteration-data="data/scheduleData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="schedule_error_4xx" --iteration-data="data/scheduleData.json"

echo "[info] ======================== Start run test - scheduleevent ========================"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="scheduleevent" --iteration-data="data/scheduleEventData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="scheduleevent_error_4xx" --iteration-data="data/scheduleEventData.json"

#fi


##Addressable -200 status Code
#newman run $METADATA_COLLFILE --folder addressable -d $ADDRESSABLE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $ADDRESSABLE_200FILE
## Addressable - 4XX status Code
#newman run $METADATA_COLLFILE --folder addressable_error_4xx -d $ADDRESSABLE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $ADDRESSABLE_4XXFILE
#
## Command - 200 Status COde
#newman run $METADATA_COLLFILE --folder command -d $COMMAND_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $COMMAND_200FILE
## Command - 4XX Status COde
#newman run $METADATA_COLLFILE --folder command_error_4xx -d $COMMAND_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $COMMAND_4XXFILE
#
## Device - 200 Status COde
#newman run $METADATA_COLLFILE --folder device -d $DEVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICE_200FILE
## Device - 4XX Status COde
#newman run $METADATA_COLLFILE --folder device_error_4xx -d $DEVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICE_4XXFILE
#
## DeviceManager - 200 Status COde
#newman run $METADATA_COLLFILE --folder devicemanager -d $DEVICEMANAGER_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEMANAGER_200FILE
## DeviceManager - 4XX Status COde
#newman run $METADATA_COLLFILE --folder devicemanager_error_4xx -d $DEVICEMANAGER_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEMANAGER_4XXFILE
#
## DeviceProfile - 200 Status COde
#newman run $METADATA_COLLFILE --folder deviceprofile -d $DEVICEPROFILE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEPROFILE_200FILE
## DeviceProfile - 4XX Status COde
#newman run $METADATA_COLLFILE --folder deviceprofile_error_4xx -d $DEVICEPROFILE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEPROFILE_4XXFILE

## DeviceReport - 200 Status COde
#newman run $METADATA_COLLFILE --folder devicereport -d $DEVICEREPORT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEREPORT_200FILE
## DeviceReport - 4XX Status COde
#newman run $METADATA_COLLFILE --folder devicereport_error_4xx -d $DEVICEREPORT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICEREPORT_4XXFILE
#
## DeviceService - 200 Status Code
#newman run $METADATA_COLLFILE --folder deviceservice -d $DEVICESERVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICESERVICE_200FILE
## DeviceService - 4XX Status Code
#newman run $METADATA_COLLFILE --folder deviceservice_error_4xx -d $DEVICESERVICE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $DEVICESERVICE_4XXFILE

## ProvisionWatcher - 200 Status Code
#newman run $METADATA_COLLFILE --folder provisionwatcher -d $PROVISION_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $PROVISIONWATCHER_200FILE
## ProvisionWatcher - 4XX Status Code
#newman run $METADATA_COLLFILE --folder provisionwatcher_error_4xx -d $PROVISION_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $PROVISIONWATCHER_4XXFILE
#
## Schedule - 200 Status Code
#newman run $METADATA_COLLFILE --folder schedule -d $SCHEDULE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULE_200FILE
#
## Schedule - 4XX Status Code
#newman run $METADATA_COLLFILE --folder schedule_error_4xx -d $SCHEDULE_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULE_4XXFILE
#
## ScheduleEvent - 200 Status Code
#newman run $METADATA_COLLFILE --folder scheduleevent -d $SCHEDULEEVENT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULEEVENT_200FILE
#
## ScheduleEvent - 4XX Status Code
#newman run $METADATA_COLLFILE --folder scheduleevent_error_4xx -d $SCHEDULEEVENT_DATAFILE -e $METADATA_ENVFILE -r cli,html --reporter-html-export $SCHEDULEEVENT_4XXFILE

echo "Info: Metadata Test completed."

