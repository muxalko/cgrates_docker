#!/bin/bash
echo "Building CGRateS Minimal Dockers..."

cd ./minimal
#Copy from cgrates container instead (build_devel.sh)
#cp /home/golan/proj/bin/static/cgr-* ./bin
# try to build docker images
BIN=cgr-engine make build login push
BIN=cgr-migrator make build login push
BIN=cgr-loader make build login push
BIN=cgr-console make build login push
BIN=cgr-tester make build login push
echo "Finished building cgr dockers"
