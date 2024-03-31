with 
staffs as (
    select *
    from {{ ref('stg_staffs') }}
)
, stores as (
    select *
    from {{ ref('stg_store') }}
)
, juncao as (
    select 
        staffs.*
        , store.*
    from staffs
    left join stores
        on staff.store_id = store.store_id
)
SELECT *
from juncao
