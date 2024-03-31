
with 
StaffStore as (
	select * 
    from {{ ref('int_StaffStore') }}
)
, GeneratingSK as (
    select
        md5(cast(staffId as string)) as Sk_staffStore
        , *
    from StaffStore
)
select * 
from GeneratingSK    