--Exercice 1:  What is the number of orders in the year 2023?

SELECT 
    COUNT(*) AS orders_count 
FROM {{ ref('stg_orders_raw__orders_recrutement') }}
WHERE date >= "2023-01-01" AND date < "2024-01-01"