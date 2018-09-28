#!/bin/bash
echo "Building CGRateS Minimal Dockers..."

cd ./minimal
cp /home/golan/proj/bin/cgr-* ./bin
# try to build a docker images
BIN=cgr-tester make build login push
echo "Finished building cgr binaries"
