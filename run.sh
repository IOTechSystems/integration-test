#!/bin/sh

echo "done"
pwd

docker pull edgexfoundry/docker-edgex-volume
docker pull edgexfoundry/docker-core-consul
docker pull edgexfoundry/docker-core-config-seed
docker pull edgexfoundry/docker-edgex-mongo
docker pull edgexfoundry/docker-edgex-mongo-seed
docker pull edgexfoundry/docker-support-logging
docker pull edgexfoundry/docker-support-notifications
docker pull edgexfoundry/docker-core-metadata
docker pull edgexfoundry/docker-core-data
docker pull edgexfoundry/docker-core-command
docker pull edgexfoundry/docker-support-scheduler
docker pull edgexfoundry/docker-export-client
docker pull edgexfoundry/docker-export-distro
docker pull edgexfoundry/docker-support-rulesengine
docker pull edgexfoundry/docker-device-virtual


sh deploy-edgeX.sh

cd postman-test/bin
sh run.sh -cd ${1}

cd ..
cd ..

docker-compose down