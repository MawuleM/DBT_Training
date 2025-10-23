{{config(materialized = 'table')}}
--monthly_new_customers
 SELECT DATE_TRUNC(signup_date, MONTH) as month,
        count(customer_id) as new_customers
 FROM `aivancity-learn.sources_tables.dim_customers`   
 GROUP BY month
 ORDER BY month