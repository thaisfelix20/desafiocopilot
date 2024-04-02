
with 
StaffStore as (
	select * 
    from {{ ref('int_StaffStore') }}
)
, GeneratingSK as (
    select
        cast(CONCAT(staffId,'-', staffId) as string) as Sk_staffStore
        , *
    from StaffStore
)
select * 
from GeneratingSK    