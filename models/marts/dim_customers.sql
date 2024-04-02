
with 
customers as (
	select * 
    from {{ ref('int_Customers') }}
)
, GeneratingSK as (
    select
        cast(CONCAT(customerId,'-', customerId) as string) as Sk_customerId
        , *
    from customers
)
select * 
from GeneratingSK    