-- models/staging/stg_pedidos.sql

with source as (
    select * from {{ source('orders_raw', 'sales_recrutement') }}
),

renamed as (
    select
   date_date,
   customer_id,
   order_id,
   products_id,
   net_sales,
   qty
    from source
)

select * from renamed