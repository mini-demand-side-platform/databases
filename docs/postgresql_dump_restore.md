# postgresql dump and restore

## dump feature store schema
```bash
pg_dump -U dsp -d olap -t feature -t feature_store --schema-only | gzip > feature_store_schema.sql.gz
```
## dump feature store data  
```bash
pg_dump -U dsp -d olap -t feature -t feature_store --data-only | gzip > feature_store_data.sql.gz
```

## dump offline table
```bash
pg_dump -U dsp -d olap -t top_10_features | gzip > offline_table_top_10_features.sql.gz
```

## dump oltp
```bash
pg_dump -U dsp -d oltp -t ad | gzip > ad.sql.gz
```