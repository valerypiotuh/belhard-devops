pipeline {
  agent any
  stages {
        stage("pull image") {
            steps {
                sh '''
                docker pull shadejant/speedtest:latest
                '''
            }
        }
        stage("run image") {
            steps {
                sh '''
                docker run shadejant/speedtest:latest
                '''
            }
        }
        stage("ps") {
            steps {
                sh '''
                docker ps -a
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
