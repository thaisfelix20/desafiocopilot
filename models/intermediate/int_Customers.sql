with 
customers as (
    select *
    from {{ ref('stg_customers') }}
)
, treatingCustomers as (
    select
        staff_id
        , (first_name || ' ' || last_name) as customerName
        , email as emailCustomer
        , phone as phoneCustomer
        , active
        , store_id
        , manager_id
    from customers
)
SELECT *
from treatingCustomers
