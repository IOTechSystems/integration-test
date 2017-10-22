node {
    checkout scm

    try {

        stage('Deploy test service') {
            //sh 'rm -f bin/postman-test/newman/*'
            sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            sh './bin/run.sh -all'

            junit 'bin/postman-test/newman/**.xml'
        }


    }catch (e) {
        echo 'Something failed!'
        throw e;
    }finally{
        stage('Clear test service !') {
            echo '[INFO] test end !'
            sh 'docker-compose down'
        }
    }
}
