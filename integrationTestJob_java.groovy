
def runNode() {
    slack = load "${pwd()}/slack.groovy"

    def envMap =[
        'volume':'docker.iotechsys.com/edgexpert/docker-edgex-volume-x86_64:1.0.0',
        'mongo':'docker.iotechsys.com/edgexpert/docker-edgex-mongo-x86_64:1.0.0',
        'consul':'consul:1.1.0',
        'configSeed':'docker.iotechsys.com/edgexpert/docker-core-config-seed-go-x86_64:1.0.0',

        'coreData':'edgexfoundry/docker-core-data:0.2.1',
        'coreMetadata':'edgexfoundry/docker-core-metadata:0.2.1',
        'coreCommand':'edgexfoundry/docker-core-command:0.2.1',

        'supportLogging':'edgexfoundry/docker-support-logging:0.2.1',
        'supportNotifications':'docker.iotechsys.com/edgexpert/support-notifications-java-x86_64:1.0.0',
        'supportScheduler':'docker.iotechsys.com/edgexpert/support-scheduler-java-x86_64:1.0.0',
        'supportRulesengine':'docker.iotechsys.com/edgexpert/support-rulesengine-java-x86_64:1.0.0',

        'exportClient':'edgexfoundry/docker-export-client:0.2.1',
        'exportDistro':'edgexfoundry/docker-export-distro:0.2.1',

        'deviceVirtual':'docker.iotechsys.com/edgexpert/device-virtual-java-x86_64:1.0.0',
        'deviceSDK':'docker.iotechsys.com/edgexpert/device-sdk-java-x86_64:1.0.0',
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
            timeout(20){

                stage('Startup test services') {
                    sh 'bash ./deploy-edgeX.java.sh'
                }

                stage('Run Postman test') {
                    sh 'rm -rf bin/testResult'

                    sh './bin/run.sh -all'

                    junit 'bin/testResult/**.xml'

                }
            }

        }catch (e) {
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
