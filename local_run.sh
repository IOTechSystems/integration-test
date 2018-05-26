#!/bin/sh

option="${1}"

. $(dirname "$0")/test_env.sh

echoAllAvailableCommand() {
    echo "[info] show below available command"

    COLLECTIONS=(
        "-localDeploy"
        "-copyPostmanTestScriptToNewman"

        "-TestSupportNotification"
        "-importSupportNotification"
        "-flushSupportNotification"
    )

    for index in "${!COLLECTIONS[@]}"
    do
        echo "${index}. ${COLLECTIONS[index]}"
    done
}

case ${option} in
    -localDeploy)
        sh local-deploy-edgex.sh
        ;;
    -copyPostmanTestScriptToNewman)
        VOLUME_CONTAINER=$(docker-compose ps -q volume)
        VOLUME_CONTAINER=`echo ${VOLUME_CONTAINER} | cut -b 1-12`
        docker cp $(dirname "$0")/bin/postman-test/. "${VOLUME_CONTAINER}":/etc/newman
        ;;

    # SupportNotification
    -TestSupportNotification)
        $(dirname "$0")/bin/flushSupportNotificationDump.sh
        sh ./bin/run.sh -sn
        ;;
    -importSupportNotification)
        $(dirname "$0")/bin/importSupportNotificationDump.sh
        ;;
    -flushSupportNotification)
        $(dirname "$0")/bin/flushSupportNotificationDump.sh
        ;;

   	*)
      	echoAllAvailableCommand
      	;;
esac



