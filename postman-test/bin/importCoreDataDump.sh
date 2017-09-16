#!/bin/bash

NAMESFILE=files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $EVENTDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d coredata -c event --file $EVENTDATADUMP

else 
	echo "Error: Event data dump does not exist."
	exit $?

fi

echo "Info: Event data imported"

if [ -f $READINGDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d coredata -c reading --file $READINGDATADUMP

else 
	echo "Error: Reading data dump does not exist."
	exit $?

fi

echo "Info: Reading data imported"

if [ -f $VDDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d coredata -c valueDescriptor --file $VDDATADUMP

else 
	echo "Error: value descriptor data dump does not exist."
	exit $?

fi

echo "Info: valueDescriptor data imported"
