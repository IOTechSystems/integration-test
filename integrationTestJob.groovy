def runNode() {

    try {

        stage('Startup test services') {
            sh 'sh deploy-edgeX.sh'
        }

        stage('Run Postman test') {

            sh './bin/run.sh -cd'

            junit 'result/**.xml'

            sh 'rm -rf result'
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