
def runNode() {
    slack = load "${pwd()}/slack.groovy"

    def checkOs(){
        if (isUnix()) 
        {
            def uname = sh script: 'uname', returnStdout: true
            if (uname.startsWith("armv7l")) 
            {
                return "arm"
            }
            else if (uname.startsWith("aarch64")) 
            {
                return "arm64"
            }
            else if (uname.startsWith("x86_64")) 
            {
                return "x86_64"
            }
        }
    }



    def envMap =[
        'EX_CONSUL': false,
        'EX_LOG': false,
        'EX_VER':'1.0.1',
        'EX_ARCH': checkOs()
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
                sh 'docker container prune -f'

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
