

node {try {
    stage('Deploy test service') {
        sh 'sh deploy-edgeX.sh'
    }

    stage('Clear test service') {
        steps {
            sh 'docker-compose down'
        }
    }
        stage('Run Postman test') {
            steps {
                sh './bin/run.sh -cd'

                junit './bin/postman-test/newman/**.xml'
            }
        }
            }catch (exc) {
                echo 'Something failed, I should sound the klaxons!'
                throw
            }
}
