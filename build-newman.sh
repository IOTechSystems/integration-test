#!/bin/bash

. ./arch.sh
cd newman/docker/images/alpine37
docker build --build-arg NEWMAN_VERSION=4.0.2 -t docker.iotechsys.com/services/iotech_newman_$EX_ARCH:4.0.2 .
docker push docker.iotechsys.com/services/iotech_newman_$EX_ARCH:4.0.2
