#!/bin/bash

# Copyright 2017 Konrad Zapalowicz <bergo.torino@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Start EdgeX Foundry services in right order, as described:
# https://wiki.edgexfoundry.org/display/FA/Get+EdgeX+Foundry+-+Users

#if [ "${OS}" ==  "Windows_NT" ] ; then
#    echo " os =  ${OS}"
#    . $(dirname "$0")/bin/env-win10.sh
#else
#    . $(dirname "$0")/bin/env.sh
#fi

run_service () {
	echo "[INFO] Starting.. $1"
	docker-compose -f docker-compose.go.yml up -d $1
}

run_service volume

run_service consul

run_service config-seed

run_service redis

run_service logging

run_service metadata

run_service data

run_service command

#
#run_service scheduler
#
#while ! $(docker-compose -f docker-compose.go.yml exec -T consul nc -z edgex-support-scheduler 48085);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
#sleep 5
#
run_service export-client

run_service export-distro

#run_service device-sdk

#while ! $(docker-compose -f docker-compose.go.yml exec -T consul nc -z edgex-device-sdk 49999);do echo "not already startup… wait for 5 second reconnect." ;sleep 5; done
#sleep 5

run_service postman
