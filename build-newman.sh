#!/bin/bash

. ./arch.sh
cd newman/docker/images/alpine33
docker build --build-arg NEWMAN_VERSION=4.0.2 -t iotech_newman_$EX_ARCH:4.0.2 .
