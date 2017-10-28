#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="metadata"
COLLECTIONS=( "addressable" "device" "deviceProfile" "deviceService" "command" )
DUMP_FILES=( $ADDRESSABLECCDATADUMP $DEVICECCDATADUMP $DEVICEPROFILECCDATADUMP $DEVICESERVICECCDATADUMP $COMMANDCCDATADUMP )

for index in "${!DUMP_FILES[@]}"
do

    if [ -f ${DUMP_FILES[index]} ]; then

        docker-compose exec -T mongo /bin/bash -c "mongoimport -d ${DATA_BASE} -c ${COLLECTIONS[index]} --file ${DUMP_FILES[index]}"

    else
        echo "Error: ${DUMP_FILES[index]} data dump does not exist."
        exit $?

    fi

    echo "Info: ${DUMP_FILES[index]} data imported"


done