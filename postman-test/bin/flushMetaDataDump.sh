#!/bin/bash

NAMESFILE=files.sh
ADDRESSABLE_JS=javascript/metadata/addressable.js
DEVICE_JS=javascript/metadata/device.js
COMMAND_JS=javascript/metadata/command.js
DEVICEMANAGER_JS=javascript/metadata/deviceManager.js
DEVICPROFILE_JS=javascript/metadata/deviceProfile.js
DEVICEREPORT_JS=javascript/metadata/deviceReport.js
DEVICESERVICE_JS=javascript/metadata/deviceService.js
PROVISIONWATCHER_JS=javascript/metadata/provisionWatcher.js
SCHEDULE_JS=javascript/metadata/schedule.js
SCHEDULEEVENT_JS=javascript/metadata/scheduleEvent.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

if [ -f $ADDRESSABLE_JS ]; then 

	mongo $mongoDbHost/metadata $ADDRESSABLE_JS
	echo "Info: Addressable data flushed"

else
	echo "Error: Mongo JS event file does not exist."

fi

if [ -f $DEVICE_JS ]; then 

	mongo $mongoDbHost/metadata $DEVICE_JS
	echo "Info: Device data flushed"

else
	echo "Error: Mongo JS Device file does not exist."

fi

if [ -f $DEVICEREPORT_JS ]; then 

	mongo $mongoDbHost/metadata $DEVICEREPORT_JS
	echo "Info: DeviceReport data flushed"

else
	echo "Error: Mongo JS Command file does not exist."

fi

if [ -f $DEVICEMANAGER_JS ]; then 

	mongo $mongoDbHost/metadata $DEVICEMANAGER_JS
	echo "Info: DevcieManager data flushed"

else
	echo "Error: Mongo JS Command file does not exist."

fi

if [ -f $DEVICPROFILE_JS ]; then 

	mongo $mongoDbHost/metadata $DEVICPROFILE_JS
	echo "Info: DeviceProfile data flushed"

else
	echo "Error: Mongo JS Command file does not exist."

fi 

if [ -f $DEVICESERVICE_JS ]; then 

	mongo $mongoDbHost/metadata $DEVICESERVICE_JS
	echo "Info: DeviceService data flushed"

else
	echo "Error: Mongo JS DeviceService file does not exist."

fi

if [ -f $PROVISIONWATCHER_JS ]; then 

	mongo $mongoDbHost/metadata $PROVISIONWATCHER_JS
	echo "Info: ProvisionWatcher data flushed"

else
	echo "Error: Mongo JS ProvisionWatcher file does not exist."

fi

if [ -f $SCHEDULE_JS ]; then 

	mongo $mongoDbHost/metadata $SCHEDULE_JS
	echo "Info: Schedule data flushed"

else
	echo "Error: Mongo JS Schedule file does not exist."

fi

if [ -f $SCHEDULEEVENT_JS ]; then 

	mongo $mongoDbHost/metadata $SCHEDULEEVENT_JS
	echo "Info: ScheduleEvent data flushed"

else
	echo "Error: Mongo JS ScheduleEvent file does not exist."

fi

if [ -f $COMMAND_JS ]; then 

	mongo $mongoDbHost/metadata $COMMAND_JS
	echo "Info: Command data flushed"

else
	echo "Error: Mongo JS Comnmand file does not exist."

fi

