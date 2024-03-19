
with source_store as (
    select *
    from {{ source('raw', 'stores') }}

)
select *
from source_store
