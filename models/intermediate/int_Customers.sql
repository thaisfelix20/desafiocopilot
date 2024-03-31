with 
customers as (
    select *
    from {{ ref('stg_customers') }}
)
, treatingCustomers as (
    select
        customer_id as customerId
        , (first_name || ' ' || last_name) as customerName
        , email as customerEmail
        , phone as customerPhone
        , street as customerStreet
        , city as customerCity
        , state as customerState
        , zip_code as customerZipCode
    from customers
)
select *
from treatingCustomers
