#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh
EVENTDUMPJS=$(dirname "$0")/javascript/coredata/event.js
READINGDUMPJS=$(dirname "$0")/javascript/coredata/reading.js
VDDUMPJS=$(dirname "$0")/javascript/coredata/valueDescriptor.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi



FLUSH_SCRIPTS=( $EVENTDUMPJS $READINGDUMPJS $VDDUMPJS)

for index in "${!FLUSH_SCRIPTS[@]}"
do
	echo "${index}.  ${FLUSH_SCRIPTS[index]}"

    if [ -f $VDDUMPJS ]; then

    #	mongo $mongoDbHost/coredata $VDDUMPJS
        docker cp ${FLUSH_SCRIPTS[index]} "$(docker-compose ps -q mongo)":${FLUSH_SCRIPTS[index]}
        docker-compose exec -T mongo /bin/bash -c "mongo coredata ${FLUSH_SCRIPTS[index]}"

        echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

    else
        echo "Error: Mongo JS ${FLUSH_SCRIPTS[index]} file does not exist."

    fi


done




#
#if [ -f $EVENTDUMPJS ]; then
#
##	mongo $mongoDbHost/coredata $EVENTDUMPJS
#    docker cp $EVENTDUMPJS "$(docker-compose ps -q mongo)":$EVENTDUMPJS
#	docker-compose exec -T mongo /bin/bash -c "mongo coredata $EVENTDUMPJS"
#
#	echo "Info: Event data flushed"
#
#else
#	echo "Error: Mongo JS event file does not exist."
#
#fi
#
#if [ -f $READINGDUMPJS ]; then
#
##	mongo $mongoDbHost/coredata $READINGDUMPJS
#    docker cp $READINGDUMPJS "$(docker-compose ps -q mongo)":$READINGDUMPJS
#	docker-compose exec -T mongo /bin/bash -c "mongo coredata $READINGDUMPJS"
#
#	echo "Info: Reading data flushed"
#
#else
#	echo "Error: Mongo JS Reading file does not exist."
#
#fi
#
#if [ -f $VDDUMPJS ]; then
#
##	mongo $mongoDbHost/coredata $VDDUMPJS
#    docker cp $VDDUMPJS "$(docker-compose ps -q mongo)":$VDDUMPJS
#	docker-compose exec -T mongo /bin/bash -c "mongo coredata $VDDUMPJS"
#
#	echo "Info: Value Descriptor data flushed"
#
#else
#	echo "Error: Mongo JS Value Descriptor file does not exist."
#
#fi
