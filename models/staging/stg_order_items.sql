
with source_order_items as (
    select *
    from {{ source('raw', 'order_items') }}

)
select *
from source_order_items
