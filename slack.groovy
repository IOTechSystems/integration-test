/**
 * Slack notification
 *
 */
def post(color, message) {
    def slack_channel = "#qa"
    def slack_domain  = "iotech-group"
    def detail_link   = "(<${env.BUILD_URL}|Open>)"
    def slack_msg     = "job ${env.JOB_NAME}[No.${env.BUILD_NUMBER}] was test ${currentBuild.result}. ${detail_link} \n\n ${message}"

    withCredentials([string(credentialsId: '6xw3fGZbX8BWiY87xprk8DM3', variable: 'Token')]) {
        slackSend channel: "${slack_channel}", color: "${color}", message: "${slack_msg}", teamDomain: "${slack_domain}", token: "${Token}"
    }
}
return this