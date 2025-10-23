--loyalty_level
SELECT loyalty_level, count(customer_id) as nb_customers
FROM `aivancity-learn.sources_tables.dim_customers`
GROUP BY loyalty_level
