# Using Docker with docker-compose and makefile for Gradle project (Linux)


## Development

For easy starting application, you need:
* `make up` - This command pull required docker images and start containers(postgres, rabbit_mq) with parameters:
    * postgres_host=localhost:5432
    * postgres_db=test
    * postgres_user=postgres
    * postgres_password=postgresPassword
    * rabbitmq_host=localhost
    * rabbitmq_default_user=admin
    * rabbitmq_default_password=admin
    * rabbitmq_default_vhost=/
* `make data` - This command applying dump `docker/db_migration/cdp_dump.sql` (WARNING: only to a clean database!).
* `make run` - This command run application.
* `make clean-services` - This command clean services.
* `make stop-services` - This command stop all the services.



