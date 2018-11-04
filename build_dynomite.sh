#!/bin/bash
echo "Building Dynomite + Redis Docker..."

cd ./dynomite
#Workaround: to get latest git pull
#make create_marker 

# try to build images
make build

#get git pull version from the latest dynomite 
echo $(docker run -it --entrypoint dynomite gitlab-ptk.gt.local:5005/dynomite -V) > DYNOMITE_VERSION
echo $(cat DYNOMITE_VERSION | sed -r 's/^This\sis\sdynomite-OOO-\d\d-(.+)$/\1/') > DYNOMITE_VERSION_TAG

#Tag with actual version
make tag

#Push to remote repository
make login push


echo "Finished Dynomite + Redis Docker."
