#!/bin/bash

TIMESTAMPFORMAT=`date +%d-%m-%Y_%H%M%S`

CONFIGFILE=config.sh

EVENTDATAFILE=../data/eventData.json
COREDATAENVFILE=../environment/CoredataEnv.postman_environment.json
COREDATACOLLFILE=../collections/fuse-core-data.postman_collection.json
EVENTDATADUMP=../DataDumps/coredata/eventDb.json
READINGDATADUMP=../DataDumps/coredata/readingDb.json
VDDATADUMP=../DataDumps/coredata/valueDescriptorDb.json
READINGDATAFILE=../data/readingData.json
VDDATAFILE=../data/valueDescriptorData.json

METADATA_ENVFILE=../environment/MetadataEnv.postman_environment.json
METADATA_COLLFILE=../collections/fuse-core-metadata.postman_collection.json
ADDRESSABLE_DATAFILE=../data/addressableData.json
ADDRESSABLE_DATADUMP=../DataDumps/metadata/addressableDb.json
DEVICE_DATAFILE=../data/deviceData.json
DEVICE_DATADUMP=../DataDumps/metadata/deviceDb.json
DEVICESERVICE_DATAFILE=../data/deviceServiceData.json
DEVICESERVICE_DATADUMP=../DataDumps/metadata/deviceserviceDb.json
COMMAND_DATAFILE=../data/commandData.json
COMMAND_DATADUMP=../DataDumps/metadata/commandDb.json
DEVICEMANAGER_DATAFILE=../data/deviceManagerData.json
DEVICEMANAGER_DATADUMP=../DataDumps/metadata/deviceManagerDb.json
DEVICEPROFILE_DATAFILE=../data/deviceProfileData.json
DEVICEPROFILE_DATADUMP=../DataDumps/metadata/deviceProfileDb.json
PROVISION_DATAFILE=../data/provisionWatcherData.json
PROVISION_DATADUMP=../DataDumps/metadata/provisioWatcherDb.json
DEVICEREPORT_DATAFILE=../data/deviceReportData.json
DEVICEREPORT_DATADUMP=../DataDumps/metadata/deviceReportDb.json
SCHEDULE_DATAFILE=../data/scheduleData.json
SCHEDULE_DATADUMP=../DataDumps/metadata/scheduleDb.json
SCHEDULEEVENT_DATAFILE=../data/scheduleEventData.json
SCHEDULEEVENT_DATADUMP=../DataDumps/metadata/scheduleEventDb.json

CORECOMMANDENVFILE=../environment/command.postman_environment.json
CORECOMMANDCOLLFILE=../collections/fuse-core-command.postman_collection.json
ADDRESSABLECCDATADUMP=../DataDumps/command/addressableDb.json
DEVICECCDATADUMP=../DataDumps/command/deviceDb.json
DEVICEPROFILECCDATADUMP=../DataDumps/command/deviceProfileDb.json
DEVICESERVICECCDATADUMP=../DataDumps/command/deviceServiceDb.json
COMMANDCCDATADUMP=../DataDumps/command/commandDb.json
CORECOMMANDDATAFILE=../data/coreCommandData.json

if [ -f $CONFIGFILE ]; then 

	source $CONFIGFILE

else 
	echo "Error: Configuration script does not exist."
	exit $?

fi

EVENTREPORT200FILE=$eventReportPath200Status/event$TIMESTAMPFORMAT.html
EVENTREPORT4XXFILE=$eventReportPath4XXStatus/event$TIMESTAMPFORMAT.html
READINGREPORT200FILE=$readingReportPath200Status/reading$TIMESTAMPFORMAT.html
READINGREPORT4XXFILE=$readingReportPath4XXStatus/reading$TIMESTAMPFORMAT.html
VDREPORT200FILE=$vdReportPath200Status/valuedescriptor$TIMESTAMPFORMAT.html
VDREPORT4XXFILE=$vdReportPath4XXStatus/valuedescriptor$TIMESTAMPFORMAT.html

ADDRESSABLE_200FILE=$addressableReportPath200Status/addressable$TIMESTAMPFORMAT.html
ADDRESSABLE_4XXFILE=$addressableReportPath4XXStatus/addressable$TIMESTAMPFORMAT.html
COMMAND_200FILE=$commandReportPath200Status/command$TIMESTAMPFORMAT.html
COMMAND_4XXFILE=$commandReportPath4XXStatus/command$TIMESTAMPFORMAT.html
DEVICE_200FILE=$deviceReportPath200Status/device$TIMESTAMPFORMAT.html
DEVICE_4XXFILE=$deviceReportPath4XXStatus/device$TIMESTAMPFORMAT.html
DEVICEMANAGER_200FILE=$deviceManagerPath200Status/deviceManager$TIMESTAMPFORMAT.html
DEVICEMANAGER_4XXFILE=$deviceManagerPath4XXStatus/deviceManager$TIMESTAMPFORMAT.html
DEVICEPROFILE_200FILE=$deviceProfileReportPath200Status/deviceProfile$TIMESTAMPFORMAT.html
DEVICEPROFILE_4XXFILE=$deviceProfileReportPath4XXStatus/deviceProfile$TIMESTAMPFORMAT.html
DEVICEREPORT_200FILE=$deviceRepReportPath200Status/deviceReport$TIMESTAMPFORMAT.html
DEVICEREPORT_4XXFILE=$deviceRepReportPath4XXStatus/deviceReport$TIMESTAMPFORMAT.html
DEVICESERVICE_200FILE=$deviceServiceReportPath200Status/deviceService$TIMESTAMPFORMAT.html
DEVICESERVICE_4XXFILE=$deviceServiceReportPath4XXStatus/deviceService$TIMESTAMPFORMAT.html
PROVISIONWATCHER_200FILE=$provisionWatcherReportPath200Status/provisionWatcher$TIMESTAMPFORMAT.html
PROVISIONWATCHER_4XXFILE=$provisionWatcherReportPath4XXStatus/provisionWatcher$TIMESTAMPFORMAT.html
SCHEDULE_200FILE=$scheduleReportPath200Status/schedule$TIMESTAMPFORMAT.html
SCHEDULE_4XXFILE=$scheduleReportPath4XXStatus/schedule$TIMESTAMPFORMAT.html
SCHEDULEEVENT_200FILE=$scheduleEventReportPath200Status/scheduleEvent$TIMESTAMPFORMAT.html
SCHEDULEEVENT_4XXFILE=$scheduleEventReportPath4XXStatus/scheduleEvent$TIMESTAMPFORMAT.html

DEVICECCREPORT200FILE=$deviceCcReportPath200Status/device$TIMESTAMPFORMAT.html
DEVICECCREPORT4XXFILE=$deviceCcReportPath4XXStatus/device$TIMESTAMPFORMAT.html

