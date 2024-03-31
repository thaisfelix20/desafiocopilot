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
        , stores.store_name as nameStore
        , stores.phone as phoneStore
        , stores.email as emailStore
        , stores.street
        , stores.city
        , stores.state
        , stores.zip_code
    from staffs
    left join stores
        on staffs.store_id = stores.store_id
)
SELECT *
from juncao
