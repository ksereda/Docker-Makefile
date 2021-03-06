# Makefile

postgres_host=localhost:5432
postgres_db=delivery
postgres_user=postgres
postgres_password=postgresPassword
rabbitmq_host=localhost
rabbitmq_default_user=admin
rabbitmq_default_password=admin
rabbitmq_default_vhost=/
project_home=$(shell pwd)


######################################################

up: create-services

run: run-app

data: add-data

down: clean-services

start-services:
	cd docker && docker-compose start

stop-services:
	cd docker && docker-compose stop

create-services:
	make create-netw
	export POSTGRES_USER=${postgres_user} &&\
	export POSTGRES_PASSWORD=${postgres_password} &&\
    export RABBITMQ_DEFAULT_USER=${rabbitmq_default_user} &&\
    export RABBITMQ_DEFAULT_PASS=${rabbitmq_default_password} &&\
	export RABBITMQ_DEFAULT_VHOST=${rabbitmq_default_vhost} &&\
	cd docker && docker-compose up -d
	sleep 10s
	cd docker && docker-compose exec -u postgres postgres psql -c "create database ${postgres_db};"
	cd docker && docker-compose exec -u postgres postgres psql -c "create database jira_adapter;"
	cd docker && docker-compose exec -u postgres postgres psql -c "create database cdp_mailer;"

run-app:
	docker run --name delivery -i --net test1 \
	-e POSTGRES_HOST=${postgres_host} \
	-e POSTGRES_DB=${postgres_db} \
	-e POSTGRES_USER=${postgres_user} \
	-e POSTGRES_PASSWORD=${postgres_password} \
	-e RABBITMQ_HOST=${rabbitmq_host} \
	-e RABBITMQ_DEFAULT_USER=${rabbitmq_default_user} \
	-e RABBITMQ_DEFAULT_PASSWORD=${rabbitmq_default_password} \
	-p 8080:8080 \
	delivery:d

add-data:
	cd docker && docker-compose exec -u postgres postgres psql -d ${postgres_db} -f /home/postgres/cdp_dump.sql

clean-services:
	cd docker && docker-compose down

clean-all-services:
	make stop-services
	make down

down-test-env:
	docker stop post-service-test
	docker rm post-service-test
	docker stop rabb-service-test
	docker rm rabb-service-test

clean-build:
	docker stop build
	docker rm build

clean-all:
	docker stop continuous_delivery
	docker rm continuous_delivery
	docker rmi inhouse:cd
	make clean-all-services
	docker network rm test1

build-script:
	touch build_script
	echo cd /root > build_script
	echo /root/gradlew build -x test >> build_script

up-test-env:
	docker-compose up -d rabbitmq_test

build-jar-test:
	docker run --name build -i --net test-network \
	-v ${project_home}:/root \
	-e POSTGRES_HOST=${POSTGRES_HOST} \
	-e POSTGRES_DB=${POSTGRES_DB} \
	-e POSTGRES_USER=${POSTGRES_USER} \
	-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-e RABBITMQ_HOST=${RABBITMQ_HOST} \
	-e RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER} \
	-e RABBITMQ_DEFAULT_PASSWORD=${RABBITMQ_DEFAULT_PASS} \
	openjdk:8-jdk /bin/bash < build_script

create-netw:
	docker network create test1

build-image:
	docker build -t inhouse:cd .
	make clean-build

build-test:
	make build-script
	make up-test-env
	make build-jar-test
	make down-test-env

run-build:
	docker build -t delivery:d .
	make clean-build
	make run

build-app:
	make build-test
	make up
	make run-build

build-app-data:
	make build-test
	make up
	make data
	make run-build