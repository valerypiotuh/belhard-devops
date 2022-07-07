pipeline {
  agent {
        docker { 
            image 'alpine'
        }
    }
  stages {
        stage("Initial config") {
            steps {
                script {
                    properties([pipelineTriggers([pollSCM('* * * * *')])])
                }
            }
        }
        stage("Checkout Git") {
            steps {
                git branch: 'bh-devops-02-22', url: 'https://github.com/valerypiotuh/belhard-devops.git' 
            }
        }
        stage("List repository") {
            steps {
                sh '''
                ls -la
                '''
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
