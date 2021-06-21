#!/bin/bash

echo 'Setting up and running a container with PostgreSQL...'

# pulls the official postgres image from Docker Hub if unavailable locally. It then sets up and install Postgres container with the name "postgres-db" and the password "docker"
docker run --name postgres-db -e POSTGRES_PASSWORD=docker -p 5432:5432 -v /my_pgdata:/var/lib/postgresql/data -d postgres 

echo 'Done.'

# sleep action otherwise the following command would not work
sleep 3

echo "Creating table 'cool_tools' in container" 

# this allows us to interact with the container's terminal
docker exec -it postgres-db psql -h localhost -U postgres -a postgres -c "create table cool_tools(id smallint generated by default as identity, name text, url text); select * from cool_tools;"