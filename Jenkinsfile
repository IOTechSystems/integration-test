pipeline {
    agent any
    stages {
        stage('Build artifact') {
            agent any
            steps {
                sh 'ssh bruce@192.168.99.100 pwd'
                sh 'ssh bruce@192.168.99.100 mkdir -p jenkins/it#${BUILD_ID}/'
                sh 'scp * bruce@192.168.99.100:jenkins/it#${BUILD_ID}/'
                sh 'pwd'
                junit 'postman/newman/**.xml'
            }
        }
    }
}

