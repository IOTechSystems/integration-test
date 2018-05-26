#!/bin/bash

DATA_BASE="notifications"

SUBSCRIPTION_JS=/etc/newman/javascript/supportNotifications/flushScript.js

FLUSH_SCRIPTS=( $SUBSCRIPTION_JS )

for index in "${!FLUSH_SCRIPTS[@]}"
do
    docker-compose exec -T mongo /bin/bash -c "mongo ${DATA_BASE} ${FLUSH_SCRIPTS[index]}"

    echo "Info: ${FLUSH_SCRIPTS[index]} data flushed"

done

