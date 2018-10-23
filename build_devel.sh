#!/bin/bash
echo "Building CGRateS Developer Docker..."

cd ./devel

#Workaround: to get latest git pull
#make create_marker 

# try to build images
make build

#get last git pull version from the latest cgr-engine compiled from the actual container, used in ./devel/Makefile 
CGRATES_VERSION<$(docker run cgrates-devel /bin/sh -c "cgr-engine -version")
CGRATES_VERSION_TAG<$(echo $CGRATES_VERSION | sed -r 's/^CGRateS\s[0-9]\.[0-9].[0-9]\~[a-zA-Z0-9]*\sgit\+([a-zA-Z0-9]+)\s\((.+)\)/\1/')

#Tag with actual version
make tag

#Push to remote repository
#make login push

#Copy static binaries to ./minimal/static
docker run -v ~/cgrates_docker/minimal/bin:/root/static gitlab-ptk.gt.local:5005/cgrates-devel /bin/sh -c "cp /root/code/bin/static/cgr-* /root/static/"

echo "Finished building devel docker $(cat CGRATES_VERSION) $(cat CGRATES_VERSION_TAG)"
