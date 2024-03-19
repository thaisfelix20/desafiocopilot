
with source_customers as (
    select *
    from {{ source('raw', 'customers') }}

)
select *
from source_customers
