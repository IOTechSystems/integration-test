#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $ADDRESSABLE_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c addressable --file $ADDRESSABLE_DATADUMP
    docker cp $ADDRESSABLE_DATADUMP "$(docker-compose ps -q mongo)":$ADDRESSABLE_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $ADDRESSABLE_DATADUMP"

else 
	echo "Error: Addressable data dump does not exist."
	exit $?

fi

echo "Info: Addressable data imported"

if [ -f $DEVICESERVICE_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c deviceService --file $DEVICESERVICE_DATADUMP
    docker cp $DEVICESERVICE_DATADUMP "$(docker-compose ps -q mongo)":$DEVICESERVICE_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICESERVICE_DATADUMP"

else 
	echo "Error: DeviceService data dump does not exist."
	exit $?

fi

echo "Info: DeviceService data imported"

if [ -f $DEVICE_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c device --file $DEVICE_DATADUMP
    docker cp $DEVICE_DATADUMP  "$(docker-compose ps -q mongo)":$DEVICE_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICE_DATADUMP"

else 
	echo "Error: Device data dump does not exist."
	exit $?

fi

echo "Info: Device data imported"

if [ -f $COMMAND_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c command --file $COMMAND_DATADUMP
    docker cp $COMMAND_DATADUMP "$(docker-compose ps -q mongo)":$COMMAND_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $COMMAND_DATADUMP"

else 
	echo "Error: Command data dump does not exist."
	exit $?

fi

echo "Info: Command data imported"

if [ -f $DEVICEPROFILE_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c deviceProfile --file $DEVICEPROFILE_DATADUMP
    docker cp $DEVICEPROFILE_DATADUMP "$(docker-compose ps -q mongo)":$DEVICEPROFILE_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICEPROFILE_DATADUMP"

else 
	echo "Error: DeviceProfile data dump does not exist."
	exit $?

fi

echo "Info: DeviceProfile data imported"

if [ -f $PROVISION_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c provisionWatcher --file $PROVISION_DATADUMP
    docker cp $PROVISION_DATADUMP "$(docker-compose ps -q mongo)":$PROVISION_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $PROVISION_DATADUMP"

else 
	echo "Error: ProvisionWatcher data dump does not exist."
	exit $?

fi

echo "Info: ProvisionWatcher data imported"

if [ -f $DEVICEREPORT_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c deviceReport --file $DEVICEREPORT_DATADUMP
    docker cp $DEVICEREPORT_DATADUMP "$(docker-compose ps -q mongo)":$DEVICEREPORT_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $DEVICEREPORT_DATADUMP"

else 
	echo "Error: Devcie Report data dump does not exist."
	exit $?

fi

echo "Info: Device Report data imported"

if [ -f $SCHEDULE_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c schedule --file $SCHEDULE_DATADUMP
    docker cp $SCHEDULE_DATADUMP "$(docker-compose ps -q mongo)":$SCHEDULE_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $SCHEDULE_DATADUMP"

else 
	echo "Error: Schedule data dump does not exist."
	exit $?

fi

echo "Info: Schedule data imported"

if [ -f $SCHEDULEEVENT_DATADUMP ]; then 

#	mongoimport -h $mongoDbHost -d metadata -c scheduleEvent --file $SCHEDULEEVENT_DATADUMP
    docker cp $SCHEDULEEVENT_DATADUMP "$(docker-compose ps -q mongo)":$SCHEDULEEVENT_DATADUMP
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d coredata -c event --file $SCHEDULEEVENT_DATADUMP"

else 
	echo "Error: Schedule Event data dump does not exist."
	exit $?

fi

echo "Info: Schedule Event data imported"
