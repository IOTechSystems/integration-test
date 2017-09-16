#!/bin/bash

FILE=../config/config.txt

if [ -f $FILE ]; then
	
	. $FILE
else
	echo "Error: Configuration file does not exist"

fi


