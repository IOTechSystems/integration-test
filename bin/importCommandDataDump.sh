#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $ADDRESSABLECCDATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c addressable --file $ADDRESSABLECCDATADUMP
    docker cp $ADDRESSABLECCDATADUMP "$(docker-compose ps -q mongo)":$ADDRESSABLECCDATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $ADDRESSABLECCDATADUMP"


else 
	echo "Error: Addressable data dump does not exist."
	exit $?

fi

echo "Info: Addressable data imported"

if [ -f $DEVICECCDATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c device --file $DEVICECCDATADUMP
    docker cp $DEVICECCDATADUMP "$(docker-compose ps -q mongo)":$DEVICECCDATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICECCDATADUMP"

else 
	echo "Error: Device data dump does not exist."
	exit $?

fi

echo "Info: Device data imported"

if [ -f $DEVICEPROFILECCDATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c deviceProfile --file $DEVICEPROFILECCDATADUMP
    docker cp $DEVICEPROFILECCDATADUMP "$(docker-compose ps -q mongo)":$DEVICEPROFILECCDATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICEPROFILECCDATADUMP"

else 
	echo "Error: Device Profile data dump does not exist."
	exit $?

fi

echo "Info: Device Profile data imported"

if [ -f $DEVICESERVICECCDATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c deviceService --file $DEVICESERVICECCDATADUMP
    docker cp $DEVICESERVICECCDATADUMP "$(docker-compose ps -q mongo)":$DEVICESERVICECCDATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICESERVICECCDATADUMP"

else 
	echo "Error: Device Service data dump does not exist."
	exit $?

fi

echo "Info: Device service data imported"

if [ -f $COMMANDCCDATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c command --file $COMMANDCCDATADUMP
    docker cp $COMMANDCCDATADUMP "$(docker-compose ps -q mongo)":$COMMANDCCDATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $COMMANDCCDATADUMP"

else 
	echo "Error: Command data dump does not exist."
	exit $?

fi

echo "Info: Command data imported"

