#!/bin/bash
echo "Building CGRateS Minimal Dockers..."

cd ./minimal
cp /home/golan/proj/bin/static/cgr-* ./bin
# try to build a docker images
BIN=cgr-engine make build login push
BIN=cgr-migrator make build login push
BIN=cgr-loader make build login push
BIN=cgr-console make build login push
BIN=cgr-tester make build login push
echo "Finished building cgr dockers"
