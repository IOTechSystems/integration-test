#!/bin/bash

option="${1}"
DOCKER_NETWORK="${2}"

echo " ${option}  ${DOCKER_NETWORK}"

if [ -z "${DOCKER_NETWORK}" ] ; then
    echo "[ERROR] Need DOCKER_NETWORK  "
    exit 1;
fi





TIMESTAMPFORMAT=`date +%d-%m-%Y_%H%M%S`
BASEPATH=../scriptLogs
COREDATALOGSPATH=$BASEPATH/coreData$TIMESTAMPFORMAT.log
METADATALOGSPATH=$BASEPATH/metaData$TIMESTAMPFORMAT.log
COMMANDLOGSPATH=$BASEPATH/command$TIMESTAMPFORMAT.log
FUSELOGSPATH=$BASEPATH/fuse$TIMESTAMPFORMAT.log

coreDataTest() {
	
	$(dirname "$0")/importCoreDataDump.sh
	$(dirname "$0")/coreDataTest.sh ${DOCKER_NETWORK}
	$(dirname "$0")/flushCoreDataDump.sh

}


metaDataTest() {	

 	$(dirname "$0")/importMetaDataDumps.sh
 	$(dirname "$0")/metadataTest.sh ${DOCKER_NETWORK}
	./flushMetaDataDump.sh

}

commandTest() {

	$(dirname "$0")/importCommandDataDump.sh
	$(dirname "$0")/commandTest.sh ${DOCKER_NETWORK}
	$(dirname "$0")/flushCommandDataDump.sh

}

testAll() {

	coreDataTest
	metaDataTest
	commandTest
}

#Main Script starts here
./banner.sh


case ${option} in 
	-cd)  
	echo "Info: Initiating Coredata Test"
	coreDataTest	| tee $COREDATALOGSPATH
	;; 
	-md)  
	echo "Info: Initiating Metadata Test"
	metaDataTest    | tee $METADATALOGSPATH
      	;;
   	-co)  
      	echo "Info: Initiating Command Test"
	commandTest	| tee $COMMANDLOGSPATH
      	;;
   	-all)  
      	echo "Info: Initiating FUSE Test"
	testAll		| tee $FUSELOGSPATH
      	;; 
   	*)  
      	echo "`basename ${0}`:usage: [-cd Coredata] | [-md Metadata] | [-co Command] | [-all All]" 
      	echo
      	exit 0
      	;; 
esac 
echo
echo "Info: Logs available in [scriptLogs]"
echo "Info: HTML Reports available in [Reports]"
echo
./endBanner.sh



