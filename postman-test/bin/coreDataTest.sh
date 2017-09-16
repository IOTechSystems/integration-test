#!/bin/bash

DOCKER_NETWORK="${1}"

NAMESFILE=files.sh

POSTMAN_PATH="~/Documents/workspace/git/edgeX/integration-test/postman-test";
COLLECTION_PATH="collections/fuse-core-data.postman_collection.json"
ENV_PATH="environment/CoredataEnv.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Coredata Test."

echo "[info] ---------- use docker run newman  ----------"

docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="event" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${EVENTREPORT200FILE}"
docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="event_error_4xx" --iteration-data="data/eventData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${EVENTREPORT4XXFILE}"

docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="reading" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${READINGREPORT200FILE}"
docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="reading_error_4xx" --iteration-data="data/readingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${READINGREPORT4XXFILE}"

docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="valuedescriptor" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${VDREPORT200FILE}"
docker run --rm -v ~/Documents/workspace/git/edgeX/integration-test/postman-test:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 run ${COLLECTION_PATH} \
    --folder="valuedescriptor_error_4xx" --iteration-data="data/valueDescriptorData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli" --reporter-junit-export="${VDREPORT4XXFILE}"





#    WORKSPACE=/Users/bruce/Documents/eclipse-workspace/deploy-edgeX/
#
#	echo "[info] not jenkins build"

#newman run $COREDATACOLLFILE --folder event -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder reading -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder event_error_4xx -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder reading_error_4xx -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor_error_4xx -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT4XXFILE

echo "Info:Coredata Test Completed."
