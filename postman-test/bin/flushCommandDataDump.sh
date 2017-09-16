#!/bin/bash

NAMESFILE=files.sh
ADDRESSABLE_JS=javascript/command/addressable.js
DEVICE_JS=javascript/command/device.js
COMMAND_JS=javascript/command/command.js
DEVICPROFILE_JS=javascript/command/deviceProfile.js
DEVICESERVICE_JS=javascript/command/deviceService.js

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


if [ -f $COMMAND_JS ]; then 

	mongo $mongoDbHost/metadata $COMMAND_JS
	echo "Info: Command data flushed"

else
	echo "Error: Mongo JS Comnmand file does not exist."

fi

