#!/bin/bash
echo "Building CGRateS Minimal Dockers..."

cd ./minimal
# try to read binary versions (Ex. CGRateS 0.9.1~rc8 git+76dcc17 (2018-09-27T15:59:10+03:00))
CGR_ENGINE_VER=$(bin/cgr-tester --version)
echo "cgr-tester: "$CGR_ENGINE_VER
# try to build a docker image
docker build -t cgr-tester:${CGR_ENGINE_VER// /_} -f ./cgr-tester/Dockerfile .
echo "Finished building cgr-tester"