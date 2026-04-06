-- models/staging/stg_pedidos.sql

with source as (
    select * from {{ source('astrafy', 'sales_recrutement') }}
),

renamed as (
    select
   date_date as date,
   cast(customer_id as STRING) as customer_id,
   CAST(order_id AS STRING) as order_id,
   CAST(products_id as STRING) as product_id,
   net_sales,
   qty
    from source
)

select * from renamed