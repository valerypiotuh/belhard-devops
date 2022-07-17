pipeline { 
  agent any 
  stages { 
       stage ("Pull image from dockerhub") { 
           steps {
               sh '''
               docker pull daryakap/speedtest
               ''' 
            } 
        } 
        stage ("Run image"){ 
            steps {
                sh '''
                docker run daryakap/speedtest:latest
                ''' 
            } 
        } 
        stage ("docker ps -a") { 
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
