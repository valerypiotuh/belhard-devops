#!/bin/sh
echo creating db1;
docker exec -it $(docker ps -aq -f "name=my_docker_1_old") /dump/create.sh;

docker exec -it $(docker ps -aq -f "name=my_docker_1_old")  psql -U postgres -d belhard -c "select * from devops" > /home/belhard/docker/postgres3/dump/old_request;

