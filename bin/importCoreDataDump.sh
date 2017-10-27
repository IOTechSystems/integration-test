#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

DATA_BASE="coredata"
COLLECTIONS=( "event" "reading" "valueDescriptor" )
DUMP_FILES=( $EVENTDATADUMP $READINGDATADUMP $VDDATADUMP)

for index in "${!DUMP_FILES[@]}"
do

    if [ -f ${DUMP_FILES[index]} ]; then
        COPY_FROM="${DUMP_FILES[index]}"
        COPY_TO="${RANDOM}.json"

        MONGO_CONTAINER=$(docker-compose ps -q mongo)
        MONGO_CONTAINER=`echo ${MONGO_CONTAINER} | cut -b 1-12`

        docker cp ${COPY_FROM} "${MONGO_CONTAINER}":${COPY_TO}
        docker-compose exec -T mongo /bin/bash -c "mongoimport -d ${DATA_BASE} -c ${COLLECTIONS[index]} --file ${COPY_TO}"

    else
        echo "Error: ${DUMP_FILES[index]} data dump does not exist."
        exit $?

    fi

    echo "Info: ${DUMP_FILES[index]} data imported"


done