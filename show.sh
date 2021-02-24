#!/bin/bash

#check validation 

if [ ! $# -eq 1 ];then
	echo "Error: parameters problem"
	exit 1
elif [ ! -d "$1" ];then
	echo "Error: user does not exist" 
	exit 1 
else
	./P.sh "$1"
	echo "wallStart";
	while read line;do
	#sth
	echo "$line"
	done < "$1"/wall;
	echo "wallEnd"
	./V.sh "$1"
	exit 0 
fi
