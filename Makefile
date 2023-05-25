redis-cli:
	docker run -it --rm --network host redis:7.0.11-alpine redis-cli 
postgres-cli:
	docker run -it --rm --network host postgres:12.5-alpine psql -h 0.0.0.0 -U dsp
