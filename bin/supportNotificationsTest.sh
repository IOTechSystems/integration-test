#!/bin/bash

COLLECTION_PATH="collections/support-notifications.postman_collection.json"
ENV_PATH="environment/edgex.postman_environment.json"

echo "Info: Initiating Support Notifications Test."

echo "[info] ---------- use docker-compose run newman ----------"

docker-compose run --rm postman run ${COLLECTION_PATH} --folder="subscription" --iteration-data="data/subscriptionData.json"  --environment=${ENV_PATH} --reporters="junit,cli" --reporter-junit-export "newman/supportNotifications_subscription_`date "+%Y%m%d-%H%M%S"`.xml"
docker-compose run --rm postman run ${COLLECTION_PATH} --folder="notification" --iteration-data="data/notificationData.json"  --environment=${ENV_PATH} --reporters="junit,cli" --reporter-junit-export "newman/supportNotifications_notification_`date "+%Y%m%d-%H%M%S"`.xml"
docker-compose run --rm postman run ${COLLECTION_PATH} --folder="transmission" --iteration-data="data/transmissionData.json"  --environment=${ENV_PATH} --reporters="junit,cli" --reporter-junit-export "newman/supportNotifications_transmission_`date "+%Y%m%d-%H%M%S"`.xml"
docker-compose run --rm postman run ${COLLECTION_PATH} --folder="ping"  --environment=${ENV_PATH} --reporters="junit,cli" --reporter-junit-export "newman/supportNotifications_ping_`date "+%Y%m%d-%H%M%S"`.xml"
