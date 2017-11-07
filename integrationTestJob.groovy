def runNode() {

    try {

        stage('Startup test services') {
            sh 'bash ./deploy-edgeX.sh'
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

return this
