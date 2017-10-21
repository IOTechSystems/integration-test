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
        println(ex.toString());
        println(ex.getMessage());
        println(ex.getStackTrace());
    }finally{
        echo '[INFO] test end !'
        sh 'docker-compose down'
    }
}
