--monthly_new_customers
 SELECT DATE_TRUNC (signup_date, MONTH) as month,
        count(customer_id) as new_customers
 FROM `aivancity-learn.sources_tables.dim_customers`   
 GROUP BY month
 ORDER BY month


-- loyalty_rate
SELECT is_loyalty_member, count(customer_id) as nb_customers
FROM `aivancity-learn.sources_tables.dim_customers`
GROUP BY is_loyalty_member

--loyalty_level
SELECT loyalty_level, count(customer_id) as nb_customers
FROM `aivancity-learn.sources_tables.dim_customers`
GROUP BY loyalty_level

--monthly_turnover
SELECT DATE_TRUNC (sale_date,month) as month, DATE_TRUNC (sale_date, year) as year, sum(billed_amount) as turnover
FROM `aivancity-learn.sources_tables.fact_sales`
GROUP BY  year, month
ORDER BY  year, month

--monthly_nb_sales
SELECT DATE_TRUNC (sale_date,month) as month, DATE_TRUNC (sale_date, year) as year, count(billed_amount) as number_sales
FROM `aivancity-learn.sources_tables.fact_sales`
GROUP BY  year, month
ORDER BY  year, month

--subcategory_performances
SELECT p.category, p.subcategory, sum(f.billed_amount) as performance
FROM `aivancity-learn.sources_tables.fact_sales` AS  f
JOIN `aivancity-learn.sources_tables.dim_products` AS p
ON  p.product_id = f.product_id
GROUP BY  p.category, p.subcategory
ORDER BY  p.category, p.subcategory

SELECT s.region, sum(f.billed_amount) as performance
FROM `aivancity-learn.sources_tables.fact_sales` AS  f
JOIN `aivancity-learn.sources_tables.dim_stores` AS s
ON  s.store_id = f.store_id
GROUP BY  s.region
ORDER BY  s.region

SELECT *
FROM `aivancity-learn.sources_tables.fact_sales`
