#!/bin/bash

#check validation 

if [ ! $# -eq 2 ];then
	echo "Error: parameters problem"
	exit 1
elif [ ! -d "$1" ];then
	echo "Error: user does not exist"
	exit 1
elif [ ! -d "$2" ];then
	echo "$2";
	echo "Error: friend does not exist";
	exit 1
fi

loopisDone=false
while read line; do
#	"$loopisDone"=true 
#if found the match friend in friend file
	#echo "$line";
	if [ "$line" == "$2" ];then
	echo "Error: user already friends with this user"
	exit 1
	fi
done <  "$1"/friends

loopisDone=true

#echo "$loopisDone"
if [ "$loopisDone" == true ];then
	./P.sh "$1"
	echo "OK: friend added" &&
	echo "$2" >> "$1"/friends
	./V.sh "$1"
	exit 0

fi
