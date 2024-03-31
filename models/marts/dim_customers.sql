
with 
customers as (
	select * 
    from {{ ref('int_Customers') }}
)
, GeneratingSK as (
    select
        md5(cast(customerId as string)) as Sk_customerId
        , *
    from customers
)
select * 
from GeneratingSK    