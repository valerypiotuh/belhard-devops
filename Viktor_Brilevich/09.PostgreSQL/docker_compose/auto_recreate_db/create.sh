#!/bin/sh

psql -U postgres -c "CREATE DATABASE belhard";
psql -U postgres -d belhard -c "CREATE TABLE devops (Id SERIAL PRIMARY KEY, FirstName CHARACTER VARYING(30), LastName CHARACTER VARYING(30), Email CHARACTER VARYING(30), Age INTEGER)";
psql -U postgres -d belhard -c "INSERT INTO devops (FirstName, LastName, Email, Age) VALUES ('Ivan', 'Ivanov', 'ivanov@test.com', 30), ('Petr', 'Petrov', 'petrov@test.com', 35), ('Ivan', 'Sidorov', 'sidorov@test.com', 40)";

pg_dumpall -U postgres > /dump/dumpfull
