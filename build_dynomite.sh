#!/bin/bash
echo "Building Dynomite + Redis Docker..."

cd ./dynomite
#Workaround: to get latest git pull
#make create_marker 

# try to build images
make build

#get git pull version from the latest dynomite 
printf '%s' "$(docker run -it --entrypoint dynomite gitlab-ptk.gt.local:5005/dynomite -V | xargs)">DYNOMITE_VERSION
printf '%s' "$(cat DYNOMITE_VERSION | sed -r 's/^.+dynomite-(.+)$/\1/')">DYNOMITE_VERSION_TAG

export DYNOMITE_VERSION=$(cat DYNOMITE_VERSION)
export DYNOMITE_VERSION_TAG=$(cat DYNOMITE_VERSION_TAG)

#Tag with actual version
make tag

#Push to remote repository
make login push


echo "Finished Dynomite + Redis Docker."
