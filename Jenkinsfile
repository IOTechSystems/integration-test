pipeline {
    agent any
    stages {
        stage('Deploy test service') {
            agent any
            steps {
                sh 'rm -rf bin/postman-test/newman'
                sh 'sh deploy-edgeX.sh'
            }
        }

        stage('Run Postman test') {
            agent any
            steps {
                sh 'chmod u+x ./bin/postman-test/newman'
                sh 'rm -rf ./bin/postman-test/newman'

                sh './bin/run.sh -cd'

                junit './bin/postman-test/newman/**.xml'
            }
        }


        stage('Clear test service') {
            agent any
            steps {
                sh 'docker-compose down'
            }
        }

    }
}

