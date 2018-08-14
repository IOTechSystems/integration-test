#!/bin/bash

. ./arch.sh
cd newman/docker/images/ubuntu1404
docker build --build-arg NEWMAN_VERSION=4.0.0 -t docker.iotechsys.com/services/iotech_newman_$EX_ARCH:4.0.0 .
docker push docker.iotechsys.com/services/iotech_newman_$EX_ARCH:4.0.0
