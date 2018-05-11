#!/usr/bin/env bash

export volume=docker.iotechsys.com/edgexpert/docker-edgex-volume-x86_64:0.5.2
export mongo=docker.iotechsys.com/edgexpert/docker-edgex-mongo-x86_64:0.5.2
export configSeed=docker.iotechsys.com/edgexpert/docker-core-config-seed-x86_64:0.5.2

# Core service

export coreData=docker.iotechsys.com/edgexpert/core-data-go-x86_64:0.5.2
export coreMetadata=docker.iotechsys.com/edgexpert/core-metadata-go-x86_64:0.5.2
export coreCommand=docker.iotechsys.com/edgexpert/core-command-go-x86_64:0.5.2

#export coreMetadata=docker.iotechsys.com/edgexpert/core-metadata-java-x86_64:0.5.2
#export coreData=docker.iotechsys.com/edgexpert/core-data-java-x86_64:0.5.2
#export coreCommand=docker.iotechsys.com/edgexpert/core-command-java-x86_64:0.5.2


# Support service

export supportLogging=docker.iotechsys.com/edgexpert/support-logging-go-x86_64:0.5.2
export supportNotifications=docker.iotechsys.com/edgexpert/support-notifications-java-x86_64:0.5.2
export supportRulesengine=edgexfoundry/docker-support-rulesengine:0.2.1
export supportScheduler=edgexfoundry/docker-support-scheduler:0.2.1
export exportClient=edgexfoundry/docker-export-client:0.2.1
export exportDistro=edgexfoundry/docker-export-distro:0.2.1
export deviceVirtual=edgexfoundry/docker-device-virtual:0.2.1

#export supportLogging=edgexfoundry/docker-support-logging-go:0.5.2
#export supportLogging=docker.iotechsys.com/edgexpert/support-logging-go-x86_64:0.5.2
#export supportScheduler=docker.iotechsys.com/edgexpert/support-scheduler-java-x86_64:0.5.2
#export exportClient=docker.iotechsys.com/edgexpert/export-client-java-x86_64:0.5.2