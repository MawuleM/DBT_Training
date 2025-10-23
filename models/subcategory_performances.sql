{{config(materialized = 'table')}}
--subcategory_performances
SELECT p.category, p.subcategory, sum(f.billed_amount) as performance
FROM `aivancity-learn.sources_tables.fact_sales` AS  f
JOIN `aivancity-learn.sources_tables.dim_products` AS p
ON  p.product_id = f.product_id
GROUP BY  p.category, p.subcategory
ORDER BY  p.category, p.subcategory
