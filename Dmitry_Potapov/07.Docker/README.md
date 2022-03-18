#create folder 07.Docker
#create folder log
#create file Dockerfile
#create file script entrypoint.sh
chmod +x entrypoint.sh
#build image
docker build . -t speedtest
docker run -d -v ~/homework/belhard-devops-1/Dmitry_Potapov/07.Docker:/app speedtest 
#registered on docker hub as dmitry1potapov
docker tag speedtest dmitry1potapov/speedtest
docker login
docker push dmitry1potapov/speedtest

https://hub.docker.com/u/dmitry1potapov
docker pull dmitry1potapov/speedtest:latest
