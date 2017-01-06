#!/usr/bin/env bash

DEPLOY_URL=tcp://127.0.0.1:4243;
DOCKER_APP_NAME=app;

EXIST_BLUE=$(DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml ps | grep Up);

#DOCKER_HOST=tcp://127.0.0.1:4243 docker-compose -p app-blue -f docker-compose.blue.yml up --build -d;

if [ -z "$EXIST_BLUE" ]; then
    echo ">>>>>>>>>>>> EXIST BLUE...";
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml down;
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml up -d;
else
    echo ">>>>>>>>>>>> EXIST GREEN...";
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-blue -f docker-compose.blue.yml down;
    DOCKER_HOST=${DEPLOY_URL} docker-compose -p ${DOCKER_APP_NAME}-green -f docker-compose.green.yml up -d;
fi