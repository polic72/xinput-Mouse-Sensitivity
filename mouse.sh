#!/bin/bash


#Check for parameters:
if [[ $# -ne 3 ]]; then
	echo "You need to pass 3 parameters: [mouse_name], [prop_name], and [sensitivity]."

	exit -1
fi


#Find device:
DEVICES="$(xinput --list)"

FOUND_DEVICE="$(echo "$DEVICES" | grep $1 )"


ID_REGEX="id=([0-9]+)"

D_ID=""

if [[ $FOUND_DEVICE =~ $ID_REGEX ]]; then
	D_ID="${BASH_REMATCH[1]}"
else
	echo "The device was not found!"
	exit -2
fi


#Find prop:
PROPS="$(xinput --list-props ${D_ID})"

FOUND_PROP="$(echo "$PROPS" | grep "$2" )"


PROP_REGEX="${2} \(([0-9]+)\)"

P_ID=""

if [[ $FOUND_PROP =~ $PROP_REGEX ]]; then
	P_ID="${BASH_REMATCH[1]}"
else
	echo "The prop was not found!"
	exit -3
fi



#Set sensitivity:
xinput --set-prop $D_ID $P_ID $3


echo "Set the $1 pointer to $3 sensitivity."
