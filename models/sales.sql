CREATE TABLE `aivancity-learn.sources_tables.montly_new_customers` AS
SELECT DATE_TRUNC (signup_date, MONTH) as month,
        count(customer_id) as new_customers
    FROM `aivancity-learn.sources_tables.dim_customers`
GROUP BY month;

SELECT *
FROM `aivancity-learn.sources_tables.montly_new_customers`