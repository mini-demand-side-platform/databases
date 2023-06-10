#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE olap;
    CREATE DATABASE oltp;
    CREATE DATABASE feature_store;
    GRANT ALL PRIVILEGES ON DATABASE olap TO "$POSTGRES_USER";
    GRANT ALL PRIVILEGES ON DATABASE oltp TO "$POSTGRES_USER";
    GRANT ALL PRIVILEGES ON DATABASE feature_store TO "$POSTGRES_USER";
EOSQL
gunzip < /ctr_dataset.gz |psql --username "$POSTGRES_USER" --dbname olap 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname oltp <<-EOSQL
    CREATE TABLE ad (
        ad_id integer NOT NULL,
        status boolean,
        bidding_cpc integer,
        advertiser text,
        banner_style text,
        category text,
        layout_style text,
        item_price  double precision
    );
    INSERT INTO 
        ad (ad_id, status, bidding_cpc, advertiser, category, banner_style, layout_style, item_price)
    VALUES
        (682,False,4,'WFQ','Trouser', 'XVII', 'VE',1621.07),
        (787, True, 1, 'DO', 'Pullover', 'XII', 'JV', 812.32),
        (140, True, 5, 'IDP', 'Sandal', 'XX', 'EJ', 3497.80),
        (1365, False, 5, 'DLW', 'hello', 'XI', 'FT', 0.0),
        (491, False, 2, 'FP', 'Trouser', 'VI', 'QT', 8.12),
        (292, False, 2, 'WBJ', 'Dress', 'XVI', 'OU', 835.69),
        (9000, True, 1, 'DGG', 'BW', 70, '1.ayz', 6.71),
        (1849, True, 4, 'ICZ', 'Dress', 'I', 'BN', 2458.38),
        (1955, True, 8, 'IBE', 'Coat', 'I', 'KX', 1322.76), 
        (1504, False, 5, 'AJL', 'Ankle boot', 'III', 'HA', 3183.88);
EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname feature_store <<-EOSQL
    CREATE TABLE feature_store (
        feature_store_id SERIAL PRIMARY KEY,
        feature_store_name text,
        description text,
        offline_table_name text
    );
    CREATE TABLE feature (
        feature_store_id INTEGER REFERENCES feature_store (feature_store_id),
        feature_id SERIAL PRIMARY KEY,
        feature_name text,
        description text,
        function_name text
    );
EOSQL