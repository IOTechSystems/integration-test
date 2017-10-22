#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DUMP_FILES=( $ADDRESSABLE_DATADUMP $DEVICESERVICE_DATADUMP $DEVICE_DATADUMP $COMMAND_DATADUMP $DEVICEPROFILE_DATADUMP $PROVISION_DATADUMP $DEVICEREPORT_DATADUMP $SCHEDULE_DATADUMP $SCHEDULEEVENT_DATADUMP )

for index in "${!DUMP_FILES[@]}"
do

    if [ -f ${DUMP_FILES[index]} ]; then
        COPY_FROM="${DUMP_FILES[index]}"
        COPY_TO="${RANDOM}.json"

        docker cp ${COPY_FROM} "$(docker-compose ps -q mongo)":${COPY_TO}
        docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file ${COPY_TO}"

    else
        echo "Error: ${DUMP_FILES[index]} data dump does not exist."
        exit $?

    fi

    echo "Info: ${DUMP_FILES[index]} data imported"


done