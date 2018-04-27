
def runNode() {
    slack = load "${pwd()}/slack.groovy"

    def envMap =[
        'volume':'edgexfoundry/docker-edgex-volume',
        'coreMetadata':'edgexfoundry/docker-core-metadata',
        'mongo':'edgexfoundry/docker-edgex-mongo',
        'supportLogging':'edgexfoundry/docker-support-logging:0.2',
        'coreMetadata':'docker.iotechsys.com/edgexpert/core-metadata-java-x86_64:0.5.0',
        'coreData':'docker.iotechsys.com/edgexpert/core-data-java-x86_64:0.5.0',
        'coreCommand':'docker.iotechsys.com/edgexpert/core-command-java-x86_64:0.5.0',
        'supportScheduler':'edgexfoundry/docker-support-scheduler',
        'exportClient':'edgexfoundry/docker-export-client',
        'exportDistro':'edgexfoundry/docker-export-distro',
        'supportRulesengine':'edgexfoundry/docker-support-rulesengine',
        'deviceVirtual':'edgexfoundry/docker-device-virtual'
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
