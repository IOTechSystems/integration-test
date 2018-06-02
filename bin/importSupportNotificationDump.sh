#!/bin/bash

DATA_BASE="notifications"


DUMP_FILES=(
    "/etc/newman/DataDumps/supportNotifications/subscription.js"

)

for index in "${!DUMP_FILES[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${DUMP_FILES[index]}"
done