#!/bin/bash

if [[ -n "$1" ]]
then
	if [[ "$2" == "start" ]]
	then
		echo "Trying to start ngrep $1 container"
		docker run -it --net=container:$1 --rm --name=ngrep_$1 gitlab-ptk.gt.local:5005/tracer:1.1 ngrep -t -W byline $3 -d any
		echo "ngrep $1 container exited"
		
	elif [[ "$2" == "stop" ]]
	then
		echo "Trying to stop ngrep $1 container"
		docker rm ngrep_$1 -f
	fi
else
	echo "Must provide service name."
fi