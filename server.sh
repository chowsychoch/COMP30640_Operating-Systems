#!/bin/bash 

if [ ! -p "server.pipe" ];then
	#make a pipe first
	echo "making pipe" 
	mkfifo server.pipe
fi
while true;do
	#read -a "request"
	#echo "${request[@]}"
	read -a "request"  < server.pipe;
	clientid=${request[0]}
	message=${request[@]:4}
	#echo "${request[@]:4}";
	
		case "${request[1]}" in 
			create)		
			./create.sh "${request[2]}" > $clientid.pipe
			;;
			add)
			./add.sh "${request[2]}" "${request[3]}" > $clientid.pipe
			;;
			post)
			./post.sh "${request[2]}" "${request[3]}" "${message}" > $clientid.pipe
			;;
			show)
			./show.sh "${request[2]}" > $clientid.pipe
			;;
			shutdown)
			rm server.pipe
			exit 0 
			;;
		*)
			echo "Error: bad request"
			rm server.pipe
			exit 1 
		esac
	
done

