#!/bin/bash

DOCKER_NETWORK="${1}"

NAMESFILE=files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

COLLECTION_PATH="collections/fuse-core-command.postman_collection.json"
ENV_PATH="environment/command.postman_environment.json"

echo "Info: Initiating Command Test."

#if [ "${WORKSPACE}" != "" ]; then
echo ""
echo ""
echo "[info] ---------- jenkins use docker run newman  ----------"
echo "[info] WORKSPACE is ${WORKSPACE}"

docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="device" --iteration-data="data/coreCommandData.json"
docker run --rm -v postman-test/:/etc/newman --network=${DOCKER_NETWORK} postman/newman_ubuntu1404 \
    run "${COLLECTION_PATH}"  --environment="${ENV_PATH}" \
    --folder="device_error_4xx" --iteration-data="data/coreCommandData.json"
#fi



#newman run $CORECOMMANDCOLLFILE --folder device -d $CORECOMMANDDATAFILE -e $CORECOMMANDENVFILE -r cli,html --reporter-html-export $DEVICECCREPORT200FILE
#
#newman run $CORECOMMANDCOLLFILE --folder device_error_4xx -d $CORECOMMANDDATAFILE -e $CORECOMMANDENVFILE -r cli,html --reporter-html-export $DEVICECCREPORT4XXFILE

echo "Info:Command Test Completed."
