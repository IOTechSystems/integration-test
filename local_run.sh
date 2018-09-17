#!/bin/bash

option="${1}"

. $(dirname "$0")/local_run_env.sh

echoAllAvailableCommand() {
    echo "[info] show below available command"

    COLLECTIONS=(
        "-localDeploy"
        "-copyPostmanTestScriptToNewman"

        "-testCoreData"
        "-importMetaData"

        "-testMetaData"
        "-importCoreData"

        "-testCommand"
        "-importCommand"

        "-testSupportLogging"
        "-importSupportLogging"

        "-testSupportNotification"
        "-importSupportNotification"

        "-testSupportRulesengine"

        "-testExportClient"
        "-importExportClient"
    )

    for index in "${!COLLECTIONS[@]}"
    do
        echo "${index}. ${COLLECTIONS[index]}"
    done
}

case ${option} in
    -localDeploy)
        sh local-deploy-edgeX.sh
        ;;
    -copyPostmanTestScriptToNewman)
        POSTMAN_CONTAINER=$(docker-compose ps -q postman)
        POSTMAN_CONTAINER=`echo ${POSTMAN_CONTAINER} | cut -b 1-12`
        docker cp $(dirname "$0")/bin/postman-test/. "${POSTMAN_CONTAINER}":/etc/newman
        ;;

    # CoreData
    -testCoreData)
        $(dirname "$0")/bin/flushCoreDataDump.sh
        sh ./bin/run.sh -cd
        ;;
    -importCoreData)
        $(dirname "$0")/bin/flushCoreDataDump.sh
        $(dirname "$0")/bin/importCoreDataDump.sh
        ;;

    # MetaData
    -testMetaData)
        $(dirname "$0")/bin/flushMetaDataDump.sh
        sh ./bin/run.sh -md
        ;;
    -importMetaData)
        $(dirname "$0")/bin/flushMetaDataDump.sh
        $(dirname "$0")/bin/importMetaDataDump.sh
        ;;

    # Command
    -testCommand)
        $(dirname "$0")/bin/flushCommandDataDump.sh
        sh ./bin/run.sh -co
        ;;
    -importCommand)
        $(dirname "$0")/bin/flushCommandDataDump.sh
        $(dirname "$0")/bin/importCommandDataDump.sh
        ;;

    # SupportLogging
    -testSupportLogging)
        $(dirname "$0")/bin/flushLoggingDataDump.sh
        sh ./bin/run.sh -log
        ;;
    -importSupportLogging)
        $(dirname "$0")/bin/flushLoggingDataDump.sh
        $(dirname "$0")/bin/importLoggingDataDump.sh
        ;;

    # SupportNotification
    -testSupportNotification)
        $(dirname "$0")/bin/flushSupportNotificationDump.sh
        sh ./bin/run.sh -sn
        ;;
    -importSupportNotification)
        $(dirname "$0")/bin/flushSupportNotificationDump.sh
        $(dirname "$0")/bin/importSupportNotificationDump.sh
        ;;

    # SupportRulesengine
    -testSupportRulesengine)
        sh ./bin/run.sh -ru
        ;;

    # ExportClient
    -testExportClient)
        $(dirname "$0")/bin/flushExportClientDataDump.sh
        sh ./bin/run.sh -exc
        ;;
    -importExportClient)
        $(dirname "$0")/bin/flushExportClientDataDump.sh
        $(dirname "$0")/bin/importExportClientDataDump.sh
        ;;
   	*)
      	echoAllAvailableCommand
      	;;
esac



