node {
    try {

        stage('Deploy test service') {
            sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            steps {
                sh './bin/run.sh -cd'

                junit './bin/postman-test/newman/**.xml'
            }
        }

        stage('Clear test service') {
            steps {
                sh 'docker-compose down'
            }
        }

    }catch (exc) {
        echo 'Something failed!'
        sh 'docker-compose down'
    }
}
