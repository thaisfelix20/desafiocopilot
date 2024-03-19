
with source_brands as (
    select *
    from {{ source('raw', 'brands') }}

)
select *
from source_brands
