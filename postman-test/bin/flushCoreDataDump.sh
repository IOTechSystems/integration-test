#!/bin/bash

NAMESFILE=files.sh
EVENTDUMPJS=javascript/coredata/event.js
READINGDUMPJS=javascript/coredata/reading.js
VDDUMPJS=javascript/coredata/valueDescriptor.js


if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

if [ -f $EVENTDUMPJS ]; then 

	mongo $mongoDbHost/coredata $EVENTDUMPJS
	echo "Info: Event data flushed"

else
	echo "Error: Mongo JS event file does not exist."

fi

if [ -f $READINGDUMPJS ]; then 

	mongo $mongoDbHost/coredata $READINGDUMPJS
	echo "Info: Reading data flushed"

else
	echo "Error: Mongo JS Reading file does not exist."

fi

if [ -f $VDDUMPJS ]; then 

	mongo $mongoDbHost/coredata $VDDUMPJS
	echo "Info: Value Descriptor data flushed"

else
	echo "Error: Mongo JS Value Descriptor file does not exist."

fi
