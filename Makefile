redis-cli:
	docker run -it --rm --network databases_default redis:7.0.11-alpine redis-cli -h redis
postgres-cli:
	docker run -it --rm --network databases_default postgres:12.5-alpine psql -h postgresql -U dsp
run-all:
	docker compose up 
run-all-with-example-data:
	docker compose -f docker-compose.with-example-data.yml up
