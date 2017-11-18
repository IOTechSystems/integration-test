


def runNode() {
    def envMap =[
        'volume':'edgexfoundry/docker-edgex-volume',
        'consul':'edgexfoundry/docker-core-consul',
        'coreMetadata':'edgexfoundry/docker-core-metadata',
        'mongo':'edgexfoundry/docker-edgex-mongo',
        'mongoSeed':'edgexfoundry/docker-edgex-mongo-seed',
        'supportLogging':'edgexfoundry/docker-support-logging',
        'coreMetadata':'edgexfoundry/docker-core-metadata',
        'coreData':'edgexfoundry/docker-core-data',
        'coreCommand':'edgexfoundry/docker-core-command',
        'supportScheduler':'edgexfoundry/docker-support-scheduler',
        'exportClient':'edgexfoundry/docker-export-client',
        'exportDistro':'edgexfoundry/docker-export-distro',
        'supportRulesengine':'edgexfoundry/docker-support-rulesengine',
        'deviceVirtual':'edgexfoundry/docker-device-virtual'
    ]

    def envList = []

    for ( e in envMap ) {
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
