pipeline {
    agent any
    stages {
        stage('Build artifact') {
            agent any
            steps {
                sh 'ssh bruce@192.168.99.100 pwd'
                //sh 'cp /Users/bruce/Documents/workspace/postman/newman/newman-run-report-2017-09-16-03-40-37-879-0.xml .'
                sh 'scp * bruce@192.168.99.100:jenkins/it#${BUILD_ID}/'
                sh 'pwd'
                junit 'postman/newman/**.xml'
            }
        }
    }
}

