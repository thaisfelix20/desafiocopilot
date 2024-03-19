
with source_products as (
    select *
    from {{ source('raw', 'products') }}

)
select *
from source_products
