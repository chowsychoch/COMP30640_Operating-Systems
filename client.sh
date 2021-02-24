#!/bin/bash

if [ $# -lt 2 ];then
	echo "Error: parameters problem"
	exit 1
fi 

#assign the input to variable
clientid=$1
req=$2
all="$@"
args="${@:3}"

mkfifo $clientid.pipe

#id + req to server pipe
#echo "$clientid";
#echo "$clientid $req $" > server.pipe;


case $req in
	create)
	#do
	#check validation 
	if [  $# -eq 3 ];then
		#send input to server pipe
		echo "$clientid $req $args " > server.pipe;
		#print out result of client pipe
		cat "$clientid.pipe"
	else
		echo "parameters problem, please try again";
		rm "$clientid.pipe"
		exit 1
	fi
	#rm client pipe
	rm "$clientid.pipe"
	;;
	add)
	#do
	if [ $# -eq 4 ];then
		echo "$clientid $req $args" >server.pipe;
		cat "$clientid.pipe"
	else
		echo "parameters problem"
		rm "$clientid.pipe"
		exit 1 
		
	fi
	rm  "$clientid.pipe"
	;;
	post)
	#do
	if [ $# -ge 5 ];then
		echo "$clientid $req $args" > server.pipe;
		cat "$clientid.pipe"
	else
		echo "parameters problem"
		rm "$clientid.pipe"
		exit 1 
	fi
	rm "$clientid.pipe"	
	;;
	show)
	#do
	if [ $# -eq 3 ];then
		echo "$clientid $req $args" > server.pipe;
		cat "$clientid.pipe"
	else
		echo "parameters problems"
		rm "$clientid.pipe"
		exit 1 
	fi
	rm  "$clientid.pipe"
	;;
	shutdown)
	#do
	echo "$clientid $req" > server.pipe;
	echo "quittiing..."
	rm  "$clientid.pipe"
	exit 0
	;;
*)
	echo "Error: bad request"
	exit 1
esac




