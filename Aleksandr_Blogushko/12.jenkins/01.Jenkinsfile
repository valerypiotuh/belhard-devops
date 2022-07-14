pipeline {
  agent {
        docker { 
            image 'alpine'
            args '-u root'
        }
    }
  stages {
        stage("install") {
            steps {
                sh '''
                apk update && apk add --no-cache curl wget git bash speedtest-cli && speedtest-cli
                '''
            }
        }
        stage("Checkout Git") {
            steps {
                git branch: 'bh-devops-02-22', url: 'https://github.com/shadejant/belhard-devops.git' 
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