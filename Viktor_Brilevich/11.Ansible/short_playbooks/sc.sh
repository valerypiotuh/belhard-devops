#!/bin/sh
echo creating db1;
docker exec -it $(docker ps -aq -f "name=my_docker_old") /dump/create.sh;

echo recreating db2;
docker exec -it $(docker ps -aq -f "name=my_docker_new") /dump/recreate.sh;
echo select from db1;
docker exec -it $(docker ps -aq -f "name=my_docker_old")  psql -U postgres -d belhard -c "select * from devops" > /home/belhard/docker/postgres2/dump/old_request;
echo select from db2;
docker exec -it $(docker ps -aq -f "name=my_docker_new")  psql -U postgres -d belhard -c "select * from devops" > /home/belhard/docker/postgres2/dump/new_request;
