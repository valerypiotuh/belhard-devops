pipeline {
  agent {
      docker {
         image 'alpine'
         args '-u root'
         label 'inteliventi'}
      }
  stages {
        stage ("install packages") {
            steps {
                sh '''
                apk update && apk add curl wget git bash speedtest-cli
                '''
            }
        }
        stage("Checkout Git") {
            steps {
                git branch: 'bh-devops-02-22', url: 'https://github.com/sergkharkin/belhard-devops.git' 
            }
        }
        stage("Show files in repository") {
            steps {
                sh '''
                pwd
                ls -lah
                '''
            }
        }
        stage("Test internet connection") {
            steps {
                sh '''
                speedtest-cli
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
