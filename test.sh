#!/bin/sh

VOLUME_CONTAINER=$(docker-compose ps -q volume)
VOLUME_CONTAINER=`echo ${VOLUME_CONTAINER} | cut -b 1-12`

echo ${VOLUME_CONTAINER}
docker cp ${PWD}/bin/postman-test "${VOLUME_CONTAINER}":/etc/newman
docker-compose exec -T  volume ls /etc/newman