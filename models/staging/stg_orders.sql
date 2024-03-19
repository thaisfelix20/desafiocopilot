
with source_orders as (
    select *
    from {{ source('raw', 'orders') }}

)
select *
from source_orders
