#!/bin/sh

echo recreating db2;
docker exec -it $(docker ps -aq -f "name=my_docker_2_new") /dump/recreate.sh;

echo select from db2;
docker exec -it $(docker ps -aq -f "name=my_docker_2_new")  psql -U postgres -d belhard -c "select * from devops" > /home/belhard/docker/postgres3/dump/new_request;
