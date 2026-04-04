--Exercise 2. What is the number of orders per month in the year 2023?


SELECT COUNT(*) AS orders_count, date_trunc(date_date, MONTH) as month
FROM {{ ref('stg_orders_raw__orders_recrutement') }}
WHERE date_date >= "2023-01-01" AND date_date < "2024-01-1"
GROUP BY month