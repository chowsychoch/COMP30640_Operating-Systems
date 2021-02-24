#! /bin/bash

if [ -z "$1" ];then
	echo "USage $1 mutex-name"
	exit 1
else
	rm "$1-lock"
	exit 0
fi
