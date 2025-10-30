{{config(materialized= 'view')}}
SELECT
    *
FROM {{source('raw', 'dim_stores')}}