pipeline {

    agent any
    stages {
        stage('Deploy test service') {
            agent any

                steps {
                try {
                    sh 'sh deploy-edgeX.sh'
                }
                catch (exc) {
                    echo 'Something failed !'
                    sh 'docker-compose down'
                }
            }



        }

        stage('Run Postman test') {
            agent any
            steps {
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

