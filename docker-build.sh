#!/usr/bin/env bash

# ENVIRONMENT VARIABLES
POSTGRES_HOST=post-service
POSTGRES_DB=delivery_service
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgresPassword

RABBITMQ_HOST=rabb-service
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=admin
RABBITMQ_DEFAULT_VHOST=/

PROJECT_HOME=$(pwd)


# PERFORM CLEANING
cleanup() {
    docker stop service-postgres
    docker rm service-postgres

    docker stop service-rabbit
    docker rm service-rabbit
}
cleanup

# PERFORM BUILD SCRIPT
touch build_script
echo cd /root > build_script
echo ./gradlew build -x test >> build_script


# RUN POSTGRES
docker run -d --name service-postgres -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
                                      -e POSTGRES_USER=${POSTGRES_USER} \
                                      -e POSTGRES_DB=${POSTGRES_DB} \
                                      postgres

# RUN RABBITMQ
docker run -d --name service-rabbit -e RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER} \
                                    -e RABBITMQ_DEFAULT_PASS=${RABBITMQ_DEFAULT_PASS} \
                                    rabbitmq:3-management


# BUILD APPLICATION
docker run --name build -i --link=service-postgres:${POSTGRES_HOST} --link=service-rabbit:${RABBITMQ_HOST} \
                             -v ${PROJECT_HOME}:/root \
                             -e POSTGRES_HOST=${POSTGRES_HOST} \
                             -e POSTGRES_DB=${POSTGRES_DB} \
                             -e POSTGRES_USER=${POSTGRES_USER} \
                             -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
                             -e RABBITMQ_HOST=${RABBITMQ_HOST} \
                             -e RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER} \
                             -e RABBITMQ_DEFAULT_PASSWORD=${RABBITMQ_DEFAULT_PASS} \
                             openjdk:8-jdk /bin/bash < build_script

# BUILD IMAGE
docker build -t delivery_service:ds .

#
## RUN CLEANING
#cleanup
#rm build_script


# RUN APP
docker run --name delivery_service -i \
                   --link=service-postgres:${POSTGRES_HOST} --link=service-rabbit:${RABBITMQ_HOST} \
                   -e POSTGRES_HOST=${POSTGRES_HOST} \
                   -e POSTGRES_DB=${POSTGRES_DB} \
                   -e POSTGRES_USER=${POSTGRES_USER} \
                   -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
                   -e RABBITMQ_HOST=${RABBITMQ_HOST} \
                   -e RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER} \
                   -e RABBITMQ_DEFAULT_PASSWORD=${RABBITMQ_DEFAULT_PASS} \
                   -p 8080:8080 \
                   delivery_service:ds