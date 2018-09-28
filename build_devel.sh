#!/bin/bash
echo "Building CGRateS Developer Docker..."

cd ./devel
# try to build a docker images
make build login push

echo "Finished building devel docker"
