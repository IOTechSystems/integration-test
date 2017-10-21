#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $EVENTDATADUMP ]; then

    docker cp $EVENTDATADUMP "$(docker-compose ps -q mongo)":eventDb.json
    docker-compose exec mongo /bin/bash -c "mongoimport -d coredata -c event --file eventDb.json"

else
	echo "Error: Event data dump does not exist."
	exit $?

fi

echo "Info: Event data imported"

if [ -f $READINGDATADUMP ]; then

    docker cp $READINGDATADUMP "$(docker-compose ps -q mongo)":readingDb.json
    docker-compose exec mongo /bin/bash -c "mongoimport -d coredata -c reading --file readingDb.json"

else
	echo "Error: Reading data dump does not exist."
	exit $?

fi

echo "Info: Reading data imported"

if [ -f $VDDATADUMP ]; then

    docker cp $VDDATADUMP "$(docker-compose ps -q mongo)":valueDescriptorData.json
    docker-compose exec mongo /bin/bash -c "mongoimport -d coredata -c valueDescriptor --file valueDescriptorData.json"

else
	echo "Error: value descriptor data dump does not exist."
	exit $?

fi

echo "Info: valueDescriptor data imported"
