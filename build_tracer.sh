#!/bin/bash
echo "Building Tracer Docker..."

cd ./tracer
#Workaround: to get latest git pull
#make create_marker 

# try to build images
make build

#Tag with actual version
make tag

#Push to remote repository
make login push


echo "Finished Tracer Docker."
