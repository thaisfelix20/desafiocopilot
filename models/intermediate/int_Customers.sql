with 
customers as (
    select *
    from {{ ref('stg_customers') }}
)
, treatingCustomers as (
    select
        customer_id
        , (first_name || ' ' || last_name) as customerName
        , email as emailCustomer
        , phone as phoneCustomer
        , street as streetCustomer
        , city as cityCustomer
        , state as stateCustomer
        , zip_code as ZipCodeCustomer
    from customers
)
select *
from treatingCustomers
