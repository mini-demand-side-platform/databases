#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE olap;
    CREATE DATABASE oltp;
    GRANT ALL PRIVILEGES ON DATABASE olap TO "$POSTGRES_USER";
    GRANT ALL PRIVILEGES ON DATABASE oltp TO "$POSTGRES_USER";
EOSQL

# enable extension
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

# get ctr table
gunzip < /ctr_dataset.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap 

# get ad table
gunzip < /ad.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname oltp 

# get feature_store_schema
gunzip < /feature_store_schema.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap 

# get feature_store table
gunzip < /feature_store_data.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap 

# get offline table
gunzip < /offline_table_top_10_features.sql.gz |psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname olap 
