#!/usr/bin/env groovy

node ("${env.SLAVE}")
{
    stage ('integration-test')
    {
        script 
        {
            checkout scm
            def rootDir = pwd()
            if (env.LANG == "GO")
            {
                def integrationTestJob = load "${rootDir}/integrationTestJob_go.groovy"
            }
            else if (env.LANG == "JAVA")
            {
                def integrationTestJob = load "${rootDir}/integrationTestJob_java.groovy"
            }

            integrationTestJob.runNode()
        }
    }
    stage ("Archive Artifacts")
    {
        archiveArtifacts artifacts: 'bin/testResult/**.xml'
    }
    stage ("Clean")
    { 
        cleanWs ()
    }
}
