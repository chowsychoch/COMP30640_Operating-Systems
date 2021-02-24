#!/bin/bash

#check validation 

if [ ! "$#" -eq 3 ];then
	echo "Error: parameters problem"
	exit 1
elif [ ! -d "$1" ];then
	echo "Error: Receiver does not exist"
	exit 1
elif [ ! -d "$2" ];then
	echo "Error: Sender does not exist"
	exit 1

else
loopisDone=false
while read line;do 
	if [ "$line" == "$2" ];then
	#echo "$line"
	loopisDone=true
	fi
done < "$1"/friends

#echo "$loopisDone"

if [ $loopisDone == false ];then
	echo "Error: Sender is not a friend of receiver"
	exit 1
else
	./P.sh "$1"
	echo "Ok: Message posted to wall"
	echo ""$2": "$3"" >> "$1"/wall
	./V.sh "$1"
	exit 0

fi
fi
