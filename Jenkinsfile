pipeline {
  agent {
        docker { 
            image 'alpine'
        }
    }
  stages {
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