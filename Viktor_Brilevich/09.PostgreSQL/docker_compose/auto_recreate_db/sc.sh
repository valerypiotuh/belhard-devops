#!/bin/sh
docker-compose down;
docker-compose  build;
docker-compose up -d;

sleep 3;
echo creating db1;
docker exec -it $(docker ps -aq -f "name=postgre_bdold") /dump/create.sh;

echo recreating db2;
docker exec -it $(docker ps -aq -f "name=postgre_bdnew") /dump/recreate.sh;
echo select from db1;
docker exec -it $(docker ps -aq -f "name=postgre_bdold")  psql -U postgres -d belhard -c "select * from devops";
echo select from db2;
docker exec -it $(docker ps -aq -f "name=postgre_bdnew")  psql -U postgres -d belhard -c "select * from devops";
