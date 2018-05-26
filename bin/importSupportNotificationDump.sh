#!/bin/bash

DATA_BASE="notifications"

COLLECTIONS=( "subscription" "notification" "transmission" )

DUMP_FILES=(
    "/etc/newman/DataDumps/supportNotifications/subscription.json"

)

for index in "${!DUMP_FILES[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongoimport -d ${DATA_BASE} -c ${COLLECTIONS[index]} --file ${DUMP_FILES[index]}"

    echo "Info: ${DUMP_FILES[index]} data imported"
done