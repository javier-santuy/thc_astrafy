
-- Exercice 3: What is the average number of products per order for each month of the year 2023?

WITH
  summary AS (
    SELECT date, order_id, sum(qty) as order_qty
    from {{ ref('stg_orders_raw__sales_recrutement') }}
    where date >= "2023-01-01" and date < "2024-01-01"
    GROUP BY date, order_id
  )
SELECT  EXTRACT(MONTH FROM date)
 as month, round(avg(order_qty),2) as avg_products_per_order
FROM summary
group by month