#!/usr/bin/env bash

export volume=edgexfoundry/docker-edgex-volume:0.2
export mongo=edgexfoundry/docker-edgex-mongo:0.2
export configSeed=edgexfoundry/docker-core-config-seed:0.2.1

# Core service

export coreData=edgexfoundry/docker-core-data:0.2.1
export coreMetadata=edgexfoundry/docker-core-metadata:0.2.1
export coreCommand=edgexfoundry/docker-core-command:0.2.1

#export coreMetadata=docker.iotechsys.com/edgexpert/core-metadata-java-x86_64:0.5.2
#export coreData=docker.iotechsys.com/edgexpert/core-data-java-x86_64:0.5.2
#export coreCommand=docker.iotechsys.com/edgexpert/core-command-java-x86_64:0.5.2


# Support service

export supportLogging=edgexfoundry/docker-support-logging:0.2.1
export supportScheduler=edgexfoundry/docker-support-scheduler:0.2.1
export exportClient=edgexfoundry/docker-export-client:0.2.1
export exportDistro=edgexfoundry/docker-export-distro:0.2.1
export supportRulesengine=edgexfoundry/docker-support-rulesengine:0.2.1
export supportNotifications=edgexfoundry/docker-support-notifications:0.2.1
export deviceVirtual=edgexfoundry/docker-device-virtual:0.2.1

#export supportLogging=edgexfoundry/docker-support-logging-go:0.5.2
#export supportLogging=docker.iotechsys.com/edgexpert/support-logging-go-x86_64:0.5.2
#export supportScheduler=docker.iotechsys.com/edgexpert/support-scheduler-java-x86_64:0.5.2
#export exportClient=docker.iotechsys.com/edgexpert/export-client-java-x86_64:0.5.2