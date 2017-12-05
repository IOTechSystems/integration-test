
def runNode() {
    def envMap =[
        'volume':'edgexfoundry/docker-edgex-volume',
        'consul':'edgexfoundry/docker-core-consul',
        'coreMetadata':'edgexfoundry/docker-core-metadata',
        'mongo':'edgexfoundry/docker-edgex-mongo',
        'mongoSeed':'edgexfoundry/docker-edgex-mongo-seed',
        'supportLogging':'edgexfoundry/docker-support-logging',
        'coreMetadata':'docker.iotechsys.com/edgex/core-metadata:built',
        'coreData':'docker.iotechsys.com/edgex/core-data:built',
        'coreCommand':'docker.iotechsys.com/edgex/core-command:built',
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

            stage('Startup test services') {
                sh 'docker login -u bruce -p Txcx2sDHk5Ts3GO2 docker.iotechsys.com'
                sh 'bash ./deploy-edgeX.sh'
                sh 'docker logout docker.iotechsys.com'
            }

            stage('Run Postman test') {
                sh 'rm -rf bin/testResult'

                sh './bin/run.sh -all'

                junit 'bin/testResult/**.xml'

            }


        }catch (e) {
            echo 'Something failed!'
            throw e;
        }finally{
            stage('Shutdown test services') {
                echo '[INFO] test end !'
                sh 'docker-compose down -v'
            }
        }
    }


}

return this
