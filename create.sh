#!/bin/bash

#check validation 

#should have one para
if [ ! $# -eq 1 ];then
	echo "Error: parameters problem"
	exit 1
elif [ -d "$1" ];then
	echo "user already exists"
	exit 1
else
	./P.sh "$1"	
	mkdir "$1" && touch "$1"/friends "$1"/wall 
	echo "OK: user created"
	./V.sh "$1"
	exit 0
fi
# should not exist user 
