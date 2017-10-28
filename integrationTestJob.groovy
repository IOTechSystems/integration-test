def runNode() {

    try {

        stage('Startup test services') {
            sh 'sh deploy-edgeX.sh'
        }

        stage('Run Postman test') {
            sh 'rm -rf testResult'

            sh './bin/run.sh -cd'

            junit 'result/**.xml'

        }


    }catch (e) {
        echo 'Something failed!'
        throw e;
    }finally{
        stage('Shutdown test services') {
            echo '[INFO] test end !'
            sh 'docker-compose down'
        }
    }

}

return this