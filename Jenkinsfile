pipeline { 
  agent any 
  stages { 
       stage ("Pull image from dockerhub") { 
           steps { 
               docker pull daryakap/speedtest 
            } 
        } 
        stage ("Run image"){ 
            steps { 
                docker run daryakap/speedtest:latest 
            } 
        } 
        stage ("docker ps -a") { 
            steps { 
                docker ps -a 
            } 
        } 
    } 
    post { 
        always { 
            cleanWs() 
        } 
    } 
}
