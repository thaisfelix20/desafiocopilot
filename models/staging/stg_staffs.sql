
with source_staffs as (
    select *
    from {{ source('raw', 'staffs') }}

)
select *
from source_staffs
