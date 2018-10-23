#!/bin/bash

#Building cgrates binaries with golang environment, full cgr lab setup with mysql and redis all-in-one
#Building and pushing cgrates:devel docker image
#Building static binaries for minimal docker image generation
./build_devel.sh

#Building docker images per each binary
./build_minimal.sh
