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
                git branch: 'bh-devops-01-22', url: 'https://github.com/uhuryeu/belhard-devops' 
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
