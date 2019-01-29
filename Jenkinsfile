#!/usr/bin/env groovy

node ("${env.SLAVE}")
{
    stage ('Checkout')
    {
        checkout scm
    }
    stage ('integration-test')
    {
        script 
        {
            def rootDir = pwd()
            if (env.LANG == "GO")
            {
                def integrationTestJob = load "${rootDir}/integrationTestJob_go.groovy"
                integrationTestJob.runNode()
            }
            else if (env.LANG == "JAVA")
            {
                def integrationTestJob = load "${rootDir}/integrationTestJob_java.groovy"
                integrationTestJob.runNode()
            }
        }
    }
    stage('Generate Allure Reports')
    {
        script 
        {
            allure ([
                includeProperties: false,
                jdk: '',
                properties: [],
                reportBuildPolicy: 'ALWAYS',
                results: [[path: 'bin/testResult']]
            ])
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
