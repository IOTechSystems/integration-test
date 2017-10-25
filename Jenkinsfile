node {
    checkout scm

    try {

        stage('Deploy test service') {
            sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            sh 'docker-compose exec -T volume rm -rf /etc/newman/newman/'

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
