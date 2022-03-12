#!/bin/bash


#Check for parameters:
if [[ $# -ne 2 ]]; then
	echo "You need to pass 2 parameters: mouse_name and sensitivity."

	exit -1
fi

DEVICES="$(xinput --list)"

FOUND_DEVICE="$(echo "$DEVICES" | grep $1 )"


#Find device:
ID_REGEX="id=([0-9]+)"

D_ID=""

if [[ $FOUND_DEVICE =~ $ID_REGEX ]]; then
	D_ID="${BASH_REMATCH[1]}"

	
else
	echo "The device was not found!"
	exit -2
fi

echo "$D_ID"

#echo "$DEVICES"
