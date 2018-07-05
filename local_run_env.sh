#!/usr/bin/env bash

export volume=docker.iotechsys.com/edgexpert/docker-edgex-volume-x86_64:1.0.0
export mongo=docker.iotechsys.com/edgexpert/docker-edgex-mongo-x86_64:1.0.0
export configSeed=docker.iotechsys.com/edgexpert/docker-core-config-seed-go-x86_64:1.0.0

# Core service

export coreData=docker.iotechsys.com/edgexpert/core-data-go-x86_64:1.0.0
export coreMetadata=docker.iotechsys.com/edgexpert/core-metadata-go-x86_64:1.0.0
export coreCommand=docker.iotechsys.com/edgexpert/core-command-go-x86_64:1.0.0

#export coreMetadata=docker.iotechsys.com/edgexpert/core-metadata-java-x86_64:0.5.2
#export coreData=docker.iotechsys.com/edgexpert/core-data-java-x86_64:0.5.2
#export coreCommand=docker.iotechsys.com/edgexpert/core-command-java-x86_64:0.5.2


# Support service

export supportLogging=docker.iotechsys.com/edgexpert/support-logging-go-x86_64:1.0.0
export supportNotifications=docker.iotechsys.com/edgexpert/support-notifications-java-x86_64:1.0.0

export supportScheduler=docker.iotechsys.com/edgexpert/support-scheduler-java-x86_64:1.0.0

export exportClient=edgexfoundry/docker-export-client:0.2.1
export exportDistro=docker.iotechsys.com/edgexpert/export-distro-go-x86_64:1.0.0
export supportRulesengine=edgexfoundry/docker-support-rulesengine:0.2.1

export deviceVirtual=docker.iotechsys.com/edgexpert/device-virtual-java-x86_64:1.0.0
