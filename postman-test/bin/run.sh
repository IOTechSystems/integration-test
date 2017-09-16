#!/bin/bash

TIMESTAMPFORMAT=`date +%d-%m-%Y_%H%M%S`
BASEPATH=../scriptLogs
COREDATALOGSPATH=$BASEPATH/coreData$TIMESTAMPFORMAT.log
METADATALOGSPATH=$BASEPATH/metaData$TIMESTAMPFORMAT.log
COMMANDLOGSPATH=$BASEPATH/command$TIMESTAMPFORMAT.log
FUSELOGSPATH=$BASEPATH/fuse$TIMESTAMPFORMAT.log

coreDataTest() {
	
	./importCoreDataDump.sh
	./coreDataTest.sh
	./flushCoreDataDump.sh

}


metaDataTest() {	

 	./importMetaDataDumps.sh
 	./metadataTest.sh
	./flushMetaDataDump.sh

}

commandTest() {

	./importCommandDataDump.sh
	./commandTest.sh
	./flushCommandDataDump.sh

}

testAll() {

	coreDataTest
	metaDataTest
	commandTest
}

#Main Script starts here
./banner.sh

option="${1}" 
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



