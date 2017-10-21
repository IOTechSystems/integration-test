#!/bin/bash

TIMESTAMPFORMAT=`date +%d-%m-%Y_%H%M%S`

CONFIGFILE=$(dirname "$0")/config.sh

EVENTDATAFILE=$(dirname "$0")/postman-test/data/eventData.json
COREDATAENVFILE=$(dirname "$0")/postman-test/environment/CoredataEnv.postman_environment.json
COREDATACOLLFILE=$(dirname "$0")/postman-test/collections/fuse-core-data.postman_collection.json
EVENTDATADUMP=$(dirname "$0")/postman-test/DataDumps/coredata/eventDb.json
READINGDATADUMP=$(dirname "$0")/postman-test/DataDumps/coredata/readingDb.json
VDDATADUMP=$(dirname "$0")/postman-test/DataDumps/coredata/valueDescriptorDb.json
READINGDATAFILE=$(dirname "$0")/postman-test/data/readingData.json
VDDATAFILE=$(dirname "$0")/postman-test/data/valueDescriptorData.json

METADATA_ENVFILE=$(dirname "$0")/postman-test/environment/MetadataEnv.postman_environment.json
METADATA_COLLFILE=$(dirname "$0")/postman-test/collections/fuse-core-metadata.postman_collection.json
ADDRESSABLE_DATAFILE=$(dirname "$0")/postman-test/data/addressableData.json
ADDRESSABLE_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/addressableDb.json
DEVICE_DATAFILE=$(dirname "$0")/postman-test/data/deviceData.json
DEVICE_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/deviceDb.json
DEVICESERVICE_DATAFILE=$(dirname "$0")/postman-test/data/deviceServiceData.json
DEVICESERVICE_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/deviceserviceDb.json
COMMAND_DATAFILE=$(dirname "$0")/postman-test/data/commandData.json
COMMAND_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/commandDb.json
DEVICEMANAGER_DATAFILE=$(dirname "$0")/postman-test/data/deviceManagerData.json
DEVICEMANAGER_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/deviceManagerDb.json
DEVICEPROFILE_DATAFILE=$(dirname "$0")/postman-test/data/deviceProfileData.json
DEVICEPROFILE_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/deviceProfileDb.json
PROVISION_DATAFILE=$(dirname "$0")/postman-test/data/provisionWatcherData.json
PROVISION_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/provisioWatcherDb.json
DEVICEREPORT_DATAFILE=$(dirname "$0")/postman-test/data/deviceReportData.json
DEVICEREPORT_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/deviceReportDb.json
SCHEDULE_DATAFILE=$(dirname "$0")/postman-test/data/scheduleData.json
SCHEDULE_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/scheduleDb.json
SCHEDULEEVENT_DATAFILE=$(dirname "$0")/postman-test/data/scheduleEventData.json
SCHEDULEEVENT_DATADUMP=$(dirname "$0")/postman-test/DataDumps/metadata/scheduleEventDb.json

CORECOMMANDENVFILE=$(dirname "$0")/postman-test/environment/command.postman_environment.json
CORECOMMANDCOLLFILE=$(dirname "$0")/postman-test/collections/fuse-core-command.postman_collection.json
ADDRESSABLECCDATADUMP=$(dirname "$0")/postman-test/DataDumps/command/addressableDb.json
DEVICECCDATADUMP=$(dirname "$0")/postman-test/DataDumps/command/deviceDb.json
DEVICEPROFILECCDATADUMP=$(dirname "$0")/postman-test/DataDumps/command/deviceProfileDb.json
DEVICESERVICECCDATADUMP=$(dirname "$0")/postman-test/DataDumps/command/deviceServiceDb.json
COMMANDCCDATADUMP=$(dirname "$0")/postman-test/DataDumps/command/commandDb.json
CORECOMMANDDATAFILE=$(dirname "$0")/postman-test/data/coreCommandData.json

if [ -f $CONFIGFILE ]; then 

	source $CONFIGFILE

else 
	echo "Error: Configuration script does not exist."
	exit $?

fi

#EVENTREPORT200FILE=$eventReportPath200Status/event$TIMESTAMPFORMAT.html
#EVENTREPORT4XXFILE=$eventReportPath4XXStatus/event$TIMESTAMPFORMAT.html
#READINGREPORT200FILE=$readingReportPath200Status/reading$TIMESTAMPFORMAT.html
#READINGREPORT4XXFILE=$readingReportPath4XXStatus/reading$TIMESTAMPFORMAT.html
#VDREPORT200FILE=$vdReportPath200Status/valuedescriptor$TIMESTAMPFORMAT.html
#VDREPORT4XXFILE=$vdReportPath4XXStatus/valuedescriptor$TIMESTAMPFORMAT.html
#
#ADDRESSABLE_200FILE=$addressableReportPath200Status/addressable$TIMESTAMPFORMAT.html
#ADDRESSABLE_4XXFILE=$addressableReportPath4XXStatus/addressable$TIMESTAMPFORMAT.html
#COMMAND_200FILE=$commandReportPath200Status/command$TIMESTAMPFORMAT.html
#COMMAND_4XXFILE=$commandReportPath4XXStatus/command$TIMESTAMPFORMAT.html
#DEVICE_200FILE=$deviceReportPath200Status/device$TIMESTAMPFORMAT.html
#DEVICE_4XXFILE=$deviceReportPath4XXStatus/device$TIMESTAMPFORMAT.html
#DEVICEMANAGER_200FILE=$deviceManagerPath200Status/deviceManager$TIMESTAMPFORMAT.html
#DEVICEMANAGER_4XXFILE=$deviceManagerPath4XXStatus/deviceManager$TIMESTAMPFORMAT.html
#DEVICEPROFILE_200FILE=$deviceProfileReportPath200Status/deviceProfile$TIMESTAMPFORMAT.html
#DEVICEPROFILE_4XXFILE=$deviceProfileReportPath4XXStatus/deviceProfile$TIMESTAMPFORMAT.html
#DEVICEREPORT_200FILE=$deviceRepReportPath200Status/deviceReport$TIMESTAMPFORMAT.html
#DEVICEREPORT_4XXFILE=$deviceRepReportPath4XXStatus/deviceReport$TIMESTAMPFORMAT.html
#DEVICESERVICE_200FILE=$deviceServiceReportPath200Status/deviceService$TIMESTAMPFORMAT.html
#DEVICESERVICE_4XXFILE=$deviceServiceReportPath4XXStatus/deviceService$TIMESTAMPFORMAT.html
#PROVISIONWATCHER_200FILE=$provisionWatcherReportPath200Status/provisionWatcher$TIMESTAMPFORMAT.html
#PROVISIONWATCHER_4XXFILE=$provisionWatcherReportPath4XXStatus/provisionWatcher$TIMESTAMPFORMAT.html
#SCHEDULE_200FILE=$scheduleReportPath200Status/schedule$TIMESTAMPFORMAT.html
#SCHEDULE_4XXFILE=$scheduleReportPath4XXStatus/schedule$TIMESTAMPFORMAT.html
#SCHEDULEEVENT_200FILE=$scheduleEventReportPath200Status/scheduleEvent$TIMESTAMPFORMAT.html
#SCHEDULEEVENT_4XXFILE=$scheduleEventReportPath4XXStatus/scheduleEvent$TIMESTAMPFORMAT.html
#
#DEVICECCREPORT200FILE=$deviceCcReportPath200Status/device$TIMESTAMPFORMAT.html
#DEVICECCREPORT4XXFILE=$deviceCcReportPath4XXStatus/device$TIMESTAMPFORMAT.html

EVENTREPORT200FILE=$eventReportPath200Status/event$TIMESTAMPFORMAT.xml
EVENTREPORT4XXFILE=$eventReportPath4XXStatus/event$TIMESTAMPFORMAT.xml
READINGREPORT200FILE=$readingReportPath200Status/reading$TIMESTAMPFORMAT.xml
READINGREPORT4XXFILE=$readingReportPath4XXStatus/reading$TIMESTAMPFORMAT.xml
VDREPORT200FILE=$vdReportPath200Status/valuedescriptor$TIMESTAMPFORMAT.xml
VDREPORT4XXFILE=$vdReportPath4XXStatus/valuedescriptor$TIMESTAMPFORMAT.xml

ADDRESSABLE_200FILE=$addressableReportPath200Status/addressable$TIMESTAMPFORMAT.xml
ADDRESSABLE_4XXFILE=$addressableReportPath4XXStatus/addressable$TIMESTAMPFORMAT.xml
COMMAND_200FILE=$commandReportPath200Status/command$TIMESTAMPFORMAT.xml
COMMAND_4XXFILE=$commandReportPath4XXStatus/command$TIMESTAMPFORMAT.xml
DEVICE_200FILE=$deviceReportPath200Status/device$TIMESTAMPFORMAT.xml
DEVICE_4XXFILE=$deviceReportPath4XXStatus/device$TIMESTAMPFORMAT.xml
DEVICEMANAGER_200FILE=$deviceManagerPath200Status/deviceManager$TIMESTAMPFORMAT.xml
DEVICEMANAGER_4XXFILE=$deviceManagerPath4XXStatus/deviceManager$TIMESTAMPFORMAT.xml
DEVICEPROFILE_200FILE=$deviceProfileReportPath200Status/deviceProfile$TIMESTAMPFORMAT.xml
DEVICEPROFILE_4XXFILE=$deviceProfileReportPath4XXStatus/deviceProfile$TIMESTAMPFORMAT.xml
DEVICEREPORT_200FILE=$deviceRepReportPath200Status/deviceReport$TIMESTAMPFORMAT.xml
DEVICEREPORT_4XXFILE=$deviceRepReportPath4XXStatus/deviceReport$TIMESTAMPFORMAT.xml
DEVICESERVICE_200FILE=$deviceServiceReportPath200Status/deviceService$TIMESTAMPFORMAT.xml
DEVICESERVICE_4XXFILE=$deviceServiceReportPath4XXStatus/deviceService$TIMESTAMPFORMAT.xml
PROVISIONWATCHER_200FILE=$provisionWatcherReportPath200Status/provisionWatcher$TIMESTAMPFORMAT.xml
PROVISIONWATCHER_4XXFILE=$provisionWatcherReportPath4XXStatus/provisionWatcher$TIMESTAMPFORMAT.xml
SCHEDULE_200FILE=$scheduleReportPath200Status/schedule$TIMESTAMPFORMAT.xml
SCHEDULE_4XXFILE=$scheduleReportPath4XXStatus/schedule$TIMESTAMPFORMAT.xml
SCHEDULEEVENT_200FILE=$scheduleEventReportPath200Status/scheduleEvent$TIMESTAMPFORMAT.xml
SCHEDULEEVENT_4XXFILE=$scheduleEventReportPath4XXStatus/scheduleEvent$TIMESTAMPFORMAT.xml

DEVICECCREPORT200FILE=$deviceCcReportPath200Status/device$TIMESTAMPFORMAT.xml
DEVICECCREPORT4XXFILE=$deviceCcReportPath4XXStatus/device$TIMESTAMPFORMAT.xml