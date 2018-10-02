#!/bin/bash
echo "Building CGRateS Developer Docker..."

cd ./devel
# try to build a docker images
make create_marker build login push

echo "Finished building devel docker"
