#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE olap;
    GRANT ALL PRIVILEGES ON DATABASE olap TO "$POSTGRES_USER";
EOSQL

# enable extension
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

# get feature_store_schema
gunzip < /feature_store_schema.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap 
