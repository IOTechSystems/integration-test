
def runNode() {
    slack = load "${pwd()}/slack.groovy"

    def envMap =[
        'volume':'docker.iotechsys.com/edgexpert/docker-edgex-volume-x86_64:0.5.2',
        'mongo':'docker.iotechsys.com/edgexpert/docker-edgex-mongo-x86_64:0.5.2',
        'configSeed':'docker.iotechsys.com/edgexpert/docker-core-config-seed-x86_64:0.5.2',

        'coreData':'docker.iotechsys.com/edgexpert/core-data-go-x86_64:0.5.2',
        'coreMetadata':'docker.iotechsys.com/edgexpert/core-metadata-go-x86_64:0.5.2',
        'coreCommand':'docker.iotechsys.com/edgexpert/core-command-go-x86_64:0.5.2',

        'supportLogging':'docker.iotechsys.com/edgexpert/support-logging-go-x86_64:0.5.2',
        'supportNotifications':'docker.iotechsys.com/edgexpert/support-notifications-java-x86_64:0.5.2',
        'supportScheduler':'docker.iotechsys.com/edgexpert/support-scheduler-java-x86_64:0.5.2',
        'supportRulesengine':'edgexfoundry/docker-support-rulesengine:0.2.1',

        'exportClient':'docker.iotechsys.com/edgexpert/export-client-go-x86_64:0.5.2',
        'exportDistro':'docker.iotechsys.com/edgexpert/export-distro-go-x86_64:0.5.2',

        'deviceVirtual':'docker.iotechsys.com/edgexpert/device-virtual-java-x86_64:0.5.2'
    ]
    if(params.TEST_SERVICE==null){
        print "test_service is null"
    }else{
        print "test_service is exist ,set to envMap"
        envMap.put(params.TEST_SERVICE,params.TEST_SERVICE_IMAGE)
    }

    def envList = []

    for ( e in envMap ) {
        print "set env ${e.key}=${e.value}"
        envList.add("${e.key}=${e.value}")
    }

    withEnv(envList) {
        try {

            timeout(15){

                stage('Startup test services') {
                    sh 'bash ./deploy-edgeX.go.sh'
                }

                stage('Run Postman test') {
                    sh 'rm -rf bin/testResult'

                    sh './bin/run.sh -all'

                    junit 'bin/testResult/**.xml'

                }
            }

        }catch (err) {
            echo 'Something failed!'
            slack.post('danger', 'Black testing failed !')
            throw e
        }finally{
            stage('Shutdown test services') {
                echo '[INFO] test end !'
                slack.post('good', 'Black testing done !')

                sh 'docker-compose down -v'
                sh 'docker volume prune -f'

                try{
                    sh 'docker rmi $(docker images -f dangling=true -q)'
                }catch (e){
                    echo 'clear done , none dangling image !'
                }

            }
        }
    }


}

return this
