#!/usr/bin/env bash

DIR=`date +%d-%m-%y-%T`
DEST=$PWD/backups/$DIR
mkdir -p $DEST


MONGO_USER=admin
MONGO_PASSWORD=password
MONGO_DB=admin
CONTAINER_ID=$(docker ps -f name=mongo --quiet)

echo $CONTAINER_ID $MONGO_USER $MONGO_PASSWORD

docker exec -i $CONTAINER_ID /usr/bin/mongodump --username $MONGO_USER --password $MONGO_PASSWORD --authenticationDatabase admin  --out /dump

docker cp $CONTAINER_ID:/dump $DEST