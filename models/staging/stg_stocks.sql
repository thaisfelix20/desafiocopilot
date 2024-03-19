
with source_stocks as (
    select *
    from {{ source('raw', 'stocks') }}

)
select *
from source_stocks
