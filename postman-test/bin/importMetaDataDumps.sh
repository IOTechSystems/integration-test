#!/bin/bash

NAMESFILE=files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi


if [ -f $ADDRESSABLE_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c addressable --file $ADDRESSABLE_DATADUMP

else 
	echo "Error: Addressable data dump does not exist."
	exit $?

fi

echo "Info: Addressable data imported"

if [ -f $DEVICESERVICE_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceService --file $DEVICESERVICE_DATADUMP

else 
	echo "Error: DeviceService data dump does not exist."
	exit $?

fi

echo "Info: DeviceService data imported"

if [ -f $DEVICE_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c device --file $DEVICE_DATADUMP

else 
	echo "Error: Device data dump does not exist."
	exit $?

fi

echo "Info: Device data imported"

if [ -f $COMMAND_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c command --file $COMMAND_DATADUMP

else 
	echo "Error: Command data dump does not exist."
	exit $?

fi

echo "Info: Command data imported"

if [ -f $DEVICEMANAGER_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceManager --file $DEVICEMANAGER_DATADUMP

else 
	echo "Error: DeviceManager data dump does not exist."
	exit $?

fi

echo "Info: DeviceManager data imported"

if [ -f $DEVICEPROFILE_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceProfile --file $DEVICEPROFILE_DATADUMP

else 
	echo "Error: DeviceProfile data dump does not exist."
	exit $?

fi

echo "Info: DeviceProfile data imported"

if [ -f $PROVISION_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c provisionWatcher --file $PROVISION_DATADUMP

else 
	echo "Error: ProvisionWatcher data dump does not exist."
	exit $?

fi

echo "Info: ProvisionWatcher data imported"

if [ -f $DEVICEREPORT_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c deviceReport --file $DEVICEREPORT_DATADUMP

else 
	echo "Error: Devcie Report data dump does not exist."
	exit $?

fi

echo "Info: Device Report data imported"

if [ -f $SCHEDULE_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c schedule --file $SCHEDULE_DATADUMP

else 
	echo "Error: Schedule data dump does not exist."
	exit $?

fi

echo "Info: Schedule data imported"

if [ -f $SCHEDULEEVENT_DATADUMP ]; then 

	mongoimport -h $mongoDbHost -d metadata -c scheduleEvent --file $SCHEDULEEVENT_DATADUMP

else 
	echo "Error: Schedule Event data dump does not exist."
	exit $?

fi

echo "Info: Schedule Event data imported"
