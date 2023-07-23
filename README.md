# Databases
This is the databases config files for the [mini-demand-side-platform](https://github.com/mini-demand-side-platform/mini-demand-side-platform).


## Contain
The username of the following databases is `dsp`, with the password `dsppassword`.
#### Postgresql
Data for [machine learning training](https://github.com/mini-demand-side-platform/ml-training), [feature store](https://github.com/mini-demand-side-platform/feature-store) and the [bidder server](https://github.com/mini-demand-side-platform/bidding-server).


#### Redis
Data for [feature store](https://github.com/mini-demand-side-platform/feature-store) and the [bidder server](https://github.com/mini-demand-side-platform/bidding-server) during machine learning inference.
#### Minio
Storage for machine learning model.
## Usages

#### Postgres cli  
```bash
make postgres-cli
```
#### Redis cli  
```bash
make redis-cli
```
#### Minio UI 
http://localhost:9000

## Requirements
- Docker 
- Docker-compose 
- make
## Setup
```bash
make run-all-with-example-data
```
## Reference
https://stackoverflow.com/questions/72867045/minio-docker-container-does-not-show-files-from-local-folder