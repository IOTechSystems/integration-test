#!/bin/bash

NAMESFILE=files.sh

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Coredata Test."

if [ "${WORKSPACE}" != "" ]; then

	echo "[info] ---------- jenkins use docker run newman  ----------"
	echo "[info] WORKSPACE is ${WORKSPACE}"

	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 \
	    run "collections/fuse-core-data.postman_collection.json" --folder="event" \
	    --iteration-data="data/eventData.json" --environment="environment/CoredataEnv.postman_environment.json"
	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 \
	    run "collections/fuse-core-data.postman_collection.json" --folder="event_error_4xx" \
	    --iteration-data="data/eventData.json" --environment="environment/CoredataEnv.postman_environment.json"


	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 run "collections/fuse-core-data.postman_collection.json" \
	    --folder="reading" --iteration-data="data/readingData.json" --environment="environment/CoredataEnv.postman_environment.json" 

	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 run "collections/fuse-core-data.postman_collection.json" \
	    --folder="valuedescriptor" --iteration-data="data/valueDescriptorData.json" --environment="environment/CoredataEnv.postman_environment.json" 


	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 run "collections/fuse-core-data.postman_collection.json" \
	    --folder="reading_error_4xx" --iteration-data="data/readingData.json" --environment="environment/CoredataEnv.postman_environment.json" 

	docker run --rm -v postman-test/:/etc/newman --network=host postman/newman_ubuntu1404 run "collections/fuse-core-data.postman_collection.json" \
	    --folder="valuedescriptor_error_4xx" --iteration-data="data/valueDescriptorData.json" --environment="environment/CoredataEnv.postman_environment.json" 
else
    WORKSPACE=/Users/bruce/Documents/eclipse-workspace/deploy-edgeX/

	echo "[info] not jenkins build"
    newman run $COREDATACOLLFILE --folder event -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT200FILE
fi

#newman run $COREDATACOLLFILE --folder event -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder reading -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT200FILE
#
#newman run $COREDATACOLLFILE --folder event_error_4xx -d $EVENTDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $EVENTREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder reading_error_4xx -d $READINGDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $READINGREPORT4XXFILE
#
#newman run $COREDATACOLLFILE --folder valuedescriptor_error_4xx -d $VDDATAFILE -e $COREDATAENVFILE -r cli,html --reporter-html-export $VDREPORT4XXFILE

echo "Info:Coredata Test Completed."
