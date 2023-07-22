package_name = databases
tag = 0.1.0

help:  
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
redis-cli: ## redis client
	docker run -it --rm --network mini-demand-side-platform redis:7.0.11-alpine redis-cli -h redis
postgres-cli: ## postgres client
	docker run -it --rm --network mini-demand-side-platform postgres:12.5-alpine psql -h postgresql -U dsp
run-all: ## docker compose up 
	docker compose up 
run-all-with-example-data: ## docker compose up with example data
	docker compose -f docker-compose.with-example-data.yml up
