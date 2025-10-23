{{config(materialized = 'table')}}
--region_performances
SELECT s.region, sum(f.billed_amount) as performance
FROM `aivancity-learn.sources_tables.fact_sales` AS  f
JOIN `aivancity-learn.sources_tables.dim_stores` AS s
ON  s.store_id = f.store_id
GROUP BY  s.region
ORDER BY  s.region