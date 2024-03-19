
with source_categories as (
    select *
    from {{ source('raw', 'categories') }}

)
select *
from source_categories
