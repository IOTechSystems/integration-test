#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


DUMP_FILES=( $EVENTDATADUMP $READINGDATADUMP $VDDATADUMP)

for index in "${!DUMP_FILES[@]}"
do
	echo "${index}.  ${DUMP_FILES[index]}"

    if [ -f ${DUMP_FILES[index]} ]; then
        COPY_FROM="${DUMP_FILES[index]}"
        COPY_TO="${RANDOM}.json"

        echo "${COPY_FROM} ~ $COPY_TO"

        docker cp ${COPY_FROM} "$(docker-compose ps -q mongo)":${COPY_TO}
        docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file ${COPY_TO}"

    else
        echo "Error: ${DUMP_FILES[index]} data dump does not exist."
        exit $?

    fi

    echo "Info: ${DUMP_FILES[index]} data imported"


done

#if [ -f $EVENTDATADUMP ]; then
#
#    docker cp $EVENTDATADUMP "$(docker-compose ps -q mongo)":$EVENTDATADUMP
#    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $EVENTDATADUMP"
#
#else
#	echo "Error: Event data dump does not exist."
#	exit $?
#
#fi
#
#echo "Info: Event data imported"
#
#if [ -f $READINGDATADUMP ]; then
#
#    docker cp $READINGDATADUMP "$(docker-compose ps -q mongo)":$READINGDATADUMP
#    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c reading --file $READINGDATADUMP"
#
#else
#	echo "Error: Reading data dump does not exist."
#	exit $?
#
#fi
#
#echo "Info: Reading data imported"
#
#if [ -f $VDDATADUMP ]; then
#
#    docker cp $VDDATADUMP "$(docker-compose ps -q mongo)":$VDDATADUMP
#    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c valueDescriptor --file $VDDATADUMP"
#
#else
#	echo "Error: value descriptor data dump does not exist."
#	exit $?
#
#fi
#
#echo "Info: valueDescriptor data imported"
