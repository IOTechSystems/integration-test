#!/bin/bash

NAMESFILE=files.sh
ADDRESSABLE_JS=javascript/metadata/addressable.js
DEVICE_JS=javascript/metadata/device.js
COMMAND_JS=javascript/metadata/command.js
DEVICEMANAGER_JS=javascript/metadata/deviceManager.js
DEVICPROFILE_JS=javascript/metadata/deviceProfile.js
DEVICEREPORT_JS=javascript/metadata/deviceReport.js
DEVICESERVICE_JS=javascript/metadata/deviceService.js
PROVISIONWATCHER_JS=javascript/metadata/provisionWatcher.js
SCHEDULE_JS=javascript/metadata/schedule.js
SCHEDULEEVENT_JS=javascript/metadata/scheduleEvent.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="metadata"
FLUSH_SCRIPTS=( $ADDRESSABLE_JS $DEVICE_JS $DEVICEREPORT_JS $DEVICPROFILE_JS $DEVICESERVICE_JS $PROVISIONWATCHER_JS $SCHEDULE_JS $SCHEDULEEVENT_JS $COMMAND_JS )

for index in "${!FLUSH_SCRIPTS[@]}"
do
    if [ -f ${FLUSH_SCRIPTS[index]} ]; then
        COPY_FROM="${FLUSH_SCRIPTS[index]}"
        COPY_TO="${RANDOM}.json"

        docker cp ${COPY_FROM} "$(docker-compose ps -q mongo)":${COPY_TO}
        docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${COPY_TO}"

        echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

    else
        echo "Error: Mongo JS ${FLUSH_SCRIPTS[index]} file does not exist."

    fi


done
