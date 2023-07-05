redis-cli:
	docker run -it --rm --network databases_default redis:7.0.11-alpine redis-cli 
postgres-cli:
	docker run -it --rm --network databases_default postgres:12.5-alpine psql -h postgresql -U dsp
