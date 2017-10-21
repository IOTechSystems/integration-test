node {
    checkout scm

    try {

        stage('Deploy test service') {
            sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            sh './bin/run.sh -cd'

            junit './bin/postman-test/newman/**.xml'
        }


    }catch (exc) {
        echo 'Something failed!'
        println(exc.toString());
        println(exc.getMessage());
        println(exc.getStackTrace());
    }finally{
        echo '[INFO] test end !'
        sh 'docker-compose down'
    }
}
