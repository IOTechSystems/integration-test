node {
    checkout scm

    try {

        stage('Deploy test service') {
            //sh 'sh deploy-edgeX.sh'
        }


        stage('Run Postman test') {
            sh './bin/run.sh -cd'

            junit './bin/postman-test/newman/**.xml'
        }


    }catch (exc) {
        echo 'Something failed!'

    }finally{
        echo 'test end !'
        sh 'docker-compose down'
    }
}
