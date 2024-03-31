with 
customers as (
    select *
    from {{ ref('stg_customers') }}
)
SELECT *
from customers
