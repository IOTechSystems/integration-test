#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $ADDRESSABLECCDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c addressable --file $ADDRESSABLECCDATADUMP

else 
	echo "Error: Addressable data dump does not exist."
	exit $?

fi

echo "Info: Addressable data imported"

if [ -f $DEVICECCDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c device --file $DEVICECCDATADUMP

else 
	echo "Error: Device data dump does not exist."
	exit $?

fi

echo "Info: Device data imported"

if [ -f $DEVICEPROFILECCDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceProfile --file $DEVICEPROFILECCDATADUMP

else 
	echo "Error: Device Profile data dump does not exist."
	exit $?

fi

echo "Info: Device Profile data imported"

if [ -f $DEVICESERVICECCDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceService --file $DEVICESERVICECCDATADUMP

else 
	echo "Error: Device Service data dump does not exist."
	exit $?

fi

echo "Info: Device service data imported"

if [ -f $COMMANDCCDATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c command --file $COMMANDCCDATADUMP

else 
	echo "Error: Command data dump does not exist."
	exit $?

fi

echo "Info: Command data imported"

