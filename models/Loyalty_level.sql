
-- loyalty_rate
SELECT is_loyalty_member, count(customer_id) as nb_customers
FROM `aivancity-learn.sources_tables.dim_customers`
GROUP BY is_loyalty_member
