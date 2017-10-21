node {
    checkout scm

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


    }catch (exc) {
        echo 'Something failed!'

    }finally{
        sh 'docker-compose down'
    }
}
