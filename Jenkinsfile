node {
    checkout scm

    try {

        stage('Deploy test service') {
            sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            sh './bin/run.sh -cd'

            junit 'bin/postman-test/newman/**.xml'
        }


    }catch (e) {
        echo 'Something failed!'
        throw e;
    }finally{
        echo '[INFO] test end !'
        sh 'docker-compose down'
    }
}
