-- models/staging/stg_pedidos.sql

with source as (
    select * from {{ source('astrafy', 'orders_recrutement') }}
),

renamed as (
    select
   date_date,
   customers_id,
   orders_id,
   net_sales
    from source
)

select * from renamed